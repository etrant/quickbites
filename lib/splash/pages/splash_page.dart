import 'package:flutter/material.dart';
import 'package:quickbites/auth/pages/auth_gate.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => AuthGate()),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // 'Red Devil' by Humi's request
        decoration: BoxDecoration(color: Color(0xff860111)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.food_bank, size: 100, color: Colors.white),
            Text(
              "Quick Bites",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
