import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:khanhvinh_flutter_app/rss/controllers/rss_controller.dart';
import 'package:khanhvinh_flutter_app/rss/models/rss_item.dart';
import 'package:khanhvinh_flutter_app/rss/models/rss_resource.dart';
import 'package:khanhvinh_flutter_app/rss/pages/page_url.dart';

class PageRss extends StatelessWidget {
  PageRss({super.key});
  final controller = Get.put(RssController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Rss"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.refresh();
        },
        child: GetBuilder(
          init: controller,
          id: "rss",
          builder: (controller) => FutureBuilder<List<RssItem>>(
            future: controller.readRss(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error 404!"),
                );
              }

              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              List<RssItem> data = snapshot.data!;
              return ListView.separated(
                  itemBuilder: (context, index) {
                    RssItem rssItem = data[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PageUrl(
                                  url: rssItem.link!,
                                ),
                              ));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Image.network(
                                    rssItem.imageUrl ??
                                        "https://static.vecteezy.com/system/resources/thumbnails/005/720/408/small_2x/crossed-image-icon-picture-not-available-delete-picture-symbol-free-vector.jpg",
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "${rssItem.title}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          rssItem.description != ""
                              ? Text(
                                  rssItem.description ?? "Chưa có mô tả",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.normal),
                                )
                              : Text(
                                  "Chưa có mô tả",
                                  style: TextStyle(fontSize: 17),
                                ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: data.length);
            },
          ),
        ),
      ),
    );
  }
}
