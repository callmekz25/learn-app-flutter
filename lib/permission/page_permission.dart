import 'package:flutter/material.dart';
import 'package:khanhvinh_flutter_app/helpers/permission_granted.dart';
import 'package:permission_handler/permission_handler.dart';

class PagePermission extends StatelessWidget {
  const PagePermission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page permission"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              String message;
              var status = await requestPermission(Permission.contacts);
              if (status) {
                message = "Quyền sử dụng danh bạ đã được cấp";
              } else {
                message = "Quyền sử dụng danh bạ đã bị từ chối";
              }
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("${message}"),
                duration: Duration(seconds: 5),
              ));
            },
            child: Text("Contact Permission Request")),
      ),
    );
  }
}
