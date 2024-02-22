import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Services/drawer.dart';
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
              title: const Text('Productooso 1'),
              subtitle: const Text('Descripcion'),
              leading: const Text('10'),
              onTap: () {
                // Navigator.
                const Dialog(
                  child: Column(
                    children: [
                      Text('Producto 1'),
                      Text('Descripcion'),
                      Text('10'),
                    ],
                  ),
                );
              },
            ),
            const ListTile(
              title: Text('Producto 2'),
              subtitle: Text('Descripcion'),
              leading: Text('20'),
              // onTap: () {
              // },
            ),
            const ListTile(
              title: Text('Producto 3'),
              subtitle: Text('Descripcion'),
              leading: Text('30'),
              // onTap: () {
              // },
            ),
            const ListTile(
              title: Text('Producto 4'),
              subtitle: Text('Descripcion'),
              leading: Text('40'),
              // onTap: () {
              // },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
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
    );
  }
}
