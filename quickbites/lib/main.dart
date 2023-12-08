import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbites/customer/pages/Checkout/checkout.dart';
import 'package:quickbites/customer/pages/Dashboard/dashboard.dart';
import 'package:quickbites/customer/pages/Menu/menu.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => OrderProvider(Order()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CustomerDashBoardApp(),
    );
  }
}
