import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:proyecto_integrador/Entities/client.dart';

class ClientController {
  void AddClient(
    TextEditingController nameController,
    TextEditingController lastNameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController addressController,
    TextEditingController codeController,
  ) {
    _AddClientObject(
      Client(
        code: codeController.text,
        name: nameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phone: phoneController.text,
        address: addressController.text,
      ),
    );
  }

  void _AddClientObject(Client client) async {
    var clients = await Hive.openBox('clients');
    await clients.put(client.code, {
      'nombre': client.name,
      'apellido': client.lastName,
      'email': client.email,
      'telefono': client.phone,
      'direccion': client.address,
      'codigo': client.code,
    });
    print('Cliente agregado');
  }

  bool SearchClient(String code) {
    var clients = Hive.box('clients');
    var client = clients.get(code);
    if (client != null) {
      return true;
    } else {
      return false;
    }
  }

  Client GetClient(String code) {
    var clients = Hive.box('clients');
    var client = clients.get(code);
    if (client != null) {
      return Client(
        code: client['codigo'],
        name: client['nombre'],
        lastName: client['apellido'],
        email: client['email'],
        phone: client['telefono'],
        address: client['direccion'],
      );
    } else {
      return Client();
    }
  }

  void DeleteClient(String code) async {
    var clients = await Hive.openBox('clients');
    await clients.delete(code);
  }

  List<Client> ListClient() {
    // var box = Hive.openBox('clients');
    // box.
    var clients = Hive.box('clients');
    print('Length');
    print(clients.length);
    if (clients.isNotEmpty) {
      List<Client> list = [];
      for (var i = 0; i < clients.length; i++) {
        list.add(
          Client(
            code: clients.getAt(i)['codigo'],
            name: clients.getAt(i)['nombre'],
            lastName: clients.getAt(i)['apellido'],
            email: clients.getAt(i)['email'],
            phone: clients.getAt(i)['telefono'],
            address: clients.getAt(i)['direccion'],
          ),
        );
      }
      return list;
    }
    return [];
  }
}
