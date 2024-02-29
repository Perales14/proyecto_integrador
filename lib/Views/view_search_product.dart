import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Entities/product_controller.dart';
import 'package:proyecto_integrador/Entities/product.dart';
import 'package:proyecto_integrador/Views/ViewSingle/view_prod.dart';

class ViewSearchProduct extends StatefulWidget {
  final Function() onProductSelected;
  const ViewSearchProduct({super.key, required this.onProductSelected});

  @override
  State<ViewSearchProduct> createState() => _ViewSearchProductState();
}

class _ViewSearchProductState extends State<ViewSearchProduct> {
  TextEditingController codeController = TextEditingController(text: '');
  List<ViewProd> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar producto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Nombre del producto:'),
            TextField(
              controller: codeController,
              onChanged: (value) {
                if (ProductController().searchProduct(
                  codeController.text,
                )) {
                  Product product = ProductController().GetProduct(
                    codeController.text,
                  );
                  setState(
                    () {
                      products.add(
                        ViewProd(
                          product: product,
                          ontap: () {
                            widget.onProductSelected();
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
            products.isEmpty
                ? const Text('No hay productos')
                : Expanded(
                    // child: Text('Productos'),
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ViewProd(
                          product: products[index].product,
                          ontap: () {
                            widget.onProductSelected();
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
