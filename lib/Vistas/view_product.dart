import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_integrador/Entities/product.dart';

class ViewProduct extends StatefulWidget {
  final Product product;
  const ViewProduct({Key? key, required this.product}) : super(key: key);

  @override
  ViewProductState createState() => ViewProductState();
}

class ViewProductState extends State<ViewProduct> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product.name),
      subtitle: Text(widget.product.description),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          //elimina el producto con Id "codigo"
          print('Eliminar');
        },
      ),
    );
  }
}
