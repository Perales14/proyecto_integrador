import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Template/view_template.dart';

class ViewNewProduct extends StatefulWidget {
  const ViewNewProduct({Key? id}) : super(key: id);

  @override
  ViewNewProductState createState() => ViewNewProductState();
}

class ViewNewProductState extends State<ViewNewProduct> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController categoryController = TextEditingController();
    TextEditingController codeController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: ViewTemplate(
          leadingappbar: true,
          tittle: 'Nuevo Producto',
          icon: const Icon(Icons.cancel_outlined),
          onpressedcancel: () {
            Navigator.pop(context);
            print('Cancelar');
          },
          onpressedsave: () {
            print(nameController.text);
          },
          nombres: const [
            'Nombre',
            'Descripcion',
            'Cantidad',
            'Precio',
            'Categoria',
            'Codigo',
          ],
          datos: [
            nameController,
            descriptionController,
            quantityController,
            priceController,
            categoryController,
            codeController,
          ],
        ),
      ),
    );
  }
}
