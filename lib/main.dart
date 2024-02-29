import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proyecto_integrador/Views/ViewDrawer/view_storage.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('products');
  await Hive.openBox('clients');
  await Hive.openBox('categories');

  // await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //para que el widget sea constante
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ViewStorage(
          // username:
          //     'Luis'), //es necesario esto, debido a que en este momento el loggin todavia no lo he hecho,por lo que una vez lo termine, ya podre quitarlo y no tener q poner algun usuario y asi
          ),
    );
  }
}
