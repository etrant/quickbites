import 'package:flutter/material.dart';

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
        "description": "Chalupas",
        "image":
            "lib/customer/pages/Menu/assets/tacobell/cinnabon_delights.jpg",
        "price": 6.89,
      },
    },
    "distance": 1.0,
    "rating": 4.5,
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
    "distance": 2.5,
    "rating": 4.0,
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
    "rating": 4.0,
  },
  "Thai Basil Cuisine": {
    "menu": {
      "Item 1": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 2": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 3": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 4": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 5": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
    },
    "distance": 0.0,
    "rating": 4.6,
  },
  "Popeyes": {
    "menu": {
      "Item 1": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 2": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 3": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 4": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 5": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
    },
    "distance": 0.0,
    "rating": 3.5,
  },
  "Wendy's": {
    "menu": {
      "Item 1": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 2": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 3": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 4": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
      "Item 5": {
        "description": "",
        "image": "",
        "price": 0.0,
      },
    },
    "distance": 0.0,
    "rating": 4.3,
  },
};

class MenuScreen extends StatelessWidget {
  final String restaurantName;

  const MenuScreen({Key? key, required this.restaurantName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantName),
      ),
      body: const Center(
        child: Text(
          'Menu Items',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
