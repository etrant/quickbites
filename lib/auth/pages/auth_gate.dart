import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickbites/auth/pages/login_or_register.dart';
import 'package:quickbites/customer/pages/Dashboard/dashboard.dart';
import 'package:quickbites/driver/pages/driver_home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          return snapshot.hasData
              ? CustomerDashBoardApp()
              : LoginOrRegisterPage();
          // return snapshot.hasData
          //     ? const DriverHomePage()
          //     : const LoginOrRegisterPage();
          // return snapshot.hasData ? HomePage() : LoginOrRegisterPage();
        },
      ),
    );
  }
}
