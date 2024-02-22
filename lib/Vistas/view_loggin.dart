import 'package:flutter/material.dart';

class ViewLoggin extends StatefulWidget {
  const ViewLoggin({Key? key}) : super(key: key);

  @override
  ViewLoginState createState() => ViewLoginState();
}

class ViewLoginState extends State<ViewLoggin> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
