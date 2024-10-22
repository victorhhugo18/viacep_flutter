import 'package:flutter/material.dart';
import 'package:viacep_flutter/model/endereco_model.dart';

class HomeController {
  TextEditingController entradaCep = TextEditingController();
  String resultado = "";

  Future<String> buscarCep() async {
    // Instanciar o objeto
    EnderecoModel endereco = EnderecoModel();
    endereco = await EnderecoModel.buscarCep(entradaCep.text);
    return 'CEP: ${endereco.cep}\n RUA: ${endereco.logradouro}\n BAIRRO: ${endereco.bairro}\n CIDADE: ${endereco.localidade}\n ESTADO: ${endereco.uf}';
  }
}