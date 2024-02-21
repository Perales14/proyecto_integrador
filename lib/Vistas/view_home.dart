import 'package:flutter/material.dart';

class view_home extends StatefulWidget {
  const view_home({Key? id}) : super(key: id);
  @override
  ViewHomeState createState() => ViewHomeState();
}

class ViewHomeState extends State<view_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[],
        title: const Text('Ini cio'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu_open),
          onPressed: () {
            const Drawer(
              child: Column(children: <Widget>[
                Row(
                  children: [Icon(Icons.home), Text('Inicio')],
                ),
                Row(
                  children: [Icon(Icons.storage), Text('Almacen')],
                ),
                Row(
                  children: [Icon(Icons.person), Text('Clientes')],
                ),
                Row(
                  children: [Icon(Icons.store), Text('Realizar Venta')],
                ),
              ]),
            );
          },
        ),
      ),
      // floatingActionButton: ],
    );
  }
}
