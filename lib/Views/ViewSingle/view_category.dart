import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Entities/category.dart';

class ViewCategory extends StatelessWidget {
  final Category category;
  final Function() onpresseddelete;
  final Function() onpressededit;
  const ViewCategory(
      {super.key,
      required this.category,
      required this.onpresseddelete,
      required this.onpressededit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Nombre: ${category.name}'),
      subtitle: Text('Descripcion: ${category.description}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onpresseddelete,
      ),
      onTap: onpressededit,
    );
  }
}
