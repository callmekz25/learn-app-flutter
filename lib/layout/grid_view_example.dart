import 'package:flutter/material.dart';
import 'package:khanhvinh_flutter_app/layout/detail_view_example.dart';

class Product {
  String name;
  int price;
  Product({
    required this.name,
    required this.price,
  });
}

var data = [
  Product(name: "Laptop Acer", price: 1000),
  Product(name: "Laptop Lenovo", price: 2000),
  Product(name: "Laptop Asus", price: 3000),
  Product(name: "Laptop Samsung", price: 4000),
  Product(name: "Macbook", price: 5000),
  Product(name: "Laptop Hp", price: 6000),
  Product(name: "Laptop Dell", price: 7000),
];

class PageGridView extends StatefulWidget {
  PageGridView({super.key});

  @override
  State<PageGridView> createState() => _PageGridViewState();
}

class _PageGridViewState extends State<PageGridView> {
  String image =
      "https://dmart.vn/uploads/37216_laptop_asus_d509da_ej286t__silver__1_1.jpg";
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("My grid view"),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                color: Colors.red,
                size: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  count.toString(),
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              )
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: GridView.extent(
        maxCrossAxisExtent: 300,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 0.75,
        children: data.map((e) {
          return Card(
            child: GestureDetector(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Image.network(image),
                    ),
                  ),
                  Text(
                    e.name,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    e.price.toString(),
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
              onTap: () async {
                String mess =
                    await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PageDetail(),
                ));
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(mess)));
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
