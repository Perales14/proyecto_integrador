import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/product_controller.dart';
import 'package:proyecto_integrador/Controller/product_valid.dart';
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

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.product.name;
    descriptioncontroller.text = widget.product.description;
    categorycontroller.text = widget.product.category;
    quantitycontroller.text = widget.product.quantity;
    pricecontroller.text = widget.product.price;
    codecontroller.text = widget.product.code;
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
          // cat: Combobox(),
          // cat: const SizedBox(),
          //poner en cat un comboobox
          cat: DropdownButton<String>(
            // value: categorycontroller.text,
            // value: categorycontroller.text,
            onChanged: (String? newValue) {
              setState(() {
                categorycontroller.text = newValue!;
              });
            },
            items: <String>[
              'Categoria 1',
              'Categoria 2',
              'Categoria 3',
              'Categoria 4'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            // items: <String>[
            //   'Categoria 1',
            //   'Categoria 2',
            //   'Categoria 3',
            //   'Categoria 4'
            // ].map<DropdownMenuItem<String>>((String value) {
            //   return DropdownMenuItem<String>(
            //     value: value,
            //     child: Text(value),
            //   );
            // }).toList(),
          ),
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
            'Categoría',
            'Cantidad',
            'Precio',
            'Código'
          ],
          datos: [
            namecontroller,
            descriptioncontroller,
            categorycontroller,
            quantitycontroller,
            pricecontroller,
            codecontroller,
          ],
        ),
      ),
    );
  }
}
