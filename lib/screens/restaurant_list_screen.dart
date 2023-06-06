import 'dart:convert';

import 'package:dicoding_flutter_fundamental_1st_submission_aldi_i_m/screens/restaurant_detail_screen.dart';
import 'package:flutter/material.dart';

import '../models/restaurant.dart';

class RestaurantListScreen extends StatefulWidget {
  static const routeName = "restaurant_list_screen";
  const RestaurantListScreen({Key? key}) : super(key: key);

  @override
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<String>(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/local_restaurant.json'),
            builder: (context, snapshot) {
              var listRestaurant =
                  LocalRestaurant.fromJson(jsonDecode(snapshot.data ?? "{}"))
                      .restaurants;
              return ListView.builder(
                  itemCount: listRestaurant?.length ?? 0,
                  itemBuilder: (c, i) {
                    var selectedRestaurant = listRestaurant?[i] ?? Restaurant();
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RestaurantDetailScreen.routeName,
                              arguments: selectedRestaurant);
                        },
                        leading: Container(
                            color: Colors.blue,
                            // padding: const EdgeInsets.all(8.0),
                            height: 64,
                            width: 64,
                            child: FittedBox(
                                fit: BoxFit.fill,
                                child: Hero(
                                  tag: selectedRestaurant.pictureId ?? "",
                                  child: Image.network(
                                      selectedRestaurant.pictureId ?? ""),
                                ))),
                        title:
                            Text("Nama Restoran: ${selectedRestaurant.name}"),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.location_pin),
                                Text(selectedRestaurant.city ?? "")
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star),
                                Text(selectedRestaurant.rating.toString() ?? "")
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
