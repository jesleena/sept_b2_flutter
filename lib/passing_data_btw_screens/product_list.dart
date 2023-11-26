import 'package:flutter/material.dart';
import 'package:sept_b2_flutter/passing_data_btw_screens/dummydata.dart';
import 'package:sept_b2_flutter/passing_data_btw_screens/product_details.dart';

void main() {
  runApp(MaterialApp(
    home: ProductList(),
    debugShowCheckedModeBanner: false,
    routes: {"details": (context) => Details()},
  ));
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product details"),
      ),
      body: ListView(
        children: products
            .map((e) => ListTile(
                  leading: Image.asset(e["image"]),
                  title: Text(e["name"]),
                  onTap: () => Navigator.pushNamed(context, "details",
                      arguments: e["id"]),
                ))
            .toList(),
      ),
    );
  }
}
// void function()