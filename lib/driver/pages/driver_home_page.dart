// ignore_for_file: constant_identifier_names, prefer_collection_literals

import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quickbites/auth/components/my_button.dart';
import 'package:quickbites/customer/pages/Dashboard/dashboard.dart';

// GSU Aderhold
late LatLng SOURCE_LOCATION = LatLng(33.77397198231519, -84.36180263915438);
// Chipotle on Ponce
late LatLng DEST_LOCATION = LatLng(33.754729342462596, -84.38796282423505);
const double CAMERA_ZOOM = 13.5;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class DriverHomePage extends StatefulWidget {
  const DriverHomePage({super.key});

  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  late GoogleMapController mapController;

  Set<Marker> myMarkers = Set<Marker>();

  LatLng? currentLocation;
  LatLng? destLocation;

  late LatLngBounds bounds = LatLngBounds(
    southwest: currentLocation!,
    northeast: destLocation!,
  );
  late LatLng centerBounds;

  Set<Polyline> myPolylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints? polylinePoints;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  Future<void> setGlobalPosition() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('orders').limit(1).get();

    var orderInfo = querySnapshot.docs[0].data() as Map<String, dynamic>;

    SOURCE_LOCATION = LatLng(
      orderInfo['restaurant_address'][0],
      orderInfo['restaurant_address'][1],
    );
    DEST_LOCATION = LatLng(
      orderInfo['delivery_address'][0],
      orderInfo['delivery_address'][1],
    );
  }

  void setInitialLocation() {
    currentLocation = LatLng(
      SOURCE_LOCATION.latitude,
      SOURCE_LOCATION.longitude,
    );

    destLocation = LatLng(
      DEST_LOCATION.latitude,
      DEST_LOCATION.longitude,
    );
  }

  void showPinsOnMap() {
    myMarkers.add(
      Marker(
        markerId: const MarkerId('sourcePin'),
        position: currentLocation!,
      ),
    );
    myMarkers.add(
      Marker(
        markerId: const MarkerId('destPin'),
        position: destLocation!,
      ),
    );
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints!.getRouteBetweenCoordinates(
      dotenv.env['API_KEY']!,
      PointLatLng(currentLocation!.latitude, currentLocation!.longitude),
      PointLatLng(destLocation!.latitude, destLocation!.longitude),
    );

    if (result.status == 'OK') {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }

      setState(() {
        myPolylines.add(
          Polyline(
              width: 10,
              polylineId: const PolylineId('polyLine'),
              color: Colors.blue,
              points: polylineCoordinates),
        );
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  late final Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;

  bool driving = false;
  void toggleTime() {
    driving = !driving;
    if (driving) {
      _stopwatch.start();
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
        setState(() {}); // Update the UI every second
      });
    } else {
      _stopwatch.stop();
      _stopwatch.reset();
      _timer.cancel();
    }
    setState(() {});
  }

  String getFormattedTime() {
    var hours = _stopwatch.elapsed.inHours;
    var minutes = _stopwatch.elapsed.inMinutes % 60;
    var seconds = _stopwatch.elapsed.inSeconds % 60;

    return '${hours.toString().padLeft(2, '0')}h:${minutes.toString().padLeft(2, '0')}m:${seconds.toString().padLeft(2, '0')}s';
  }

  @override
  void initState() {
    super.initState();
    setGlobalPosition();
    setInitialLocation();
    showPinsOnMap();

    // Determine the southwest and northeast corners
    LatLng southwest = LatLng(
      min(currentLocation!.latitude, destLocation!.latitude),
      min(currentLocation!.longitude, destLocation!.longitude),
    );
    LatLng northeast = LatLng(
      max(currentLocation!.latitude, destLocation!.latitude),
      max(currentLocation!.longitude, destLocation!.longitude),
    );

    bounds = LatLngBounds(
      southwest: southwest,
      northeast: northeast,
    );

    centerBounds = LatLng(
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
    );

    polylinePoints = PolylinePoints();
    setPolylines();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      bearing: CAMERA_BEARING,
      // tilt: CAMERA_TILT,
      target: centerBounds,
    );

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: signUserOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text(
                  "QuickBites",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.food_bank),
              title: const Text(
                "Customer",
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => CustomerDashBoardApp()),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              myLocationEnabled: true,
              // compassEnabled: true,
              zoomControlsEnabled: false,
              tiltGesturesEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: initialCameraPosition,
              // initialCameraPosition: CameraPosition(
              //   target: _center,
              //   zoom: 11.0,
              // ),
              onMapCreated: _onMapCreated,
              markers: myMarkers,
              polylines: myPolylines,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getFormattedTime(),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Text(
                        " Current Drive",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Resturant: Chipotle",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "3 Items in order",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 25),
                  MyButton(
                    text: driving ? "End Drive" : "Start Drive",
                    onTap: toggleTime,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
