import 'dart:ffi';

import 'package:flutter/material.dart';

class PageProfile extends StatefulWidget {
  const PageProfile({super.key});

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  String dob = "25/11/2004";
  String? sex = "nam";
  List<String> pls = [
    "Dart",
    "Java",
    "Javascript",
    "C/C++",
    "Python",
    "Go",
    "C#"
  ];
  String? pl = "Javascript";
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _buildBody(index),
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
            ListTile(
              leading: Icon(Icons.mail),
              title: Text(
                "Inbox",
                style: TextStyle(fontSize: 18),
              ),
              trailing: Text("10", style: TextStyle(fontSize: 16)),
              onTap: () {
                Navigator.of(context).pop();
                setState(() {
                  index = 1;
                });
              },
            ),
            SizedBox(
              height: 7,
            ),
            ListTile(
              leading: Icon(Icons.drafts),
              title: Text("Drafts", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(
              height: 7,
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text("Sent", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(
              height: 7,
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text("Delete", style: TextStyle(fontSize: 18)),
            ),
            SizedBox(
              height: 10,
              child: Divider(),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Setting", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.blue[700],
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 35,
              color: Colors.blue,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.sms,
                size: 35,
                color: Colors.orange,
              ),
              label: "SMS"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.phone,
                size: 35,
                color: Colors.green,
              ),
              label: "Phone")
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }

  Widget _buildHome() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 3 / 4,
                child: Image.asset("assets/images/meo.jpg"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Họ và tên",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "Nguyễn Hồng Khánh Vinh",
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Ngày sinh",
              style: TextStyle(fontSize: 22),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    dob,
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    var selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2040));
                    if (selectedDate != null) {
                      dob =
                          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                      setState(() {});
                    }
                  },
                  icon: Icon(Icons.calendar_month),
                ),
                SizedBox(
                  width: 30,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Giới tính",
              style: TextStyle(fontSize: 22),
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: RadioListTile<String>(
                      title: Text(
                        "Nam",
                        style: TextStyle(fontSize: 22),
                      ),
                      value: "nam",
                      groupValue: sex,
                      onChanged: (value) {
                        setState(() {
                          sex = value;
                        });
                      }),
                ),
                Expanded(
                  child: RadioListTile<String>(
                      title: Text(
                        "Nữ",
                        style: TextStyle(fontSize: 22),
                      ),
                      value: "nu",
                      groupValue: sex,
                      onChanged: (value) {
                        setState(() {
                          sex = value;
                        });
                      }),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Sở thích",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "Nghe nhạc, chơi game, lập trình",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.green,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Ngôn ngữ lập trình giỏi nhất",
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
            DropdownButton<String>(
                isExpanded: true,
                value: pl,
                items: pls
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Row(
                            children: [
                              Icon(
                                Icons.add,
                                size: 35,
                                color: Colors.blue,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                e,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    pl = value;
                  });
                }),
          ],
        ),
      ),
    );
  }

  Widget _buildSMS() {
    return Center(
      child: Text(
        "SMS",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildPhone() {
    return Center(
      child: Text(
        "Phone",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return _buildHome();
      case 1:
        return _buildSMS();
      case 2:
        return _buildPhone();
      default:
        return _buildHome();
    }
  }
}
