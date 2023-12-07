import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quickbites/customer/order_tracking/models/order.dart';

class OrderService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void createOrder() async {
    ItemOrder newOrder = const ItemOrder(
      orderitems: ["Supreme Chalupa"],
      orderTotal: 5.60,
      restaurantName: "Taco Bell",
      restaurantAddress: "429 Ponce De Leon Ave NE",
    );
    await FirebaseFirestore.instance
        .collection('orders')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set(newOrder.toMap());
  }
}
