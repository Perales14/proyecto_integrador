import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Entities/category_controller.dart';
import 'package:proyecto_integrador/Entities/category.dart';
import 'package:proyecto_integrador/Views/ViewEdit/view_edit_category.dart';

// class ViewCategory extends StatefulWidget {
//   @override
//   _ViewCategoryState createState() => _ViewCategoryState();
// }

class ListCategoryWidget extends StatelessWidget {
  final List<Category> categories;
  final Function() setstate;
  const ListCategoryWidget({
    Key? key,
    required this.categories,
    required this.setstate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      print('categories.is empty');
      return const Center(
        child: Text('No hay categorias'),
      );
    }
    return Column(
      children: _listCategory(context),
    );
  }

  List<Widget> _listCategory(BuildContext context) {
    print('categories.is NOT empty');
    return categories.map((Category category) {
      return ListTile(
        // title: Text(category.name),
        title: Text('Nombre: ${category.name}'),
        subtitle: Text('Descripcion: ${category.description}'),
        onTap: () {
          print('Tocaste la categoria: ${category.name}');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditCategory(
                category: category,
              ),
            ),
          );
        },
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            print('Tocaste el boton de borrar');
            CategoryController().DeleteCategory(category.code);
            setstate();
          },
        ),
      );
    }).toList();
  }
}
