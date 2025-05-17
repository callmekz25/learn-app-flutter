import 'package:flutter/material.dart';
import 'package:khanhvinh_flutter_app/commercial_app/admin_pages/fruits_page_admin.dart';
import 'package:khanhvinh_flutter_app/commercial_app/app_fruit_store.dart';
import 'package:khanhvinh_flutter_app/commercial_app/page_auth_user.dart';
import 'package:khanhvinh_flutter_app/commercial_app/page_fruit_stream.dart';
import 'package:khanhvinh_flutter_app/commercial_app/page_verify_otp.dart';
import 'package:khanhvinh_flutter_app/getX/getX.dart';
import 'package:khanhvinh_flutter_app/getX/getX_simple_state_management.dart';
import 'package:khanhvinh_flutter_app/json_list/page_album.dart';
import 'package:khanhvinh_flutter_app/layout/grid_view_example.dart';
import 'package:khanhvinh_flutter_app/layout/list_view_example.dart';
import 'package:khanhvinh_flutter_app/local_storage/page_get_storage.dart';
import 'package:khanhvinh_flutter_app/permission/page_permission.dart';
import 'package:khanhvinh_flutter_app/profile/page_profile.dart';
import 'package:khanhvinh_flutter_app/rss/pages/page_rss.dart';
import 'package:khanhvinh_flutter_app/url_handler/call_phone.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My app"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildButton(context,
                  title: "My profile", destination: PageProfile()),
              buildButton(context,
                  title: "My grid view", destination: PageGridView()),
              buildButton(context,
                  title: "My list view", destination: PageListView()),
              buildButton(context,
                  title: "My page counter", destination: PageCounterGetX()),
              buildButton(context,
                  title: "My page state management", destination: GetXApp()),
              buildButton(context,
                  title: "Page Home Fruits Store",
                  destination: AppFruitStore()),
              buildButton(context,
                  title: "Page Album", destination: PageAlbum()),
              buildButton(context, title: "Page Rss", destination: PageRss()),
              buildButton(context,
                  title: "Page Fruit Stream", destination: PageFruitStream()),
              buildButton(context,
                  title: "Page Call Phone", destination: CallPhone()),
              buildButton(context,
                  title: "Page Admin Fruit", destination: PageFruitsAdmin()),
              buildButton(context,
                  title: "Page Permission", destination: PagePermission()),
              buildButton(context,
                  title: "Page Get Storage", destination: PageGetStorage()),
              buildButton(context,
                  title: "Page Auth User", destination: PageAuthUser()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context,
      {required String title, required Widget destination}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Container(
          width: MediaQuery.of(context).size.width * 2 / 3,
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => destination,
                ));
              },
              child: Text(title))),
    );
  }
}
