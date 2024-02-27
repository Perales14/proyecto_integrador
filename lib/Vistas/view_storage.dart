import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Controller/product_controller.dart';
import 'package:proyecto_integrador/Services/drawer.dart';
import 'package:proyecto_integrador/Vistas/list_product.dart';
import 'package:proyecto_integrador/Vistas/view_new_producct.dart';

class ViewStorage extends StatefulWidget {
  const ViewStorage({Key? id}) : super(key: id);
  @override
  ViewStorageState createState() => ViewStorageState();
}

class ViewStorageState extends State<ViewStorage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(headerText: 'Almacen'),
      appBar: AppBar(
        // actions: const <Widget>[],
        title: const Text('Almacen'),
      ),
      // bottomNavigationBar: ButtonBar(
      //   alignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     ElevatedButton(
      //       onPressed: () {
      //         print('Boton 1');
      //         print(ProductController().GetProduct('1'));
      //       },
      //       child: const Text('Boton 1'),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListProductWidget(
              products: ProductController().ListProduct(),
            ),
            // ListProductWidget(
            //   products: ProductController().ListProduct(),
            // ),
            // ViewProduct(
            //   product: Product(
            //     name: 'Producto 1',
            //     description: 'Descripcion',
            //     price: '51',
            //     category: 'Categoria',
            //     quantity: '30',
            //     code: '1213',
            //   ),
            //   onpresseddelete: () {
            //     print('Eliminar');
            //   },
            //   onpressededit: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => EditProduct(
            //           product: Product(
            //             name: 'Producto 1',
            //             description: 'Descripcion',
            //             price: '51',
            //             category: 'Categoria',
            //             quantity: '30',
            //             code: '1213',
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FloatingActionButton(
          onPressed: () {
            print('Si toco el boton agregar');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewNewProduct()),
            );
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
