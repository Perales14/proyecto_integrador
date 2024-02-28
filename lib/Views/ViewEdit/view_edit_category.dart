import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Validaciones/category_valid.dart';
import 'package:proyecto_integrador/Entities/category.dart';
import 'package:proyecto_integrador/Template/view_template.dart';

class EditCategory extends StatefulWidget {
  final Category category;
  const EditCategory({Key? key, required this.category}) : super(key: key);

  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController codecontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    namecontroller.text = widget.category.name;
    descriptioncontroller.text = widget.category.description;
    codecontroller.text = widget.category.code;
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
            CategoryValid().ValidCategory(
              namecontroller,
              descriptioncontroller,
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
      // appBar: AppBar(
      //   title: const Text('Editar Categoria'),
      // ),
      // body: SingleChildScrollView(
      //   child: ViewTemplate(
      //     leadingappbar: false,
      //     tittle: 'Editar Categoria',
      //     icon: const Icon(Icons.cancel),
      //     onpressedcancel: () {
      //       Navigator.pop(context);
      //     },
      //     nombres: const [
      //       'Nombre: ',
      //       'Descripcion: ',
      //       'Codigo: ',
      //     ],
      //     datos: [
      //       namecontroller,
      //       descriptioncontroller,
      //       codecontroller
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: ViewTemplate(
          leadingappbar: false,
          tittle: 'Editar Categoria',
          icon: const Icon(Icons.cancel),
          onpressedcancel: () {
            Navigator.pop(context);
          },
          nombres: const [
            'Nombre: ',
            'Descripcion: ',
            'Codigo: ',
          ],
          datos: [
            namecontroller,
            descriptioncontroller,
            codecontroller,
          ],
        ),
      ),
    );
  }
}
