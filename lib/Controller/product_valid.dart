import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/product_controller.dart';

class ProductValid {
  bool validProduct(
    TextEditingController nameController,
    TextEditingController descriptionController,
    TextEditingController quantityController,
    TextEditingController priceController,
    TextEditingController categoryController,
    TextEditingController codeController,
  ) {
    if (nameController.text.isEmpty) {
      print('nameController.text.isEmpty');
      return false;
    }
    if (descriptionController.text.isEmpty) {
      print('descriptionController.text.isEmpty');
      return false;
    }
    if (quantityController.text.isEmpty) {
      print('quantityController.text.isEmpty');
      return false;
    }
    if (priceController.text.isEmpty) {
      print('priceController.text.isEmpty');
      return false;
    }
    if (categoryController.text.isEmpty) {
      print('categoryController.text.isEmpty');
      return false;
    }
    if (codeController.text.isEmpty) {
      print('codeController.text.isEmpty');
      return false;
    }

    if (quantityController.text.contains(RegExp(r'[a-zA-Z]'))) {
      print('quantityController.text.contains(RegExp(r\'[a-zA-Z]\'))');
      return false;
    }
    if (priceController.text.contains(RegExp(r'[a-zA-Z]'))) {
      print('priceController.text.contains(RegExp(r\'[a-zA-Z]\'))');
      return false;
    }
    if (codeController.text.contains(RegExp(r'[a-zA-Z]'))) {
      print('codeController.text.contains(RegExp(r\'[a-zA-Z]\'))');
      return false;
    }

    ProductController().AddProduct(
      nameController,
      descriptionController,
      quantityController,
      priceController,
      categoryController,
      codeController,
    );

    return true;
  }
}
