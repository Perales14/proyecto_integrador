import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Services/animation_route.dart';
import 'package:proyecto_integrador/Vistas/view_home.dart';
import 'package:proyecto_integrador/Vistas/view_storage.dart';

class MyDrawer extends StatelessWidget {
  final String headerText;

  const MyDrawer({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(headerText), // Usa el texto pasado al constructor aquí
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.home),
                Text(' Inicio'),
              ],
            ),
            onTap: () {
              Navigator.of(context).pop();
              Future.delayed(const Duration(milliseconds: 250), () {
                Navigator.pushReplacement(
                  context,
                  NoAnimationRoute(
                      myPageBuilder: (context) => const ViewHome()),
                );
              });
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.storage),
                Text(' Almacen'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ViewStorage()),
              );
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.person),
                Text(' Clientes'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ViewStorage()),
              );
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.dns_rounded),
                Text(' Categorias'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ViewStorage()),
              );
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.store),
                Text(' Realizar Venta'),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ViewStorage()),
              );
            },
          ),
          // Agrega más ListTile aquí para más elementos en el Drawer
        ],
      ),
    );
  }
}
