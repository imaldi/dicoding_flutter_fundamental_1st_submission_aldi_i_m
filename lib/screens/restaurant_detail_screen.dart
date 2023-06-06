import 'package:dicoding_flutter_fundamental_1st_submission_aldi_i_m/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const routeName = "restaurant_detail_screen";
  final Restaurant restaurant;

  const RestaurantDetailScreen({required this.restaurant, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                  tag: restaurant.pictureId ?? "",
                  child: Image.network(restaurant.pictureId ?? "")),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      "${restaurant.name}",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.grey,
                    ),
                    Text(
                      "${restaurant.rating}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text("${restaurant.description}"),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Text("Menu Makanan"),
              ),
              Builder(builder: (context) {
                var foodNameList =
                    restaurant.menus?.foods?.map((e) => e.name ?? "").toList();
                var drinkNameList =
                    restaurant.menus?.drinks?.map((e) => e.name ?? "").toList();
                var menuItems = <String>[
                  ...(foodNameList ?? []),
                  ...(drinkNameList ?? [])
                ];

                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: menuItems.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (c, i) {
                      var selectedMenu = menuItems[i];
                      return ListTile(
                        title: Text("Menu ${i + 1}: $selectedMenu"),
                      );
                      // Text(
                      //   "Menu Makanan $i: ${restaurant.menus?.foods?[i].name}");
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
