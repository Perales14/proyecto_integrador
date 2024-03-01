import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Entities/category_controller.dart';
import 'package:proyecto_integrador/Controller/Validaciones/new_product_valid.dart';
import 'package:proyecto_integrador/Controller/Validaciones/product_valid.dart';
import 'package:proyecto_integrador/Controller/Entities/product_controller.dart';
import 'package:proyecto_integrador/Entities/category.dart';
import 'package:proyecto_integrador/Template/view_template.dart';

class ViewNewProduct extends StatefulWidget {
  const ViewNewProduct({Key? id}) : super(key: id);

  @override
  ViewNewProductState createState() => ViewNewProductState();
}

class ViewNewProductState extends State<ViewNewProduct> {
  List<Category> categorias = [];
  String currentCategory = '';
  DropdownButton cas = DropdownButton(
    value: null,
    items: const [],
    onChanged: (value) {},
  );
  //declarar objeto para metoer estoen funcion
  //(categoria) {
  //   currentCategory = categoria.toString();
  //   setState(() {});
  // }
  // Function() update = () {};
  @override
  void initState() {
    super.initState();
    categorias = CategoryController().ListCategories();
    currentCategory = categorias[0].name;

    // update = () {
    //   // currentCategory = '';
    //   //categoria.toString();
    //   setState(() {});
    //   print('AA');
    // };

    cas = DropdownButton(
      value: currentCategory,
      items: categorias
          .map(
            (categoria) => DropdownMenuItem(
              value: categoria.name,
              child: Text(categoria.name),
            ),
          )
          .toList(),
      onChanged: (categoria) {
        currentCategory = categoria.toString();
        // setState(() {});
        print('currentCategory: $currentCategory');
        // update();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController quantityController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController categoryController =
        TextEditingController(text: currentCategory);
    TextEditingController codeController = TextEditingController();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: FloatingActionButton(
          // color: Colors.blue,
          backgroundColor: Colors.blue,
          onPressed: () {
            //imprimir los valores
            categoryController = TextEditingController(text: currentCategory);

            print(nameController.text);
            print(descriptionController.text);
            print(quantityController.text);
            print(priceController.text);
            print(categoryController.text);
            print(codeController.text);

            if (NewProductValid(
                    code: codeController.text,
                    products: ProductController().ListProduct())
                .IsNew()) {
              ProductValid().validProduct(
                nameController,
                descriptionController,
                quantityController,
                priceController,
                categoryController,
                codeController,
              );
              Navigator.pop(context);
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content: const Text(
                          'Este codigo le pertenece a otro producto'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Aceptar'),
                        ),
                      ],
                    );
                  });
            }
          },
          // color: Colors.blue,
          child: const Icon(
            Icons.save,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ViewTemplate(
          // categorias: categorias,
          dropdownButton: cas,
          // update: update,
          // currentname: currentCategory,
          leadingappbar: false,
          tittle: 'Nuevo Producto',
          icon: const Icon(Icons.cancel_outlined),
          onpressedcancel: () {
            Navigator.pop(context);
            print('Cancelar');
            print(currentCategory);
            print('currentCategory');
          },
          nombres: const [
            'Nombre',
            'Descripcion',
            'Cantidad',
            'Precio',
            // 'Categoria',
            'Codigo',
          ],
          datos: [
            nameController,
            descriptionController,
            quantityController,
            priceController,
            // categoryController,
            codeController,
          ],
        ),
      ),
    );
  }
}
