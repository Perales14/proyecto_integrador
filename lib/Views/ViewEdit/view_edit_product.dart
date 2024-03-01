import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Entities/category_controller.dart';
import 'package:proyecto_integrador/Controller/Entities/product_controller.dart';
import 'package:proyecto_integrador/Controller/Validaciones/product_valid.dart';
import 'package:proyecto_integrador/Entities/category.dart';
import 'package:proyecto_integrador/Entities/product.dart';
import 'package:proyecto_integrador/Template/view_template.dart';

class EditProduct extends StatefulWidget {
  // final String name;
  // final String description;
  // final String category;
  // final String quantity;
  // final String price;
  // final String code;
  final Product product;
  const EditProduct({
    Key? key,
    // required this.name,
    // required this.description,
    // required this.category,
    // required this.quantity,
    // required this.price,
    // required this.code,
    required this.product,
  }) : super(key: key);

  @override
  EditProductState createState() => EditProductState();
}

class EditProductState extends State<EditProduct> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController categorycontroller = TextEditingController();
  TextEditingController quantitycontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController codecontroller = TextEditingController();
  List<Category> categorias = [];
  String currentCategory = '';
  DropdownButton cas = DropdownButton(
    value: null,
    items: const [],
    onChanged: (value) {},
  );
  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.product.name;
    descriptioncontroller.text = widget.product.description;
    categorycontroller.text = widget.product.category;
    quantitycontroller.text = widget.product.quantity;
    pricecontroller.text = widget.product.price;
    codecontroller.text = widget.product.code;
    categorias = CategoryController().ListCategories();
    currentCategory = widget.product.category;

    print('currentCategory: $currentCategory');

    cas = DropdownButton(
      // value: widget.product.category,
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
        print(categorycontroller.text);
        setState(() {});
      },
    );
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
            categorycontroller.text = currentCategory;
            ProductValid().validProduct(
              namecontroller,
              descriptioncontroller,
              quantitycontroller,
              pricecontroller,
              categorycontroller,
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
          dropdownButton: cas,
          leadingappbar: false,
          tittle: 'Editar Producto',
          icon: const Icon(Icons.cancel),
          // onpressedsave: () {
          //   //guarda los cambios en el producto con Id "codigo"
          //   print(namecontroller.text);
          // },
          onpressedcancel: () {
            //elimina el producto con Id "codigo"
            Navigator.pop(context);
          },
          nombres: const [
            'Nombre',
            'Descripción',
            // 'Categoría',
            'Cantidad',
            'Precio',
            'Código'
          ],
          datos: [
            namecontroller,
            descriptioncontroller,
            // categorycontroller,
            quantitycontroller,
            pricecontroller,
            codecontroller,
          ],
        ),
      ),
    );
  }
}
