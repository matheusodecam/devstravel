import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AppData with ChangeNotifier {
  var data = [];

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  /*VAI PEGAR OS DADOS DO WEBSERVICE E RECEBER UMA RESPOSTA E 
  AUTOMATICAMENTE VAI SETAR DENTRO DO DATA PRA SABER SE DEU CERTO OU NÃO
  A REQUISICAO*/

  Future<bool> requestData() async {
    String url = 'https://api.b7web.com.br/flutter1wb/';
    final res = await http.get(Uri.parse(url));
    
    if (res.statusCode == 200){
      setData( jsonDecode(res.body) );
      return true;
    }else{
      return false;
    }
  }

}