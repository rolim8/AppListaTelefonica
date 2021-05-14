import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'categoria_telefones_page.dart';

class CategoraTelefonesApi{
  static Future<List<CategoriaTelefones>> getCategoriaTelefones() async{
    List<CategoriaTelefones> telefones = <CategoriaTelefones>[];

    String telefonesJsonString = await rootBundle.loadString("resource/json/telefones.json");

  // retornar uma lista de maps
    List telefonesJson = json.decode(telefonesJsonString);
    telefones = telefonesJson.map((map) => CategoriaTelefones.fromJson(map)).toList();
    
    return telefones;
  }  
}