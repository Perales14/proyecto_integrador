import 'package:flutter/material.dart';

class ViewTemplate extends StatefulWidget {
  final String tittle;
  final Icon icon;
  final Function() OnPressed;
  final List<String> nombres;
  final List<String> datos;
  const ViewTemplate({
    super.key,
    required this.tittle,
    required this.icon,
    required this.OnPressed,
    required this.nombres,
    this.datos = const [],
  });

  @override
  ViewTemplateState createState() => ViewTemplateState();
}

class ViewTemplateState extends State<ViewTemplate> {
  List<TextEditingController> controllers = [];
  List<Widget> lista = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.nombres.length; i++) {
      lista.add(
        // ListTile(
        //   title: Text(widget.nombres[i]),
        //   subtitle: Text(widget.datos[i]),
        // ),
        Text(widget.nombres[i]),
      );
      String dato = i < widget.datos.length ? widget.datos[i] : '';
      TextField(
        controller: controllers[i] = TextEditingController(text: dato),
        decoration: InputDecoration(
          labelText: widget.nombres[i],
        ),
      );
    }
  }

  // String titulo = widget.tittle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      appBar: AppBar(
        title: Text(widget.tittle),
        actions: <Widget>[
          IconButton(
            icon: widget.icon,
            onPressed: widget.OnPressed,
          ),
        ],
      ),
    );
  }
}
