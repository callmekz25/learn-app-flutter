import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:khanhvinh_flutter_app/commercial_app/models/fruit.model.dart';

import 'controllers/controller_fruit.dart';
import 'package:badges/badges.dart' as badges;

class PageDetailFruit extends StatelessWidget {
  PageDetailFruit({super.key, required this.fruit});
  Fruit fruit;
  double rating = getRating();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${fruit.ten}"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          GetBuilder(
              init: ControllerFruit.get(),
              id: "gh",
              builder: (controller) => badges.Badge(
                    showBadge: controller.slGH > 0,
                    badgeContent: Text(
                      "${controller.slGH}",
                      style: TextStyle(color: Colors.white),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      size: 30,
                    ),
                  )),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Expanded(
                    child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Image.network(fruit.anh ?? "Default"),
                )),
              ),
              Text(
                "${fruit.ten}",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "${fruit.gia ?? 0}đ",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${(fruit.gia ?? 0) * 1.2}đ",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 22,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              Text(
                "Mô tả: ${fruit.moTa ?? "Không có"}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 30,
                    direction: Axis.horizontal,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${rating.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "${1 + Random().nextInt(10000)} đánh giá",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ControllerFruit.get().themGH(fruit);
        },
        child: Icon(Icons.add_shopping_cart_outlined),
      ),
    );
  }
}

double getRating() {
  return Random().nextInt(201) / 100 + 3;
}
