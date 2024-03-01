import 'package:proyecto_integrador/Entities/product.dart';

class NewProductValid {
  final String code;
  final List<Product> products; // = [];
  // const NewProduct(required this.code, requi);
  NewProductValid({required this.code, required this.products});

  bool IsNew() {
    if (products.isEmpty) {
      return true;
    }
    for (var i = 0; i < products.length; i++) {
      if (products[i].code == code) {
        return false;
      }
    }
    return true;
  }
}
