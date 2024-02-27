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
  // ListTile vis = const ListTile(
  //   title: Text('data'),
  // );

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
      //         setState(() {
      //           // vis = const ListTile(
      //           //   title: Text('dato'),
      //           // );
      //         });
      //         print('Boton1');
      //         // print(ProductController().GetProduct('1'));
      //       },
      //       child: const Text('Boton1'),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListProductWidget(
              setstate: () {
                setState(() {});
              },
              products: ProductController().ListProduct(),
            ),
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
            ).then(
              (value) => {
                setState(
                  () {},
                ),
              },
            );
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
