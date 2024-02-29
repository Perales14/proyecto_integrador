import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Entities/product.dart';

class SearchControll extends StatelessWidget {
  final String search;
  final List<Product> products;
  final BuildContext contex;
  const SearchControll({
    Key? key,
    required this.contex,
    required this.search,
    required this.products,
  }) : super(key: key);

  List<Widget> searchProduct() {
    print('products.length:   ${products.length}');
    List<Widget> list = [];
    // String x = 'MAYUUSminus';
    // // x.compareTo(other)
    // if (x.contains(RegExp('ma', caseSensitive: false))) {
    //   print('SI');
    // } else {
    //   print('NO');
    // }
    for (var product in products) {
      if (product.name.contains(RegExp(search, caseSensitive: false))) {
        list.add(
          ListTile(
            onTap: () {
              Navigator.pop(contex, product);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => ViewProd(
              //       product: product,
              //     ),
              //   ),
              // );
            },
            title: Text(product.name),
            subtitle: Text(product.description),
            leading: CircleAvatar(
              child: Text(product.name[0]),
            ),
          ),
        );
      }
    }
    print('list.length:   ${list.length}');
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
