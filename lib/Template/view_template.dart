import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Entities/category.dart';

class ViewTemplate extends StatefulWidget {
  final String tittle;
  final Icon icon;
  final Function() onpressedcancel;
  final List<String> nombres;
  final List<TextEditingController> datos;
  final bool leadingappbar;
  // final List<Category> categorias;
  final DropdownButton? dropdownButton;
  // Function()? update;
  const ViewTemplate({
    super.key,
    required this.leadingappbar,
    required this.tittle,
    required this.icon,
    required this.onpressedcancel,
    required this.nombres,
    required this.datos,
    //opcionales
    // this.categorias = const [],
    this.dropdownButton,
    // this.update,
  });

  @override
  ViewTemplateState createState() => ViewTemplateState();
}

class ViewTemplateState extends State<ViewTemplate> {
  List<Widget> lista = [];
  String currentCategory = '';

  @override
  void initState() {
    super.initState();
    // currentCategory = widget.categorias[0].code;
    for (int i = 0; i < widget.nombres.length; i++) {
      lista.add(
        Text(widget.nombres[i]),
      );
      lista.add(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            //al presionar enter se pase al sig campo
            textInputAction: TextInputAction.next,
            controller: widget.datos[i],
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelStyle: TextStyle(
                color: Color.fromARGB(255, 164, 189, 202),
              ),
            ),
          ),
        ),
      );
    }
    if (widget.dropdownButton != null) {
      lista.insert(4, widget.dropdownButton!);
    } else {
      print('no entro');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: widget.leadingappbar,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            title: Text(widget.tittle),
            actions: [
              IconButton(
                icon: widget.icon,
                onPressed: widget.onpressedcancel,
              ),
            ],
          ),
          Column(
            children: lista,
          ),
        ],
      ),
    );
  }
}
