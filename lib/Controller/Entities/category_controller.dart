import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proyecto_integrador/Entities/category.dart';

class CategoryController {
  // Hive.openBox('categories');
  void init() async {
    await Hive.openBox('categories');
  }

  void AddCategory(
    TextEditingController nameController,
    TextEditingController descriptionController,
    TextEditingController codeController,
  ) {
    _AddCategoryObject(
      Category(
        code: codeController.text,
        name: nameController.text,
        description: descriptionController.text,
      ),
    );
  }

  void _AddCategoryObject(Category category) async {
    var categories = await Hive.openBox('categories');
    await categories.put(category.code, {
      'nombre': category.name,
      'descripcion': category.description,
      'codigo': category.code,
    });
  }

  bool searchProduct(String code) {
    var categories = Hive.box('categories');
    var category = categories.get(code);
    if (category != null) {
      return true;
    } else {
      return false;
    }
  }

  Category GetCategory(String code) {
    var categories = Hive.box('categories');
    var category = categories.get(code);
    if (category != null) {
      return Category(
        code: category['codigo'],
        name: category['nombre'],
        description: category['descripcion'],
      );
    } else {
      return Category();
    }
  }

  void DeleteCategory(String code) {
    var categories = Hive.box('categories');
    categories.delete(code);
  }

  List<Category> ListCategories() {
    init();
    var categories = Hive.box('categories');
    if (categories.isNotEmpty) {
      List<Category> list = [];
      for (var i = 0; i < categories.length; i++) {
        list.add(Category(
          code: categories.getAt(i)['codigo'],
          name: categories.getAt(i)['nombre'],
          description: categories.getAt(i)['descripcion'],
        ));
      }
      return list;
    }
    return [];
  }
}
