import 'package:flutter/material.dart';

class CustomerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'QuickBites',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to the Food Delivery Dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
