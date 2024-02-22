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
        automaticallyImplyLeading: false,
        title: const Text('Nuevo Producto'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                ),
                onPressed: () {},
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Si toco el boton save');
          //llama al controlador para que guarde el producto, esto usando los controladores de los textfields
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //poner nombre,descripcion, categoria,cantidad y precio
            const Text('Nombre'),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: nameController,
                // controller: descriptionController,
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
                controller: descriptionController,
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
                controller: categoryController,
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
                controller: quantityController,
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
                controller: priceController,
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
                controller: codeController,
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
      ),
    );
  }
}
