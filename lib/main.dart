import 'package:flutter/material.dart';
import 'package:proyecto_integrador/Vistas/view_home.dart';
import 'package:proyecto_integrador/Vistas/view_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const ViewHome(),
      // routes: {
      //   '/home': (context) => const ViewHome(),
      //   '/storage': (context) => const ViewStorage(),
      //
    );
  }
}
