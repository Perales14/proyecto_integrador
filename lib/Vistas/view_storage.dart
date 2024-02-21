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
      body: const Center(
        child: Text(
          'Almacen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
