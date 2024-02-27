import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/product_controller.dart';
import 'package:proyecto_integrador/Entities/product.dart';
import 'package:proyecto_integrador/Vistas/view_edit_product.dart';
import 'package:proyecto_integrador/Vistas/view_product.dart';

class ListProductWidget extends StatelessWidget {
  final List<Product> products;
  const ListProductWidget({Key? key, required this.products}) : super(key: key);

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
    return ProductController()
        .ListProduct()
        .map(
          (Product producto) => ViewProduct(
            onpresseddelete: () {
              ProductController().DeleteProduct(producto.code);
            },
            onpressededit: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProduct(
                    product: producto,
                  ),
                ),
              );
            },
            product: producto,
          ),
        )
        .toList();
  }
}
