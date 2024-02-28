import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Entities/client.dart';
import 'package:proyecto_integrador/Views/ViewEdit/view_edit_client.dart';
import 'package:proyecto_integrador/Views/ViewSingle/view_client.dart';

class ListClientWidget extends StatelessWidget {
  final List<Client> clients;
  final Function() setstate;
  const ListClientWidget({
    Key? key,
    required this.clients,
    required this.setstate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (clients.isEmpty) {
      print('clients esta vacio');
      return const Center(
        child: Text('No hay clientes'),
      );
    }
    return Column(
      children: _listClient(context),
    );
  }

  List<Widget> _listClient(BuildContext context) {
    print('no esta vacio');
    return clients.map((Client clients) {
      return ViewClient(
        client: clients,
        onpresseddelete: () {
          // ProductController().DeleteProduct(producto.code);
          setstate();
        },
        onpressededit: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditClient(
                client: clients,
                // product: producto,
              ),
            ),
            // ignore: non_constant_identifier_names
          ).then((value) => setstate());
        },
      );
    }).toList();
  }
}
