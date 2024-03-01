import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Validaciones/client_valid.dart';
import 'package:proyecto_integrador/Entities/client.dart';
import 'package:proyecto_integrador/Template/view_template.dart';

class EditClient extends StatefulWidget {
  final Client client;

  const EditClient({super.key, required this.client});
  @override
  _EditClientState createState() => _EditClientState();
}

class _EditClientState extends State<EditClient> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  // TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  // TextEditingController addresscontroller = TextEditingController();
  TextEditingController codecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.client.name;
    lastnamecontroller.text = widget.client.lastName;
    // emailcontroller.text = widget.client.email;
    phonecontroller.text = widget.client.phone;
    // addresscontroller.text = widget.client.address;
    codecontroller.text = widget.client.code;
  }

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
            // print(namecontroller.text);
            // ProductController().AddProduct
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
          tittle: 'Editar Producto',
          icon: const Icon(Icons.cancel),
          onpressedcancel: () {
            Navigator.pop(context);
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
