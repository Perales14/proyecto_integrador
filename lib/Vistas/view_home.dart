import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Services/drawer.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({Key? id}) : super(key: id);
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
      drawer: const MyDrawer(headerText: 'Inicio'),
    );
  }
}
