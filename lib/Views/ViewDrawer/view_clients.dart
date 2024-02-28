import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Entities/client_controller.dart';
import 'package:proyecto_integrador/Services/drawer.dart';
import 'package:proyecto_integrador/Views/ViewList/list_client.dart';
import 'package:proyecto_integrador/Views/ViewNew/view_new_client.dart';

class ViewClients extends StatefulWidget {
  // final String nombre;
  // final String apellido;
  // final Function() onpresseddelete;
  // final Function() onpressededit;

  const ViewClients({
    Key? key,
    // required this.nombre,
    // required this.apellido,
    // required this.onpresseddelete,
    // required this.onpressededit
  }) : super(key: key);

  @override
  _ViewClientsState createState() => _ViewClientsState();
}

class _ViewClientsState extends State<ViewClients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(headerText: 'Clientes'),
      appBar: AppBar(
        title: const Text('Clientes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListClientWidget(
              setstate: () {
                setState(() {});
              },
              clients: ClientController().ListClient(),
            ),
            // ListProductWidget(
            //   setstate: () {
            //     setState(() {});
            //   },
            //   products: ProductController().ListProduct(),
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          onPressed: () {
            print('Si toco el boton agregar');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewNewClient()),
            ).then(
              (value) => {
                setState(
                  () {},
                ),
              },
            );
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
