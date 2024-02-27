import 'package:hive/hive.dart';
import 'package:proyecto_integrador/Entities/product.dart';

class ProductController {
//future builder
  void AddProduct(Product proudct) {
    var products = Hive.box('products');

    products.put(proudct.code, {
      'nombre': proudct.name,
      'precio': proudct.price,
      'cantidad': proudct.quantity,
      'descripcion': proudct.description,
      'categoria': proudct.category,
      'codigo': proudct.code
    });
  }

  void DeleteProduct(String code) {
    var products = Hive.box('products');
    products.delete(code);
  }

  List<Product> ListProduct() {
    List<Product> listproducts = [];
    var products = Hive.box('products');

    for (var producto in products.values) {
      listproducts.add(
        Product(
          code: producto['codigo'],
          name: producto['nombre'],
          price: producto['precio'],
          quantity: producto['cantidad'],
          description: producto['descripcion'],
          category: producto['categoria'],
        ),
      );
    }
    return listproducts;
  }
}
