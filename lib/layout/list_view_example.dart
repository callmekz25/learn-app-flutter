import 'package:flutter/material.dart';

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

class PageListView extends StatelessWidget {
  const PageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("My list view"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            var itemData = data[index];
            return ListTile(
              title: Text(
                itemData.name,
                style: TextStyle(fontSize: 20),
              ),
              leading: Text(
                "${index + 1}",
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                "Laptop",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              trailing: Text(
                itemData.price.toString(),
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
              onTap: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Bạn đã chọn ${itemData.name}"),
                  duration: Duration(seconds: 2),
                ));
              },
            );
          },
          separatorBuilder: (context, index) => Divider(
                thickness: 1.5,
              ),
          itemCount: data.length),
    );
  }
}
