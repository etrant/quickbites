import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// GSU Aderhold
// Chipotle on Ponce
const LatLng SOURCE_LOCATION = LatLng(33.754729342462596, -84.38796282423505);
const LatLng DEST_LOCATION = LatLng(33.77397198231519, -84.36180263915438);
const double CAMERA_ZOOM = 14;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class DriverHomePage extends StatefulWidget {
  DriverHomePage({super.key});

  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  final User? user = FirebaseAuth.instance.currentUser;

  late GoogleMapController mapController;

  // BitmapDescriptor? sourceIcon;
  // BitmapDescriptor? destIcon;

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
        markerId: MarkerId('sourcePin'),
        position: currentLocation!,
      ),
    );
    myMarkers.add(
      Marker(
        markerId: MarkerId('destPin'),
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
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      });

      setState(() {
        myPolylines.add(Polyline(
            width: 10,
            polylineId: PolylineId('polyLine'),
            color: Colors.blue,
            points: polylineCoordinates));
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    this.setInitialLocation();
    this.showPinsOnMap();

    bounds = LatLngBounds(
      southwest: currentLocation!,
      northeast: destLocation!,
    );

    centerBounds = LatLng(
      (bounds.northeast.latitude + bounds.southwest.latitude) / 2,
      (bounds.northeast.longitude + bounds.southwest.longitude) / 2,
    );

    polylinePoints = PolylinePoints();
    this.setPolylines();
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
        backgroundColor: Colors.grey[900],
        actions: <Widget>[
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      drawer: Drawer(),
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
          // TODO: Info box for drive time, order. etc
        ],
      ),
    );
  }
}
