import 'package:flutter/material.dart';
import 'package:quickbites/customer/pages/ConfirmPay/confirm.dart';
import 'package:quickbites/customer/pages/Menu/menu.dart';

class CustomerDashBoardApp extends StatelessWidget {
  const CustomerDashBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Customer Dashboard',
      initialRoute: '/customerDash',
      routes: {
        '/customerDash': (context) => const CustomerDashboard(),
        '/tbMenu': (context) => const MenuScreen(restaurantName: "Taco Bell"),
        '/zaxbysMenu': (context) => const MenuScreen(restaurantName: "Zaxby's"),
        '/redlobsterMenu': (context) => const MenuScreen(
              restaurantName: "Red Lobster",
            ),
        '/popeyesMenu': (context) => const MenuScreen(
              restaurantName: "Popeyes",
            ),
        '/wendysMenu': (context) => const MenuScreen(
              restaurantName: "Wendys",
            ),
        '/orderConfirm': (context) => const OrderConfirmation(),
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

class CustomerDashboard extends StatelessWidget {
  const CustomerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'QuickBites',
          textAlign: TextAlign.center,
        ),
      ),
      body: const Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Featured Restaurants',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.left,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RestaurantCard(
                name: 'Taco Bell',
                imgURL: 'lib/customer/pages/Dashboard/assets/tacobell.jpg',
                distance: 1,
                rating: 3.7,
                price: "\$",
                route: '/tbMenu',
              ),
              RestaurantCard(
                name: 'Zaxby\'s',
                imgURL: 'lib/customer/pages/Dashboard/assets/zaxbys.jpg',
                distance: 2.5,
                rating: 4.2,
                price: "\$",
                route: '/zaxbysMenu',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RestaurantCard(
                name: 'Red Lobster',
                imgURL: 'lib/customer/pages/Dashboard/assets/redlobster.jpg',
                distance: 3.0,
                rating: 4.3,
                price: "\$\$",
                route: '/redlobsterMenu',
              ),
              RestaurantCard(
                name: 'Wendys',
                imgURL: 'lib/customer/pages/Dashboard/assets/tacobell.jpg',
                distance: 1,
                rating: 4.6,
                price: "\$\$",
                route: '/wendysMenu',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RestaurantCard(
                name: 'Popeyes',
                imgURL: 'lib/customer/pages/Dashboard/assets/tacobell.jpg',
                distance: 1,
                rating: 3.5,
                price: "\$",
                route: '/popeyesMenu',
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  // Each Message Board box contains a name, image, distance, rating and route. Route is where the user is redirected when they click on the widget.
  const RestaurantCard(
      {super.key,
      required this.name,
      required this.imgURL,
      required this.distance,
      required this.rating,
      required this.price,
      required this.route});

  final String name;
  final String imgURL;
  final double distance;
  final double rating;
  final String price;
  final String route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 220,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 7, // 70% of the container height
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  imgURL,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 3, // 30% of the container height
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$rating⭐ • $price',
                            style: const TextStyle(fontSize: 12)),
                        Text('$distance mi',
                            style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TempMenu extends StatelessWidget {
  const TempMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Menu',
          ),
        ),
        body: const Center(
          child: Text("Menu goes here"),
        ));
  }
}
