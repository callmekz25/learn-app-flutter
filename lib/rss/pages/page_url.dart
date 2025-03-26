import 'package:flutter/material.dart';
import 'package:khanhvinh_flutter_app/rss/models/rss_item.dart';
import 'package:khanhvinh_flutter_app/rss/models/rss_resource.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageUrl extends StatefulWidget {
  String url;

  PageUrl({super.key, required this.url});

  @override
  State<PageUrl> createState() => _PageUrlState();
}

class _PageUrlState extends State<PageUrl> {
  late WebViewController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VN Express"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: WebViewWidget(controller: controller),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Nguyễn Hồng Khánh Vinh",
                style: TextStyle(fontSize: 20),
              ),
              accountEmail: Text(
                "kz2511@gmail.com",
                style: TextStyle(fontSize: 17),
              ),
              currentAccountPicture: CircleAvatar(
                child: Text("Vinh"),
                backgroundImage: AssetImage("assets/images/meo.jpg"),
              ),
            ),
            RadioListTile(
              value: "value",
              groupValue: "Test",
              onChanged: (value) {},
              title: Text("tesst"),
            )
          ],
        ),
      ),
    );
  }
}
