import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
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
                    const CheckoutItemWidget(),
                    const CheckoutItemWidget(),
                    const CheckoutItemWidget(),
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
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
      title: const Text('Burger', style: TextStyle(fontSize: 20)),
      subtitle: const Text('Burger with fries and coke'),
      trailing: Image.asset(
          'lib/customer/pages/Menu/assets/redlobster/cajun_linguini.jpg'),
    );
  }
}
