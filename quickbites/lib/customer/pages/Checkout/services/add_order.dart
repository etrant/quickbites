import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbites/customer/order_tracking/models/order.dart';
import 'package:quickbites/customer/pages/Menu/menu.dart';

class OrderService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createOrder(BuildContext context) async {
    final order = Provider.of<OrderProvider>(context).currentOrder;
    ItemOrder newOrder = ItemOrder(
      orderitems: order.items.keys.toList(),
      orderTotal: order.orderTotal,
      restaurantName: order.restaurantName,
      restaurantAddress: order.address,
      restaurantLatitude: order.latitude,
      restaurantLongitude: order.longitude,
    );
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(newOrder.toMap());
  }
}
