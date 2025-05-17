import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khanhvinh_flutter_app/commercial_app/models/fruit.model.dart';
import 'package:khanhvinh_flutter_app/commercial_app/supabase.helper.dart';
import 'package:khanhvinh_flutter_app/helpers/dialog.dart';

class PageUpdateFruit extends StatefulWidget {
  PageUpdateFruit({super.key, required this.fruit});
  Fruit fruit;
  @override
  State<PageUpdateFruit> createState() => _PageUpdateFruitState();
}

class _PageUpdateFruitState extends State<PageUpdateFruit> {
  XFile? xFile;
  String? imageUrl;
  TextEditingController txtId = TextEditingController();
  TextEditingController txtTen = TextEditingController();
  TextEditingController txtGia = TextEditingController();
  TextEditingController txtMota = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page update fruit"),
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
                    ? Image.network(widget.fruit.anh ?? "Default")
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
                readOnly: true,
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
                        Fruit fruit = widget.fruit;
                        showSnackBar(context,
                            message: "Đang cập nhật ${fruit.ten}...",
                            seconds: 10);
                        if (xFile != null) {
                          var imageUrl = await updateImage(
                              image: File(xFile!.path),
                              bucket: "fruits",
                              path: "fruit_${txtId.text}.jpg",
                              upsert: true);

                          fruit.anh = imageUrl;
                        }
                        fruit.ten = txtTen.text;
                        fruit.moTa = txtMota.text;
                        fruit.gia = int.parse(txtGia.text);

                        await FruitSnapshot.update(fruit);
                        showSnackBar(context,
                            message: "Đã cập nhật ${fruit.ten}...");
                      },
                      child: Text("Cập nhật")),
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    txtId.text = widget.fruit.id.toString();
    txtTen.text = widget.fruit.ten;
    txtMota.text = widget.fruit.moTa ?? "";
    txtGia.text = widget.fruit.gia.toString();
  }
}
