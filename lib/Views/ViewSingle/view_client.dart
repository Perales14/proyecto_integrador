import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Entities/client.dart';

class ViewClient extends StatelessWidget {
  final Client client;
  final Function() onpresseddelete;
  final Function() onpressededit;
  const ViewClient(
      {super.key,
      required this.client,
      required this.onpresseddelete,
      required this.onpressededit});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Nombre: ${client.name}'),
      subtitle: Text('Apellido: ${client.lastName}'),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onpresseddelete,
      ),
      onTap: onpressededit,
    );
  }
}
