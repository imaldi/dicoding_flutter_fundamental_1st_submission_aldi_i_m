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
        body: Container(
          child: Column(
            children: [
              Hero(
                  tag: restaurant.pictureId ?? "",
                  child: Image.network(restaurant.pictureId ?? "")),
              Text("${restaurant.name}"),
            ],
          ),
        ),
      ),
    );
  }
}
