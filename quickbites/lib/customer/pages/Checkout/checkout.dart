import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quickbites/customer/pages/Checkout/services/add_order.dart';
import 'package:quickbites/customer/pages/Checkout/services/addcard.dart';
import 'package:quickbites/customer/pages/ConfirmPay/confirm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout (Restaurant Name)',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Order',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    const CheckoutItemWidget(),
                    const CheckoutItemWidget(),
                    const CheckoutItemWidget(),
                    const Text("Payments",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    ListTile(
                      onTap: () {
                        // Use Navigator.push inside a function or anonymous function
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCardScreen(),
                          ),
                        );
                      },
                      dense: false,
                      contentPadding: EdgeInsets.all(16.0),
                      leading: Icon(Icons.add_card_outlined,
                          size: 45, color: Colors.black),
                      title: Text('Add a Payment Method',
                          style: TextStyle(fontSize: 18)),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.black),
                    ),
                    const SavedPayments(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 16.0), // Adjust the value as needed
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: ElevatedButton(
                onPressed: () {
                  // orderService.createOrder();       //uncomment this out later!
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderConfirmation(),
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
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Place order',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '\$10.00',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutItemWidget extends StatelessWidget {
  const CheckoutItemWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: false,
      contentPadding: const EdgeInsets.all(16.0),
      title: const Text('Item',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: const Text(
        'Item Description\n\$10.00',
      ),
      trailing: FractionallySizedBox(
        widthFactor: 0.25, // 20% of the parent ListTile width
        heightFactor: 1.5, // Takes full height of the parent ListTile
        child: ClipRRect(
          child: Image.asset(
            'lib/customer/pages/Menu/assets/wendys/baconator.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SavedPayments extends StatelessWidget {
  const SavedPayments({Key? key});

  Future<List<String>> _getLast4Digits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cardList = prefs.getStringList('cardList') ?? [];

    // Print the retrieved cardList for debugging
    print('Retrieved cardList: $cardList');

    List<String> last4DigitsList = [];

    // Retrieve the last 4 digits for each saved card information
    for (String lastCardInfoString in cardList) {
      try {
        // Decode the JSON string
        Map<String, dynamic> lastCardInfo = json.decode(lastCardInfoString);

        String cardNumber = lastCardInfo['cardNumber'];

        // Extract and add the last 4 digits to the list
        last4DigitsList.add(cardNumber.substring(cardNumber.length - 4));
      } catch (e) {
        // Handle the case where decoding fails
        print('Error decoding lastCardInfo: $e');
        // You can skip the invalid entry or handle it as needed
      }
    }

    return last4DigitsList;
  }

  @override
  Widget build(BuildContext context) {
    print('SavedPayments is being rebuilt!');
    return FutureBuilder<List<String>>(
      future: _getLast4Digits(),
      builder: (context, snapshot) {
        try {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Saved Payments",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  for (String last4Digits in snapshot.data!)
                    Row(
                      children: [
                        Icon(
                          Icons.credit_card_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8.0),
                        Text("*$last4Digits",
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                ],
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text("Saved Payments: No saved cards"),
            );
          }
        } catch (e) {
          print('Error: $e');
          return Text("Error occurred");
        }
      },
    );
  }
}
