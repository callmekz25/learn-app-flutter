import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khanhvinh_flutter_app/commercial_app/models/fruit.model.dart';
import 'package:khanhvinh_flutter_app/commercial_app/supabase.helper.dart';

class PageAddFruit extends StatefulWidget {
  const PageAddFruit({super.key});

  @override
  State<PageAddFruit> createState() => _PageAddFruitState();
}

class _PageAddFruitState extends State<PageAddFruit> {
  XFile? xFile;
  TextEditingController txtId = TextEditingController();
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtGia = TextEditingController();
  TextEditingController txtMota = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page add fruit"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 300,
                child: xFile == null
                    ? Icon(
                        Icons.image,
                        size: 50,
                      )
                    : Image.file(File(xFile!.path)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        var imagePicker = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (imagePicker != null) {
                          setState(() {
                            xFile = imagePicker;
                          });
                        }
                      },
                      child: Text("Chọn ảnh")),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtId,
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration: InputDecoration(labelText: "Id"),
              ),
              TextField(
                controller: txtTen,
                decoration: InputDecoration(labelText: "Tên"),
              ),
              TextField(
                controller: txtGia,
                decoration: InputDecoration(labelText: "Giá"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: txtMota,
                decoration: InputDecoration(labelText: "Mô tả"),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        if (xFile != null) {
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 5),
                              content: Text("Đang thêm ${txtTen.text}...")));
                          //1. Thêm ảnh, lấy url
                          //2.
                          var imageUrl = await uploadImage(
                              image: File(xFile!.path),
                              bucket: "fruits",
                              path: "fruit_${txtId.text}.jpg");

                          Fruit fruit = Fruit(
                              id: int.parse(txtId.text),
                              ten: txtTen.text,
                              gia: int.parse(txtGia.text),
                              anh: imageUrl,
                              moTa: txtMota.text);

                          FruitSnapshot.insert(fruit);
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: Duration(seconds: 5),
                              content: Text("Đã thêm ${txtTen.text}")));
                        }
                      },
                      child: Text("Thêm")),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
