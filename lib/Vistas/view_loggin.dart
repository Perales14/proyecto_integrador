import 'package:flutter/material.dart';

class view_loggin extends StatefulWidget {
  const view_loggin({Key? key}) : super(key: key);

  @override
  ViewLoginState createState() => ViewLoginState();
}

class ViewLoginState extends State<view_loggin> {
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inicio de Sesion'),
          shadowColor: Colors.white,
        ),
        body: const Column(
          children: <Widget>[
            Text('Bienvenido (a)'),
            SizedBox(
              width: 150,
              height: 150,
            ),
            Text('Usuario'),
            TextField(),
            Text('Contraseña'),
            TextField(),
          ],
        ));
  }
}
