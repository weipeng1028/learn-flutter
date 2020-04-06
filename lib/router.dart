import 'package:flutter/material.dart';
import 'package:flutter_tt/routerChild.dart';
class Product {
  final String title;
  final String description;

  Product(this.title, this.description);
}
class RoutePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductList(
        products: List.generate(20, (i) => Product('商品名称$i','商品编号$i'))
      ),
    );
  }
}
class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品列表'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(product: products[index]),
                )
              );
            },
          );
        },
        itemCount: products.length,
      ),
    );
  }
}