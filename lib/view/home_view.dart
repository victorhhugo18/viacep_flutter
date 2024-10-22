// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:masked_text_field/masked_text_field.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:viacep_flutter/controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // Instanciar o controller
  HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ViaCep'),
      ),
      body: Column(
        children: [
          Image(image: AssetImage('assets/image/cep.png'),
          width: 200,),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MaskedTextField(
              textFieldController: controller.entradaCep,
              escapeCharacter: 'x',
              mask: "xxxxx-xxx",
              maxLength: 9,
              keyboardType: TextInputType.number,
              onChange: (value) {},
              inputDecoration: new InputDecoration(
                  hintText: "12345-000",
                  counterText: "",
                  label: Text('Digite o CEP: ', style: TextStyle(fontWeight: FontWeight.bold),) ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () async {
            controller.resultado = await controller.buscarCep();
            setState(() {
              // print(controller.resultado);
              QuickAlert.show(
                context: context,
                title: 'Consulta de CEP:',
                confirmBtnText: 'Ok',
                cancelBtnText: 'Cancelar',
                borderRadius: 20.0,
                type: QuickAlertType.confirm,
                text: controller.resultado,
                confirmBtnColor: Color.fromARGB(255, 16, 139, 177),
                autoCloseDuration: const Duration(seconds: 20),
              );
            });
          }, child: Text('Buscar CEP'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 15, 156, 180),
            foregroundColor: Colors.white
          ),),
          SizedBox(height: 20),
          // Text(
          //     'Endereço: ${controller.resultado}',
          //     style: const TextStyle(fontSize: 22),
          //   )
        ],
      ),
    );
  }
}
