import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderService {
  Future<void> createOrder(BuildContext context, var order) async {
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(
      {
        "restaurantName": order.items.restaurantName,
        "latitude": order.items.latitude,
        "longitude": order.items.longitude,
        "address": order.items.address,
        "orderTotal": order.items.orderTotal,
        "items": order.items
      },
    );
  }
}
