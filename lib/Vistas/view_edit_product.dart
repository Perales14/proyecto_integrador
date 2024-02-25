import 'package:flutter/material.dart';
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
    return SingleChildScrollView(
      child: SizedBox(
        child: ViewTemplate(
          leadingappbar: false,
          tittle: 'Editar Producto',
          icon: const Icon(Icons.cancel),
          onpressedsave: () {
            //guarda los cambios en el producto con Id "codigo"
            print(namecontroller.text);
          },
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
