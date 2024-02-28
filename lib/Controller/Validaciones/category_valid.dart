import 'dart:convert';

import 'package:proyecto_integrador/Controller/Entities/category_controller.dart';

class CategoryValid {
  CategoryController categoryController = CategoryController();
  String? name;
  String? description;
  String? status;

  CategoryValid({this.name, this.description, this.status});

  void ValidCategory(
    namecontroller,
    descriptioncontroller,
    codecontroller,
  ) {
    if (namecontroller.text == '' ||
        descriptioncontroller.text == '' ||
        codecontroller.text == '') {
      print('Faltan datos');
      return;
    } else {
      print('Datos completos');
      categoryController.AddCategory(
        namecontroller,
        descriptioncontroller,
        codecontroller,
      );
    }
  }
}
