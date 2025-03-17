import 'package:flutter/material.dart';
import 'package:khanhvinh_flutter_app/layout/grid_view_example.dart';

class PageDetail extends StatefulWidget {
  const PageDetail({super.key});

  @override
  State<PageDetail> createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Detail"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Text("Page Detail"),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop("Bye");
                },
                child: Text("Quay lại"))
          ],
        ),
      ),
    );
  }
}
