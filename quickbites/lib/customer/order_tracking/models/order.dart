import 'package:cloud_firestore/cloud_firestore.dart';

class ItemOrder {
  final List<String> orderitems; // the names of the items
  final double orderTotal;
  final String restaurantName;
  final String restaurantAddress;

  const ItemOrder({
    required this.orderitems,
    required this.orderTotal,
    required this.restaurantName,
    required this.restaurantAddress,
  });

  Map<String, dynamic> toMap() {
    return {
      "order_items": orderitems,
      "orderTotal": orderTotal,
      "restaurantName": restaurantName,
      "restaurantAddress": restaurantAddress,
      "timestamp": Timestamp.now()
    };
  } // returns a map structure consisting of the fields
}
