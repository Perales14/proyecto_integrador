import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ViewTemplate extends StatefulWidget {
  final String tittle;
  final Icon icon;
  final Function() onpressedcancel;
  final Function() onpressedsave;
  final List<String> nombres;
  final List<TextEditingController> datos;
  final bool leadingappbar;
  const ViewTemplate({
    super.key,
    required this.leadingappbar,
    required this.tittle,
    required this.icon,
    required this.onpressedcancel,
    required this.onpressedsave,
    required this.nombres,
    required this.datos,
  });

  @override
  ViewTemplateState createState() => ViewTemplateState();
}

class ViewTemplateState extends State<ViewTemplate> {
  // int tamaño = widget.nombres.isEmpty?0:widget.nombres.length;

  List<Widget> lista = [];
  @override
  void initState() {
    super.initState();
    //si tamaño de datos.lenght
    //esto debido a que SIEMPRE debe de haber controladores.
    // ya que como esto es una plantilla no podria utiliza un cotrolador en especifico, por lo que debe de recibirlo
    // para que el que se haya mandado, pueda ser usado en el  "controlador" para guadarlo.

    for (int i = 0; i < widget.nombres.length; i++) {
      lista.add(
        Text(widget.nombres[i]),
      );
      lista.add(
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
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
  }

  // String titulo = widget.tittle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Column(
            // children: lista,
            ),
        SingleChildScrollView(
          child: Stack(
            children: [
              Column(
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
              Positioned(
                bottom: 10,
                right: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: widget.onpressedsave,
                  child: const Icon(
                    Icons.save,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
