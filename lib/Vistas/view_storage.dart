import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Entities/product.dart';
import 'package:proyecto_integrador/Services/drawer.dart';
import 'package:proyecto_integrador/Vistas/view_edit_product.dart';
import 'package:proyecto_integrador/Vistas/view_new_producct.dart';

class ViewStorage extends StatefulWidget {
  const ViewStorage({Key? id}) : super(key: id);
  @override
  ViewStorageState createState() => ViewStorageState();
}

class ViewStorageState extends State<ViewStorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(headerText: 'Almacen'),
      appBar: AppBar(
        // actions: const <Widget>[],
        title: const Text('Almacen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text('Producto 1'),
              subtitle: const Text('Descripcion'),
              // leading: const Text('10'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  //elimina el producto con Id "codigo"
                  print('Eliminar');
                },
              ),
              onTap: () {
                // Navigator.
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: EditProduct(
                      product: Product(
                        name: 'Producto 1',
                        description: 'Descripcion',
                        price: '51',
                        category: 'Categoria',
                        quantity: '30',
                        code: '1213',
                      ),
                    ),
                  ),
                );
              },
            ),
            const ListTile(
              title: Text('Producto 2'),
              subtitle: Text('Descripcion'),
              // leading: Text('20'),
              // onTap: () {
              // },
            ),
            const ListTile(
              title: Text('Producto 3'),
              subtitle: Text('Descripcion'),
              // leading: Text('30'),
              // onTap: () {
              // },
            ),
            const ListTile(
              title: Text('Producto 4'),
              subtitle: Text('Descripcion'),
              // leading: Text('40'),
              // onTap: () {
              // },
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
              MaterialPageRoute(builder: (context) => const ViewNewProduct()),
            );
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
