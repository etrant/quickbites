import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quickbites/customer/pages/Checkout/checkout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  Future<void> _saveCardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? cardList = prefs.getStringList('cardList') ?? [];

    Map<String, String> cardInfo = {
      'cardNumber': _cardNumberController.text,
      'expiryDate': _expiryDateController.text,
      'cvv': _cvvController.text,
    };

    // Convert the map to a JSON-formatted string using json.encode
    String cardInfoJson = json.encode(cardInfo);

    cardList.add(cardInfoJson);

    prefs.setStringList('cardList', cardList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Card',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: _cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Card Number',
              ),
            ),
            TextField(
              controller: _expiryDateController,
              decoration: const InputDecoration(
                labelText: 'Expiry Date',
              ),
            ),
            TextField(
              controller: _cvvController,
              decoration: const InputDecoration(
                labelText: 'CVV',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await _saveCardInfo();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(16.0),
              ),
              child: const Text(
                'Add Card',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
