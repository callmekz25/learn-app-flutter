import 'package:flutter/material.dart';

class PageUserInformation extends StatefulWidget {
  const PageUserInformation({super.key});

  @override
  State<PageUserInformation> createState() => _PageUserInformationState();
}

class _PageUserInformationState extends State<PageUserInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page User's Info"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
