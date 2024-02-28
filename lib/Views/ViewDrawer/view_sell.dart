import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Services/drawer.dart';

class ViewSell extends StatefulWidget {
  const ViewSell({super.key});

  @override
  State<ViewSell> createState() => _ViewSellState();
}

class _ViewSellState extends State<ViewSell> {
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(
        headerText: 'Vender',
      ),
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        actions: [
          // const ButtonActivateIntent(),

          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Ingrese texto'),
                    content: const TextField(),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );

              //que despliegue algo como un textField para buscar
              // Navigator.of(context).
            },
          ),
        ],
        title: const Text('Vender'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: TextField(
            //     controller: codeController,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Código de barras',
            //     ),
            //   ),
            // ),
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
                //al presionar enter se pase al sig campo
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
          ],
        ),
      ),
    );
  }
}
