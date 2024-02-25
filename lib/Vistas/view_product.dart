import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Entities/product.dart';

class ViewProduct extends StatefulWidget {
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
        onPressed: widget.onpresseddelete,
      ),
      onTap: widget.onpressededit,
    );
  }
}
