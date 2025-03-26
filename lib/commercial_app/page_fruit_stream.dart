import 'package:flutter/material.dart';
import 'package:khanhvinh_flutter_app/commercial_app/models/fruit.model.dart';

class PageFruitStream extends StatelessWidget {
  const PageFruitStream({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Fruit Stream"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: StreamBuilder(
        stream: FruitSnapshot.getFruitStream(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return Center(
              child: Text("Error 404!"),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Loading...")
                ],
              ),
            );
          }
          var data = snapshot.data!.toList();
          return GridView.extent(
            childAspectRatio: 0.8,
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: data
                .map(
                  (e) => GridTile(
                      child: GestureDetector(
                    child: Column(
                      children: [
                        Expanded(
                            child: Container(
                          child: Image.network(
                            "${e.anh ?? "Default"}",
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) =>
                                Column(
                              children: [
                                Icon(
                                  Icons.image_not_supported,
                                  size: 100,
                                )
                              ],
                            ),
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
