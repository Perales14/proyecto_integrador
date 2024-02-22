import 'package:flutter/material.dart';

class ViewNewProduct extends StatefulWidget {
  const ViewNewProduct({Key? id}) : super(key: id);

  @override
  ViewNewProductState createState() => ViewNewProductState();
}

class ViewNewProductState extends State<ViewNewProduct> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Producto'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // Icon(Icons.abc),
            Text('Nombre'),
            TextField(
              // controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
