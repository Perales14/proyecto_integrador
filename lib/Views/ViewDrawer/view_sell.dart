import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Entities/product_controller.dart';
import 'package:proyecto_integrador/Controller/Validaciones/product_valid.dart';
import 'package:proyecto_integrador/Entities/product.dart';
import 'package:proyecto_integrador/Services/drawer.dart';
import 'package:proyecto_integrador/Views/ViewSingle/view_prod.dart';
import 'package:proyecto_integrador/Views/ViewSingle/view_product.dart';
import 'package:proyecto_integrador/Views/ViewSingle/view_sell_product.dart';
import 'package:proyecto_integrador/Views/view_search_product.dart';

class ViewSell extends StatefulWidget {
  const ViewSell({super.key});

  @override
  State<ViewSell> createState() => _ViewSellState();
}

class _ViewSellState extends State<ViewSell> {
  List<Widget> products = [];
  ProductController Pr = ProductController();
  TextEditingController codeController = TextEditingController();

  void deleteProduct(String code) {
    setState(() {
      products.removeWhere((element) {
        if (element is ViewSellProduct) {
          return element.code == code;
        }
        return false;
      });
    });
    print('elimina el producto con el codigo: $code');
    print('');
    print('productos: $products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(
        headerText: 'Vender',
      ),
      appBar: AppBar(
        title: const Text('Vender'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ViewSearchProduct(
                    onProductSelected: () {
                      // setState(() {

                      // });
                    },
                  ),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text('Código de barras'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                bottom: 6.0,
                top: 6.0,
              ),
              child: TextField(
                onSubmitted: (value) {
                  if (Pr.searchProduct(codeController.text)) {
                    Product product = Pr.GetProduct(codeController.text);
                    setState(() {
                      products.add(
                        ViewSellProduct(
                          deleteProduct: () {
                            deleteProduct(product.code);
                          },
                          code: product.code,
                          name: product.name,
                          unitPrice: double.parse(product.price),
                          quantity: 1,
                        ),
                      );
                    });
                  } else {
                    const snackBar = SnackBar(
                      content: Text('Producto no encontrado'),
                      behavior: SnackBarBehavior
                          .floating, // Establecer el comportamiento a flotante
                    );

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                textInputAction: TextInputAction.next,
                controller: codeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 164, 189, 202),
                  ),
                ),
              ),
            ),
            products.isEmpty
                ? const Text('No hay productos')
                : Expanded(
                    child: ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return products[index];
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
