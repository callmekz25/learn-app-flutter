import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
// import 'package:khanhvinh_flutter_app/commercial_app/controllers/controller_fruit.dart';
import 'package:badges/badges.dart' as badges;
import 'package:khanhvinh_flutter_app/commercial_app/page_detail_fruit.dart';

import 'controllers/controller_fruit_v2.dart';

class AppFruitStore extends StatelessWidget {
  const AppFruitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fruits Store",
      initialBinding: BindingsHomeFruitStore(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PageHomeFruitStore(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PageHomeFruitStore extends StatelessWidget {
  const PageHomeFruitStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Home Fruit Store"),
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
      body: GetBuilder(
        id: "fruits",
        init: ControllerFruit.get(),
        builder: (controller) {
          var fruits = controller.fruits;
          return GridView.extent(
            childAspectRatio: 0.8,
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: fruits
                .map(
                  (e) => GridTile(
                      child: GestureDetector(
                    onTap: () {
                      Get.to(PageDetailFruit(fruit: e));
                    },
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          child: Image.network(
                            "${e.anh ?? "Default"}",
                            fit: BoxFit.fill,
                          ),
                        )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${e.ten}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "${e.gia ?? "0"}đ",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Text(
                          "${e.moTa}",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        // RatingBar.builder(
                        //   initialRating: 3,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   itemCount: 5,
                        //   itemSize: 22,
                        //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        //   itemBuilder: (context, _) => Icon(
                        //     Icons.star,
                        //     color: Colors.amber,
                        //   ),
                        //   onRatingUpdate: (rating) {
                        //     print(rating);
                        //   },
                        // ),
                      ],
                    ),
                  )),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
