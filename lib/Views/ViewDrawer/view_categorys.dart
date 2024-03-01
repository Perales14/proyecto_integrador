import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Entities/category_controller.dart';
import 'package:proyecto_integrador/Services/drawer.dart';
import 'package:proyecto_integrador/Views/ViewList/list_category.dart';
import 'package:proyecto_integrador/Views/ViewNew/view_new_category.dart';
import 'package:proyecto_integrador/Views/ViewNew/view_new_producct.dart';

class ViewCategorys extends StatefulWidget {
  const ViewCategorys({super.key});

  @override
  _ViewCategoryState createState() => _ViewCategoryState();
}

class _ViewCategoryState extends State<ViewCategorys> {
  @override
  void initState() {
    super.initState();
    CategoryController categoryController = CategoryController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(headerText: 'Categorias'),
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const Text('Categorias'),
            ListCategoryWidget(
              setstate: () {
                setState(() {});
              },
              categories: CategoryController().ListCategories(),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          onPressed: () {
            print('Si toco el boton agregar');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewNewCategory()),
            ).whenComplete(() => setState(() {}));
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
