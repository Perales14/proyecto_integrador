import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Entities/product.dart';

class ViewProduct extends StatelessWidget {
  final Product product;
  final Function() onpresseddelete;
  final Function() onpressededit;

  const ViewProduct({
    Key? key,
    required this.product,
    required this.onpresseddelete,
    required this.onpressededit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text(product.description),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onpresseddelete,
      ),
      onTap: onpressededit,
    );
  }
}
