import 'package:khanhvinh_flutter_app/rss/models/rss_resource.dart';

class RssItem {
  String? title, description, pubDate, link, imageUrl;
  // Khởi tạo trước gán sau
  RssItem.empty();

  RssItem fromJson(Map<String, dynamic> json, RssResource resource) {
    this.title = json["title"];
    this.pubDate = json["pubDate"];
    this.link = json["link"];
    this.imageUrl = getImageUrl(json["description"], resource);
    this.description = getDescription(json["description"], resource);
    return this;
  }
}

String? getImageUrl(String rawDescription, RssResource resource) {
  String startRegrex = resource.startImageRegrex;
  String endRegrex = resource.endImageRegrex;
  int start = rawDescription.indexOf(startRegrex) + startRegrex.length;
  if (start >= startRegrex.length) {
    if (endRegrex.length > 0) {
      int end = rawDescription.indexOf(endRegrex, start);
      return rawDescription.substring(start, end);
    }
    return rawDescription.substring(start);
  }
  return null;
}

String getDescription(String rawDescription, RssResource resource) {
  String startRegrex = resource.startDescriptionRegrex;
  String endRegrex = resource.endDescriptionRegrex;
  int start = rawDescription.indexOf(startRegrex) + startRegrex.length;
  if (start >= startRegrex.length) {
    if (endRegrex.length > 0) {
      int end = rawDescription.indexOf(endRegrex, start);
      return rawDescription.substring(start, end);
    }
    return rawDescription.substring(start);
  }
  return "";
}
