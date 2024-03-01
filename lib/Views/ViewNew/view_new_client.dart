import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Validaciones/client_valid.dart';
import 'package:proyecto_integrador/Controller/Entities/product_controller.dart';
import 'package:proyecto_integrador/Template/view_template.dart';

class ViewNewClient extends StatefulWidget {
  const ViewNewClient({Key? key}) : super(key: key);

  @override
  _ViewNewClientState createState() => _ViewNewClientState();
}

class _ViewNewClientState extends State<ViewNewClient> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  // TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  // TextEditingController addresscontroller = TextEditingController();
  TextEditingController codecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: FloatingActionButton(
          // color: Colors.blue,
          backgroundColor: Colors.blue,
          onPressed: () {
            //guarda los cambios en el producto con Id "codigo"
            print(namecontroller.text);
            ClientValid().validClient(
              namecontroller,
              lastnamecontroller,
              // emailcontroller,
              phonecontroller,
              // addresscontroller,
              codecontroller,
            );
            Navigator.pop(context);
          },
          // color: Colors.blue,
          child: const Icon(
            Icons.save,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ViewTemplate(
          leadingappbar: false,
          tittle: 'Nuevo Cliente',
          icon: const Icon(Icons.cancel_outlined),
          onpressedcancel: () {
            Navigator.pop(context);
            print('Cancelar');
          },
          nombres: const [
            'Nombre',
            'Apellido',
            // 'Correo',
            'Telefono',
            // 'Direccion',
            'Codigo',
          ],
          datos: [
            namecontroller,
            lastnamecontroller,
            // emailcontroller,
            phonecontroller,
            // addresscontroller,
            codecontroller,
          ],
        ),
      ),
    );
  }
}
