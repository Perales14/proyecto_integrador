import 'package:flutter/material.dart';

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
      return false;
    }
    if (descriptionController.text.isEmpty) {
      return false;
    }
    if (quantityController.text.isEmpty) {
      return false;
    }
    if (priceController.text.isEmpty) {
      return false;
    }
    if (categoryController.text.isEmpty) {
      return false;
    }
    if (codeController.text.isEmpty) {
      return false;
    }

    if (quantityController.text.contains(RegExp(r'[a-zA-Z]'))) {
      return false;
    }
    if (priceController.text.contains(RegExp(r'[a-zA-Z]'))) {
      return false;
    }
    if (codeController.text.contains(RegExp(r'[a-zA-Z]'))) {
      return false;
    }

    return true;
  }
}
