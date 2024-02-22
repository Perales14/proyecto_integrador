import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Services/drawer.dart';

class ViewHome extends StatefulWidget {
  final String username;
  const ViewHome({Key? id, required this.username}) : super(key: id);
  @override
  ViewHomeState createState() => ViewHomeState();
}

class ViewHomeState extends State<ViewHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[],
        title: const Text('Inicio'),
        // automaticallyImplyLeading: false,
      ),
      body: const Column(
        children: [
          // Icon(Icons.abc),
          Text('Bienvenido')
        ],
      ),
      drawer: const MyDrawer(headerText: 'Inicio'),
    );
  }
}
