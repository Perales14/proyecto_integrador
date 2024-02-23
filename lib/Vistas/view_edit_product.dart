import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  final String name;
  final String description;
  final String category;
  final String quantity;
  final String price;
  final String code;
  const EditProduct(
      {Key? key,
      required this.name,
      required this.description,
      required this.category,
      required this.quantity,
      required this.price,
      required this.code})
      : super(key: key);
  // const EditProduct({super.key});

  @override
  EditProductState createState() => EditProductState();
}

class EditProductState extends State<EditProduct> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController; // = TextEditingController();
    TextEditingController descriptionController; // = TextEditingController();
    TextEditingController quantityController; //;// = TextEditingController();
    TextEditingController priceController; // = TextEditingController();
    TextEditingController categoryController; // = TextEditingController();
    TextEditingController codeController; // = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Producto'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.cancel_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Nombre'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: nameController =
                      TextEditingController(text: widget.name),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 164, 189, 202),
                    ),
                  ),
                ),
              ),
              const Text('Descripcion'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: descriptionController =
                      TextEditingController(text: widget.description),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descripcion',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 164, 189, 202),
                    ),
                  ),
                ),
              ),
              const Text('Categoria'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: categoryController =
                      TextEditingController(text: widget.category),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Categoria',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 164, 189, 202),
                    ),
                  ),
                ),
              ),
              const Text('Cantidad'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: quantityController =
                      TextEditingController(text: widget.quantity),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Cantidad',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 164, 189, 202),
                    ),
                  ),
                ),
              ),
              const Text('Precio'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: priceController =
                      TextEditingController(text: widget.price),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Precio',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 164, 189, 202),
                    ),
                  ),
                ),
              ),
              const Text('Codigo'),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: codeController =
                      TextEditingController(text: widget.code),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Codigo',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 164, 189, 202),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
} 
//  3. Crear la vista de la lista de productos 
 // Path: lib/Vistas/view_list_products.dart