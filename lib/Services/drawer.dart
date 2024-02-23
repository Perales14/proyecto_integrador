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
              //sacar de la box de hive llamada 'usuarios'
              //var box = Hive.box('users');
              // String user = await Hive.//toma el valor del usuario
              Navigator.of(context).pop();
              Future.delayed(const Duration(milliseconds: 250), () {
                Navigator.pushReplacement(
                  context,
                  NoAnimationRoute(
                      myPageBuilder: (context) =>
                          const ViewHome(username: 'Luis')),
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
              Navigator.of(context).pop();
              Future.delayed(const Duration(milliseconds: 250), () {
                Navigator.pushReplacement(
                  context,
                  NoAnimationRoute(
                      myPageBuilder: (context) => const ViewStorage()),
                );
              });
            },
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(Icons.person),
                Text('Clientes'),
              ],
            ),
            onTap: () {
              Navigator.of(context).pop();
              Future.delayed(const Duration(milliseconds: 250), () {
                Navigator.pushReplacement(
                  context,
                  NoAnimationRoute(
                    myPageBuilder: (context) =>
                        const VewClent(username: 'Luis'),
                  ),
                );
              });
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
              Navigator.of(context).pop();
              Future.delayed(const Duration(milliseconds: 250), () {
                Navigator.pushReplacement(
                  context,
                  NoAnimationRoute(
                      myPageBuilder: (context) =>
                          const ViewHome(username: 'Luis')),
                );
              });
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
              Navigator.of(context).pop();
              Future.delayed(const Duration(milliseconds: 250), () {
                Navigator.pushReplacement(
                  context,
                  NoAnimationRoute(
                      myPageBuilder: (context) =>
                          const ViewHome(username: 'Luis')),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
