import 'package:flutter/material.dart';
import 'package:khanhvinh_flutter_app/json_list/json_data.dart';

class PageAlbum extends StatelessWidget {
  const PageAlbum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Album"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: FutureBuilder<List<Album>>(
        future: readData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "404",
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
              ),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var list = snapshot.data!;
          return ListView.separated(
              itemBuilder: (context, index) {
                Album alb = list[index];
                return ListTile(
                  leading: Text("${alb.id}"),
                  title: Text(
                    "${alb.title}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("${alb.url}"),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: list.length);
        },
      ),
    );
  }
}
