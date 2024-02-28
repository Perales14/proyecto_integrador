import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Validaciones/category_valid.dart';
import 'package:proyecto_integrador/Template/view_template.dart';

class ViewNewCategory extends StatefulWidget {
  const ViewNewCategory({Key? key}) : super(key: key);

  @override
  _ViewNewCategoryState createState() => _ViewNewCategoryState();
}

class _ViewNewCategoryState extends State<ViewNewCategory> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  TextEditingController codecontroller = TextEditingController();

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
            print(namecontroller.text);
            print(descriptioncontroller.text);
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
      body: SingleChildScrollView(
        child: ViewTemplate(
          leadingappbar: false,
          tittle: 'Nueva categoria',
          icon: const Icon(Icons.cancel_outlined),
          onpressedcancel: () {},
          nombres: const [
            'Nombre',
            'Descripcion',
            'Codigo',
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
