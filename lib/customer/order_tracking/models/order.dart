import 'package:cloud_firestore/cloud_firestore.dart';

class ItemOrder {
  final Order? order;
  final List<String> orderitems; // the names of the items
  final double orderTotal;
  final String restaurantName;
  final String restaurantAddress;
  final double restaurantLatitude;
  final double restaurantLongitude;

  const ItemOrder({
    required this.orderitems,
    required this.orderTotal,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.restaurantLatitude,
    required this.restaurantLongitude,
    this.order,
  });

  Map<String, dynamic> toMap() {
    return {
      "order_items": orderitems,
      "orderTotal": orderTotal,
      "restaurantName": restaurantName,
      "restaurantAddress": restaurantAddress,
      "restaurantLatitude": restaurantLatitude,
      "timestamp": Timestamp.now()
    };
  } // returns a map structure consisting of the fields
}
