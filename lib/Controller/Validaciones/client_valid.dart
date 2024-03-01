import 'package:proyecto_integrador/Controller/Entities/client_controller.dart';

class ClientValid {
  void validClient(
    namecontroller,
    lastnamecontroller,
    // emailcontroller,
    phonecontroller,
    // addresscontroller,
    codecontroller,
  ) {
    if (namecontroller.text == '' ||
        lastnamecontroller.text == '' ||
        // emailcontroller.text == '' ||
        phonecontroller.text == '' ||
        // addresscontroller.text == '' ||
        codecontroller.text == '') {
      print('Faltan datos');
      return;
    } else {
      print('Datos completos');
      ClientController().AddClient(
        namecontroller,
        lastnamecontroller,
        // emailcontroller,
        phonecontroller,
        // addresscontroller,
        codecontroller,
      );
    }
  }
}
