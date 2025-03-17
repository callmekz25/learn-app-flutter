// {
// "albumId": 1,
// "id": 1,
// "title": "accusamus beatae ad facilis cum similique qui sunt",
// "url": "https://via.placeholder.com/600/92c952",
// "thumbnailUrl": "https://via.placeholder.com/150/92c952"
// },
import 'dart:convert';

import 'package:http/http.dart' as http;

class Album {
  int albumId, id;
  String title, url, thumbnailUrl;

  Album(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"]);
  }
  Map<String, dynamic> toJson() {
    return {
      "albumId": this.albumId,
      "id": this.id,
      "title": this.title,
      "url": this.url,
      "thumbnailUrl": this.thumbnailUrl,
    };
  }
}

Future<List<Album>> readData() async {
  String url = "https://jsonplaceholder.typicode.com/photos";
  var response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    var list = jsonDecode(response.body) as List;
    List<Album> albums = list
        .map(
          (e) => Album.fromJson(e),
        )
        .toList();
    return albums;
  }
  return [];
}
