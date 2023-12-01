import 'package:flutter/material.dart';

// TBD might change all of it.
class CheckoutScreen extends StatelessWidget {
  final String restaurantName;
  final String itemName;
  final String itemDescription;
  final double itemPrice;

  CheckoutScreen({
    required this.restaurantName,
    required this.itemName,
    required this.itemDescription,
    required this.itemPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Your Order'),
          ],
        ),
      ),
    );
  }
}
