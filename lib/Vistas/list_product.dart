import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/product_controller.dart';
import 'package:proyecto_integrador/Entities/product.dart';
import 'package:proyecto_integrador/Vistas/view_edit_product.dart';
import 'package:proyecto_integrador/Vistas/view_product.dart';

class ListProductWidget extends StatefulWidget {
  final List<Product> products;
  final Function() setstate;
  const ListProductWidget({
    Key? key,
    required this.products,
    required this.setstate,
  }) : super(key: key);

  @override
  _ListProductWidgetState createState() => _ListProductWidgetState();
}

class _ListProductWidgetState extends State<ListProductWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
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
    return widget.products.map((Product producto) {
      return ViewProduct(
        onpresseddelete: () {
          ProductController().DeleteProduct(producto.code);
          // setState(() {});
          widget.setstate();
        },
        onpressededit: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProduct(
                product: producto,
              ),
            ),
            // ignore: non_constant_identifier_names
          ).then((value) => widget.setstate());
          // widget.setstate();
          // .then(
          //   (value) => {
          //     setState(
          //       () {},
          //     ),
          //   },
          // );
          // .then((_) {
          //   setState(
          //     () {},
          //   ); // Actualiza el estado después de editar el producto
          // });
        },
        product: producto,
      );
    }).toList();
  }
}
