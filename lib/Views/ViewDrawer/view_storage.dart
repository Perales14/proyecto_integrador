import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Entities/category_controller.dart';
import 'package:proyecto_integrador/Controller/Entities/product_controller.dart';
import 'package:proyecto_integrador/Entities/category.dart';
import 'package:proyecto_integrador/Services/drawer.dart';
import 'package:proyecto_integrador/Views/ViewList/list_product.dart';
import 'package:proyecto_integrador/Views/ViewNew/view_new_producct.dart';

class ViewStorage extends StatefulWidget {
  const ViewStorage({Key? id}) : super(key: id);
  @override
  ViewStorageState createState() => ViewStorageState();
}

class ViewStorageState extends State<ViewStorage> {
  List<Category> categorias = [];
  @override
  void initState() {
    super.initState();
    categorias = CategoryController().ListCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(headerText: 'Almacen'),
      appBar: AppBar(
        title: const Text('Almacen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListProductWidget(
              setstate: () {
                setState(() {});
              },
              products: ProductController().ListProduct(),
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
            if (categorias.isEmpty) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('No hay categorias'),
                    content: const Text('Debe agregar una categoria primero'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  );
                },
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ViewNewProduct()),
              ).whenComplete(() => setState(() {}));
            }
            // then(
            //   (value) => {
            //     setState(
            //       () {},
            //     ),
            //   },
            // );
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
