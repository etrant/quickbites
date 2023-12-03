import 'package:flutter/material.dart';
import 'package:quickbites/customer/pages/ConfirmPay/confirm.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key});

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
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.left,
                    ),
                    const CheckoutItemWidget(),
                    const Text("Payments", style: TextStyle(fontSize: 22)),
                    const ListTile(
                      leading: Icon(Icons.credit_card_outlined,
                          size: 50, color: Colors.black),
                      title: Text('Add a Payment Method',
                          style: TextStyle(fontSize: 20)),
                      trailing:
                          Icon(Icons.arrow_forward_ios, color: Colors.black),
                      mouseCursor: SystemMouseCursors.click,
                    ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OrderConfirmation()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Place order',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const Text('\$10.00',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
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
      trailing: Container(
        width: 100,
        height: 150,
        child: ClipRRect(
          child: Image.asset(
            'lib/customer/pages/Menu/assets/redlobster/cajun_linguini.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
