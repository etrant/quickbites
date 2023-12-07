import 'package:flutter/material.dart';
import 'package:quickbites/customer/pages/Checkout/checkout.dart';
import 'package:quickbites/customer/order_tracking/widgets/delivery_progress_bar.dart';
// import 'package:quickbites/customer/pages/Dashboard/dashboard.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({super.key});
  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  bool isTracking = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirmation (Restaurant Name)',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
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
                    Text(
                      'Order # Placed',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    CheckoutItemWidget(),
                    isTracking ? DeliveryProgessBar() : Text(''),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Container(
                        width: 400,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Wow, you really know about food!!!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Your order should be there in 10-15 minutes!",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.auto_awesome_mosaic_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Find",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.price_change_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Order",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.car_rental_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Track",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.dinner_dining_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                Text(
                                  "Relish",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Our Drivers?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "They are some of the best in town!!",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    !isTracking
                        ? Text(
                            "Start tracking your order by clicking the button below",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          )
                        : Text(''),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
            ), // Adjust the value as needed
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: !isTracking
                  ? ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isTracking = true;
                        });
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
                        'Track Order',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : const Text(''),
            ),
          ),
        ],
      ),
    );
  }
}
