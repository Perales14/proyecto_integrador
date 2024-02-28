import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Views/ViewSingle/view_prod.dart';

class ViewSearchProduct extends StatelessWidget {
  List<ViewProd> products = [];
  ViewSearchProduct({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: products,
    );
  }
}
