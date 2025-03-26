import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:khanhvinh_flutter_app/rss/models/rss_item.dart';
import 'package:khanhvinh_flutter_app/rss/models/rss_resource.dart';
import 'package:xml2json/xml2json.dart';

void main() async {
  var url = "https://vnexpress.net/rss/tin-moi-nhat.rss";
  var response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    Xml2Json xml2json = Xml2Json();
    xml2json.parse(utf8.decode(response.bodyBytes));
    String body = xml2json.toParker();
    var data = json.decode(body)["rss"]["channel"]["item"] as List;
    // print(data[0]["title"]);

    var rssItem = RssItem.empty().fromJson(data[0], rssResources[0]);
    print(rssItem.title);
    print(rssItem.description);
    print(rssItem.link);
    print(rssItem.imageUrl);
    print(rssItem.pubDate);
  }
}
