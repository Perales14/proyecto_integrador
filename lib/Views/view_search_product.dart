import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/Entities/product_controller.dart';
import 'package:proyecto_integrador/Entities/product.dart';
import 'package:proyecto_integrador/Controller/Entities/search_controller.dart';
import 'package:proyecto_integrador/Views/ViewSingle/view_prod.dart';

class ViewSearchProduct extends StatefulWidget {
  final Function() onProductSelected;
  const ViewSearchProduct({super.key, required this.onProductSelected});

  @override
  State<ViewSearchProduct> createState() => _ViewSearchProductState();
}

class _ViewSearchProductState extends State<ViewSearchProduct> {
  TextEditingController codeController = TextEditingController(text: '');
  List<Widget> products = [];
  ProductController Pr = ProductController();
  @override
  void initState() {
    super.initState();
    products = SearchControll(
      contex: context,
      search: '',
      products: Pr.ListProduct(),
    ).searchProduct();
  }

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 164, 189, 202),
                  ),
                ),
                controller: codeController,
                onChanged: (value) {
                  // products =  SearchControll(search: '', products: [],).searchProduct();
                  // products = SearchControll(
                  //   search: codeController.text,
                  //   products: ProductController().ListProduct(),
                  // ).searchProduct();

                  setState(() {
                    products = SearchControll(
                            contex: context,
                            search: codeController.text,
                            products: Pr.ListProduct())
                        .searchProduct();
                  });
                  // print('');
                  // print('products.length:   ');
                  // print(products.length);
                  // print(products.toString());
                },
              ),
            ),
            products.isEmpty
                ? const Text('No hay productos')
                : Column(
                    children: products,
                  ),
            // products.isEmpty
            //     ? const Text('No hay productos')
            //     : Expanded(
            //         // child: Text('Productos'),
            //         child: ListView.builder(
            //           itemCount: products.length,
            //           itemBuilder: (context, index) {
            //             return ListTile(
            //               title: Text(
            //                 (products[index] as ViewProd).product.name,
            //               ),
            //               subtitle: Text(
            //                 (products[index] as ViewProd).product.description,
            //               ),
            //               leading: CircleAvatar(
            //                 child: Text(
            //                   (products[index] as ViewProd).product.name[0],
            //                 ),
            //               ),
            //               onTap: () {
            //                 widget.onProductSelected();
            //               },
            //             );
            //           },
            //         ),
            //       ),
          ],
        ),
      ),
    );
  }
}
