import 'package:flutter/material.dart';

class ViewNewComponent extends StatefulWidget {
  final List<String> nombres;
  const ViewNewComponent({Key? key, required this.nombres}) : super(key: key);

  @override
  ViewNewComponentState createState() => ViewNewComponentState();
}

class ViewNewComponentState extends State<ViewNewComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Componente'),
      ),
    );
  }
}
