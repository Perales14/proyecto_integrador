import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Entities/product_controller.dart';
import 'package:proyecto_integrador/Entities/product.dart';
import 'package:proyecto_integrador/Views/ViewEdit/view_edit_product.dart';
import 'package:proyecto_integrador/Views/ViewSingle/view_product.dart';

class ListProductWidget extends StatelessWidget {
  final List<Product> products;
  final Function() setstate;
  const ListProductWidget({
    Key? key,
    required this.products,
    required this.setstate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      print('products.is empty');
      return const Center(
        child: Text('No hay productos'),
      );
    }
    return Column(
      children: _listProduct(context),
    );
  }

  List<Widget> _listProduct(BuildContext context) {
    print('products.is NOT empty');
    return products.map((Product producto) {
      return ViewProduct(
        onpresseddelete: () {
          ProductController().DeleteProduct(producto.code);
          setstate();
        },
        onpressededit: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProduct(
                product: producto,
              ),
            ),
          ).then((value) => setstate());
        },
        product: producto,
      );
    }).toList();
  }
}
