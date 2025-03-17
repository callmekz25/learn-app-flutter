import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:khanhvinh_flutter_app/layout/list_view_example.dart';
import 'package:khanhvinh_flutter_app/page_home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://utdltqjqmkfbkymkdico.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV0ZGx0cWpxbWtmYmt5bWtkaWNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDIxODA4MTcsImV4cCI6MjA1Nzc1NjgxN30.W_ECjmIorPZ3mI7ON2m94YGh3WqSOFQ410cLwV6lVcc',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PageHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = "Hello";
  String avatar =
      "https://img.lovepik.com/png/20231127/young-businessman-3d-cartoon-avatar-portrait-character-digital_708913_wh1200.png";
  TextEditingController name = TextEditingController();
  TextEditingController dob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kz"),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Column(children: [
              Container(
                width: 200,
                height: 150,
                child: Image.network(avatar),
              ),
              SizedBox(height: 20),
              Text("Hello ${name.text}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.red)),
              TextField(
                controller: name,
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: dob,
                decoration: InputDecoration(
                    labelText: "Date of birth", hintText: "Type your dob"),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    if (message == "Hello") {
                      setState(() {
                        message = "Chào";
                      });
                    } else {
                      setState(() {
                        message = "Hello";
                      });
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Chào ${name.text}"),
                      duration: Duration(seconds: 5),
                    ));
                  },
                  child: Text(message)),
            ]),
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = "Khánh Vinh";
    dob.text = "25/11/2004";
  }
}
