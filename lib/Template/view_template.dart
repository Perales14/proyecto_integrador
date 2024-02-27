import 'package:flutter/material.dart';

class ViewTemplate extends StatefulWidget {
  final String tittle;
  final Icon icon;
  final Function() onpressedcancel;
  final List<String> nombres;
  final List<TextEditingController> datos;
  final bool leadingappbar;
  final Widget cat;
  const ViewTemplate({
    super.key,
    required this.leadingappbar,
    required this.tittle,
    required this.icon,
    required this.onpressedcancel,
    required this.nombres,
    required this.datos,
    //usar un widget que no modifique la vista (de constante)
    this.cat = const SizedBox(
      height: 0.0,
      width: 0.0,
    ),
  });

  @override
  ViewTemplateState createState() => ViewTemplateState();
}

class ViewTemplateState extends State<ViewTemplate> {
  List<Widget> lista = [];
  @override
  void initState() {
    super.initState();
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

    //agregar en la posicion 5 el widget cat
    // lista.insert(5, widget.cat);
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
