import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Entities/product.dart';

class SearchControll extends StatelessWidget {
  final String search;
  final List<Product> products;
  const SearchControll({
    Key? key,
    required this.search,
    required this.products,
  }) : super(key: key);

  List<Widget> searchProduct() {
    List<Widget> list = [];
    for (var product in products) {
      if (product.name.contains(search)) {
        list.add(
          ListTile(
            title: Text(product.name),
            subtitle: Text(product.description),
            leading: CircleAvatar(
              child: Text(product.name[0]),
            ),
          ),
        );
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: searchProduct(),
      // children: products,f
    );
  }
}
