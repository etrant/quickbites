import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickbites/customer/pages/Checkout/checkout.dart';

Map<String, Map<String, dynamic>> restaurants = {
  "Taco Bell": {
    "menu": {
      "Crunchy Taco": {
        "description":
            "A crunchy corn tortilla with seasoned beef, crisp lettuce, and real cheddar cheese.",
        "image": "lib/customer/pages/Menu/assets/tacobell/crunchy_taco.jpg",
        "price": 1.89,
      },
      "Beefy 5-Layer Burrito": {
        "description":
            "Seasoned beef combined with hearty beans, real nacho cheese, and cool reduced fat sour cream all wrapped in a warm flour tortilla.",
        "image": "lib/customer/pages/Menu/assets/tacobell/beefy_five_layer.jpg",
        "price": 3.59,
      },
      "Crunchwrap Supreme": {
        "description":
            "Our version of the wrap with seasoned beef, warm nacho cheese sauce, a crispy tostada shell for extra crunch, lettuce, tomatoes, and reduced fat sour cream all wrapped in our signature Crunchwrap fold and grilled to go.",
        "image":
            "lib/customer/pages/Menu/assets/tacobell/crunchwrap_supreme.jpg",
        "price": 5.49,
      },
      "Medium Soft Drink": {
        "description":
            "A choice of your favorite refreshing drink to pair with a filling meal.",
        "image": "lib/customer/pages/Menu/assets/tacobell/medium_drink.jpg",
        "price": 2.89,
      },
      "Cinnabon Delights 12 Pack": {
        "description":
            "Warm donut holes filled with Cinnabon® signature cream cheese frosting, and dusted in Makara Cinnamon sugar",
        "image":
            "lib/customer/pages/Menu/assets/tacobell/cinnabon_delights.jpg",
        "price": 6.89,
      },
    },
    "distance": 1.0,
    "address": "2420 Druid Hills Rd NE",
    "latitude": 33.82719851139403,
    "longitude": -84.3257637236474,
    "rating": 3.7,
  },
  "Zaxby's": {
    "menu": {
      "Big Zax Snak Meal": {
        "description":
            "3 hand-breaded Chicken Fingerz™ with Zax Sauce®. Served with Texas Toast, Crinkle Fries, and Small Drink.",
        "image": "lib/customer/pages/Menu/assets/zaxbys/big_zax.jpg",
        "price": 8.79,
      },
      "Fried Chicken Philly": {
        "description":
            "Hand-breaded Fried Chicken, White American cheese, Grilled Onions and Peppers, and Garlic Aioli on a toasted hoagie roll. Served with Crinkle Fries and Small Drink.",
        "image": "lib/customer/pages/Menu/assets/zaxbys/philly.jpg",
        "price": 9.29,
      },
      "Chicken Bacon Ranch Loaded Fries": {
        "description":
            "A generous portion of Crinkle Fries topped with hand-breaded Fried Chicken, Cheddar Jack cheese, natural hardwood smoked bacon, and Ranch.",
        "image": "lib/customer/pages/Menu/assets/zaxbys/loaded_fries.jpg",
        "price": 8.19,
      },
      "The House Zalad": {
        "description":
            "Mixed greens with carrots and red cabbage, Cheddar Jack cheese, cucumbers, tomatoes, and fried onions with Fried or Grilled Chicken and your choice of dressing. Served with Texas Toast.",
        "image": "lib/customer/pages/Menu/assets/zaxbys/house_zalad.jpg",
        "price": 10.19,
      },
      "Funnel Cake with Caramel Sauce": {
        "description":
            "A light, fluffy batter fried to golden brown and sprinkled with powdered sugar. Served with Caramel Sauce.",
        "image": "lib/customer/pages/Menu/assets/zaxbys/funnel_cake.jpg",
        "price": 3.49,
      },
    },
    "latitude": 33.8744427293557,
    "longitude": -84.38121570364584,
    "distance": 2.5,
    "rating": 4.2,
    "address": "4388 Roswell Rd NE",
  },
  "Red Lobster": {
    "menu": {
      "Twin Maine Tails": {
        "description":
            "A pair of perfectly roasted Maine lobster tails. Served with your choice of two sides.",
        "image": "lib/customer/pages/Menu/assets/redlobster/twin_maine.jpg",
        "price": 39.99,
      },
      "10 Oz. NY Strip": {
        "description": "Seasoned and grilled to perfection.",
        "image": "lib/customer/pages/Menu/assets/redlobster/ny_strip.jpg",
        "price": 27.99,
      },
      "Cajun Chicken Linguini Alfredo": {
        "description":
            "Spicy chicken in a creamy garlic Alfredo sauce on a bed of linguini.",
        "image": "lib/customer/pages/Menu/assets/redlobster/cajun_linguini.jpg",
        "price": 16.99,
      },
      "One Dozen Cheddar Bay Biscuits": {
        "description":
            "All entrées come with two warm, house-made Cheddar Bay Biscuits. Not enough? Order extra here.",
        "image": "lib/customer/pages/Menu/assets/redlobster/biscuits.jpg",
        "price": 6.99,
      },
      "Brownie Overboard": {
        "description":
            "Warm brownie wedges served with a scoop of vanilla ice cream. Topped with caramel, fudge and whipped cream.",
        "image":
            "lib/customer/pages/Menu/assets/redlobster/brownie_overboard.jpg",
        "price": 9.49,
      },
    },
    "distance": 2.5,
    "latitude": 34.05928328324028,
    "longitude": -84.56540035008841,
    "rating": 4.3,
    "address": "2055 Pleasant Hill Rd",
  },
  "Popeyes": {
    "menu": {
      "1/4 lb Popcorn Shrimp Combo": {
        "description":
            "Crunchy, fresh, and full of flavor. A taste of the sea right at your fingertips. Comes with a biscuit and a side of your choice.",
        "image": "lib/customer/pages/Menu/assets/popeyes/popcornshrimp.jpg",
        "price": 10.39,
      },
      "5 Tenders Combo": {
        "description":
            "Juicy, tender, and full of flavor. Comes with a biscuit and a side of your choice.",
        "image": "lib/customer/pages/Menu/assets/popeyes/tenders.jpg",
        "price": 11.49,
      },
      "8 Chicken Nuggets Combo": {
        "description":
            "The tenders in bite size! Extra crispiness just for you. Comes with a biscuit and a side of your choice.",
        "image": "lib/customer/pages/Menu/assets/popeyes/nuggets.jpg",
        "price": 8.89,
      },
      "12 Wings Combo": {
        "description":
            "Crispy, juicy, and full of flavor. Comes with a biscuit and a side of your choice. Get in tossed in your favorite sauce!",
        "image": "lib/customer/pages/Menu/assets/popeyes/friedchicken.jpg",
        "price": 13.79,
      },
      "Oreo Cheesecake Cup": {
        "description":
            "Oreo cheesecake on an oreo crust topped with oreo chunks! Need we say more?",
        "image": "lib/customer/pages/Menu/assets/popeyes/oreocheesecake.jpg",
        "price": 3.79,
      },
    },
    "distance": 2.5,
    "rating": 3.5,
    "latitude": 33.805908280265704,
    "longitude": -84.50065791541456,
    "address": "3349 M.L.K. Jr Dr SW",
  },
  "Wendys": {
    "menu": {
      "Baconator": {
        "description":
            "A feast for carnivores! A 1/2 lb patty topped with 6 strips of bacon, American cheese, ketchup, and mayo.",
        "image": "lib/customer/pages/Menu/assets/wendys/baconator.jpg",
        "price": 7.99,
      },
      "Spicy Chicken Nuggets": {
        "description": "A medley of spices combined with a juicy chicken.",
        "image": "lib/customer/pages/Menu/assets/wendys/spicynuggets.jpg",
        "price": 4.89,
      },
      "Ghost Pepper Ranch Chicken Sandwich": {
        "description":
            "A spicy chicken sandwich with ghost pepper ranch. You might become a ghost after eating this.",
        "image":
            "lib/customer/pages/Menu/assets/wendys/ghostpeppersandwich.jpg",
        "price": 6.99,
      },
      "Apple Pecan Salad": {
        "description":
            "Lettuce, apple bites, pecans, cranberries, blue cheese, and some chicken. What more do you need?",
        "image": "lib/customer/pages/Menu/assets/wendys/applepecansalad.jpg",
        "price": 8.29,
      },
      "Peppermint Frosty": {
        "description":
            "Peppermint combined with our signature vanilla frosty. This'll put a pep in YOUR step.",
        "image": "lib/customer/pages/Menu/assets/wendys/peppermintfrosty.jpg",
        "price": 2.09,
      },
    },
    "distance": 7.1,
    "rating": 4.3,
    "latitude": 33.70865202248627,
    "longitude": -84.40707387163917,
    "address": "2096 Metropolitan Pkwy SW",
  },
};

class OrderItem {
  final String name;
  final String description;
  final String imagePath;
  final double price;

  OrderItem(this.name, this.description, this.imagePath, this.price);
}

class Order {
  String restaurantName;
  double latitude;
  double longitude;
  String address;
  double orderTotal;
  Map<String, OrderItem> items;

  Order(
      {this.restaurantName = '',
      this.latitude = 0.0,
      this.longitude = 0.0,
      this.address = '',
      this.orderTotal = 0.0,
      Map<String, OrderItem>? items})
      : items = items ?? {};

  void addItem(String itemName, OrderItem item) {
    items[itemName] = item;
    orderTotal += item.price;
    print(orderTotal); //for debug
  }

  void removeItem(String itemName) {
    if (items.containsKey(itemName)) {
      orderTotal -= items[itemName]!.price;
      items.remove(itemName);
      print(orderTotal); //for debug
    }
  }

  void setRestaurantDetails(String restaurantName, double latitude,
      double longitude, String address) {
    this.restaurantName = restaurantName;
    this.latitude = latitude;
    this.longitude = longitude;
    this.address = address;
  }
}

class OrderProvider with ChangeNotifier {
  Order _currentOrder;
  OrderProvider(this._currentOrder);

  Order get currentOrder => _currentOrder;
  void addItem(String itemName, OrderItem item) {
    _currentOrder.addItem(itemName, item);
    notifyListeners();
  }

  void removeItem(String itemName) {
    _currentOrder.removeItem(itemName);
    notifyListeners();
  }

  void setRestaurantDetails(String restaurantName, double latitude,
      double longitude, String address) {
    _currentOrder.setRestaurantDetails(
        restaurantName, latitude, longitude, address);
    notifyListeners();
  }

  void resetOrder() {
    _currentOrder = Order(
      restaurantName: _currentOrder.restaurantName,
      latitude: _currentOrder.latitude,
      longitude: _currentOrder.longitude,
      address: _currentOrder.address,
      items: {},
      orderTotal: 0.0,
    );
    notifyListeners();
  }
}

class MenuScreen extends StatefulWidget {
  final String restaurantName;

  const MenuScreen({Key? key, required this.restaurantName}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState(restaurantName);
}

class _MenuScreenState extends State<MenuScreen> {
  final String restaurantName;
  List<bool> isCheckedList = [];

  //method to see if a menu item was selected, and if so, the checkout button should appear.
  bool isAnyItemSelected() {
    return isCheckedList.any((item) => item);
  }

  Map<String, Map<String, dynamic>> order = {};

  // Constructor to receive the restaurantName
  _MenuScreenState(this.restaurantName);

  @override
  void initState() {
    super.initState();
    final restaurantDetails = restaurants[restaurantName];
    if (restaurantDetails != null) {
      double latitude = restaurantDetails['latitude'];
      double longitude = restaurantDetails['longitude'];
      String address = restaurantDetails['address'];
      context.read<OrderProvider>().resetOrder();
      context
          .read<OrderProvider>()
          .setRestaurantDetails(restaurantName, latitude, longitude, address);
    }
  }

  @override
  void dispose() {
    //reset the order when we leave the page
    context.read<OrderProvider>().resetOrder();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);
    final restaurantMenu =
        restaurants[restaurantName]!['menu'] as Map<String, dynamic>? ?? {};
    double screenWidth = MediaQuery.of(context).size.width;
    double sixtyPercentWidth = screenWidth * 0.7;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          restaurantName,
          style: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: restaurantMenu.length,
              itemBuilder: (BuildContext context, int index) {
                String itemName = restaurantMenu.keys.elementAt(index);
                var item = restaurantMenu[itemName];

                // Ensure isCheckedList has enough elements to avoid index out of bounds
                while (isCheckedList.length <= index) {
                  isCheckedList.add(false);
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(10.0),
                        leading: Checkbox(
                          value: isCheckedList[index],
                          checkColor: Colors.black,
                          fillColor: MaterialStateProperty.all(Colors.white),
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(() {
                                isCheckedList[index] = !isCheckedList[index];
                              });
                            }
                            if (value == true) {
                              orderProvider.addItem(
                                  itemName,
                                  OrderItem(
                                    itemName,
                                    item['description'],
                                    item['image'],
                                    item['price'],
                                  ));

                              print(context
                                  .read<OrderProvider>()
                                  .currentOrder
                                  .items);
                            } else {
                              orderProvider.removeItem(itemName);
                            }
                          },
                        ),
                        title: Text(itemName),
                        subtitle: Text(item['description'] +
                            '\n\$${item['price'].toStringAsFixed(2)}'),
                        trailing: FractionallySizedBox(
                          widthFactor: 0.25,
                          heightFactor: 1.5,
                          child: ClipRRect(
                            child: Image.asset(
                              item['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // ignore: sized_box_for_whitespace
          if (isAnyItemSelected())
            SizedBox(
              width: sixtyPercentWidth,
              height: 60.0,
              // :D
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckoutScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.all(16.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      '\$${orderProvider.currentOrder.orderTotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
