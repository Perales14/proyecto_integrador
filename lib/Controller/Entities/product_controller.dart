import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:proyecto_integrador/Entities/product.dart';

class ProductController {
//future builder

  void AddProduct(
    TextEditingController nameController,
    TextEditingController descriptionController,
    TextEditingController quantityController,
    TextEditingController priceController,
    TextEditingController categoryController,
    TextEditingController codeController,
  ) {
    _AddProductObject(
      Product(
        code: codeController.text,
        name: nameController.text,
        price: priceController.text,
        quantity: quantityController.text,
        description: descriptionController.text,
        category: categoryController.text,
      ),
    );
  }

  void _AddProductObject(Product product) async {
    var products = await Hive.openBox('products'); // Abre la caja 'products'
    await products.put(product.code, {
      'nombre': product.name,
      'precio': product.price,
      'cantidad': product.quantity,
      'descripcion': product.description,
      'categoria': product.category,
      'codigo': product.code
    });
  }

  bool searchProduct(String code) {
    var products = Hive.box('products');
    var producto = products.get(code);
    if (producto != null) {
      return true;
    } else {
      return false;
    }
  }

  Product GetProduct(String code) {
    var products = Hive.box('products');
    var producto = products.get(code);
    if (producto != null) {
      return Product(
        code: producto['codigo'],
        name: producto['nombre'],
        price: producto['precio'],
        quantity: producto['cantidad'],
        description: producto['descripcion'],
        category: producto['categoria'],
      );
    } else {
      return Product();
    }
  }

  void DeleteProduct(String code) async {
    var products = Hive.box('products');
    await products.delete(code);
  }

  List<Product> ListProduct() {
    var products = Hive.box('products');

    if (products.isNotEmpty) {
      List<Product> listaProductos = [];
      for (var i = 0; i < products.length; i++) {
        listaProductos.add(
          Product(
            code: products.getAt(i)['codigo'],
            name: products.getAt(i)['nombre'],
            price: products.getAt(i)['precio'],
            quantity: products.getAt(i)['cantidad'],
            description: products.getAt(i)['descripcion'],
            category: products.getAt(i)['categoria'],
          ),
        );
      }
      return listaProductos;
    }
    return [];
  }

  List<Product> ListProductCategories(String Category) {
    //tomar los productos que tengan de categoria "Category"
    var products = Hive.box('products');
    // var products = Hive.box('products');

    if (products.isNotEmpty) {
      List<Product> listaProductos = [];

      for (var i = 0; i < products.length; i++) {
        if (products.getAt(i)['categoria'] == Category) {
          listaProductos.add(
            Product(
              code: products.getAt(i)['codigo'],
              name: products.getAt(i)['nombre'],
              price: products.getAt(i)['precio'],
              quantity: products.getAt(i)['cantidad'],
              description: products.getAt(i)['descripcion'],
              category: products.getAt(i)['categoria'],
            ),
          );
        }
      }
    }
    return [];
  }
}
