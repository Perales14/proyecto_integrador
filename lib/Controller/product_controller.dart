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
      TextEditingController codeController) {
    AddProductObject(
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

  void AddProductObject(Product product) async {
    var products = await Hive.openBox('products'); // Abre la caja 'products'
    products.put(product.code, {
      'nombre': product.name,
      'precio': product.price,
      'cantidad': product.quantity,
      'descripcion': product.description,
      'categoria': product.category,
      'codigo': product.code
    });
  }

  Product GetProduct(String code) {
    var products = Hive.box('products');
    var producto = products.get(code);
    return Product(
      code: producto['codigo'],
      name: producto['nombre'],
      price: producto['precio'],
      quantity: producto['cantidad'],
      description: producto['descripcion'],
      category: producto['categoria'],
    );
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
}
