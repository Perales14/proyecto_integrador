import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Entities/product_controller.dart';
import 'package:proyecto_integrador/Controller/Entities/search_controller.dart';
import 'package:proyecto_integrador/Controller/Validaciones/product_valid.dart';
import 'package:proyecto_integrador/Entities/product.dart';
import 'package:proyecto_integrador/Services/drawer.dart';
import 'package:proyecto_integrador/Views/ViewSingle/view_product.dart';
import 'package:proyecto_integrador/Views/ViewSingle/view_sell_product.dart';

class ViewSell extends StatefulWidget {
  const ViewSell({super.key});

  @override
  State<ViewSell> createState() => _ViewSellState();
}

class _ViewSellState extends State<ViewSell> {
  List<ViewSellProduct> products = [];
  TextEditingController codeController = TextEditingController();
  List<Widget> list = [];

  @override
  void initState() {
    super.initState();
    //
    //Expanded(
    //   child: SingleChildScrollView(
    //     child: Column(
    //         children: ),
    //   ),

    // ),
    //
    list = SearchControll(
      search: '',
      products: ProductController().ListProduct(),
    ).searchProduct();
    print('list.length');
    print(list.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(
        headerText: 'Vender',
      ),
      appBar: AppBar(
        title: const Text('Vender'),
      ),
      body: SingleChildScrollView(
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
                onChanged: (value) {
                  setState(
                    () {
                      // print(product.name);
                      list = SearchControll(
                        search: codeController.text,
                        products: ProductController().ListProduct(),
                      ).searchProduct();
                      print('list.length');
                      print(list.length);
                    },
                  );
                  // if (ProductController().searchProduct(
                  //   codeController.text,
                  // )) {
                  //   Product product = ProductController().GetProduct(
                  //     codeController.text,
                  //   );
                  //   setState(
                  //     () {
                  //       // print(product.name);
                  //       list = SearchControll(
                  //         search: codeController.text,
                  //         products: ProductController().ListProduct(),
                  //       ).searchProduct();
                  //       print('list.length');
                  //       print(list.length);
                  //       // list.add(value);

                  //       // products.add(
                  //       //   ViewSellProduct(
                  //       //     code: product.code,
                  //       //     name: product.name,
                  //       //     unitPrice: double.parse(product.price),
                  //       //     quantity: 5,
                  //       //   ),
                  //       // );
                  //     },
                  //   );
                  // } else {
                  //   const snackBar = SnackBar(
                  //     content: Text('Producto no encontrado'),
                  //     behavior: SnackBarBehavior
                  //         .floating, // Establecer el comportamiento a flotante
                  //   );

                  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  // }
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
            // list.map((e) => null)
            // list
            Column(
              children: list,
            )
          ],
        ),
      ),
    );
  }
}
