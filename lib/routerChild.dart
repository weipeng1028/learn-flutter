import 'package:flutter/material.dart';
// class Product {
//   final String title;
//   final String description;

//   Product(this.title, this.description);
// }
class ProductDetail extends StatelessWidget {
  final product;

  const ProductDetail({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${product.title}'),
      ),
      body: Container(
        child: Center(
          child: Text('${product.description}'),
        ),
      ),
    );
  }
}