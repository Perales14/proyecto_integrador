import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Entities/product.dart';

class ViewProd extends StatelessWidget {
  final Product product;
  // final Function() onpresseddelete;
  final Function() ontap;

  const ViewProd({
    Key? key,
    required this.product,
    // required this.onpress]eddelete,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text(product.description),
      // trailing: IconButton(
      //   icon: const Icon(Icons.delete),
      //   onPressed: onpresseddelete,
      // ),
      onTap: ontap,
    );
  }
}
