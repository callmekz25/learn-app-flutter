import 'package:get/get.dart';
import 'dart:convert';
import 'package:khanhvinh_flutter_app/rss/models/rss_item.dart';
import 'package:khanhvinh_flutter_app/rss/models/rss_resource.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class RssController extends GetxController {
  String? currentUrl;
  RssResource currentResource = rssResources[0];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    currentUrl = currentResource.resourceHeaders.values.toList()[0];
  }

  void refresh() {
    update(["rss"]);
  }

  Future<List<RssItem>> readRss() async {
    var response = await http.get(Uri.parse(currentUrl!));
    if (response.statusCode == 200) {
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(utf8.decode(response.bodyBytes));
      String body = xml2json.toParker();
      var data = json.decode(body)["rss"]["channel"]["item"] as List;
      return data
          .map(
            (e) => RssItem.empty().fromJson(e, currentResource),
          )
          .toList();
    }
    return Future.error("Lỗi đọc rss");
  }
}
