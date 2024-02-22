import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Services/drawer.dart';

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
      body: const SingleChildScrollView(
        child: Column(children: [
            ListTile(
              title: Text('Producto 1'),
              subtitle: Text('Descripcion'),
              leading: Text('10'),
              // onTap: () {
              // },
            ),
            ListTile(
              title: Text('Producto 2'),
              subtitle: Text('Descripcion'),
              leading: Text('20'),
              // onTap: () {
              // },
            ),
            ListTile(
              title: Text('Producto 3'),
              subtitle: Text('Descripcion'),
              leading: Text('30'),
              // onTap: () {
              // },
            ),
            ListTile(
              title: Text('Producto 4'),
              subtitle: Text('Descripcion'),
              leading: Text('40'),
              // onTap: () {
              // },
            ),
        ],),
      ),
    bottomNavigationBar: BottomAppBar(
      child: IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, '/add');
            },
            icon: const Icon(Icons.add),
          ),
    ),);
  }
}
