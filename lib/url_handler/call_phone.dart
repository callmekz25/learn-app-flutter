import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> openPhoneCall(String phoneNumber) async {
  bool check = await canLaunchUrl(Uri.parse("tel:${phoneNumber}"));
  if (check == false) {
    return false;
  } else {
    return launchUrl(Uri.parse("tel:${phoneNumber}"));
  }
}

class CallPhone extends StatelessWidget {
  const CallPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call Phone"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  bool success = await openPhoneCall("0123456789");
                  if (!success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Không thể gọi điện")),
                    );
                  }
                },
                child: Text("Gọi ngay"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
