import 'package:flutter/material.dart';
import 'categoria_telefones_page.dart';

class DetalheCategoriaTelefonesPage extends StatelessWidget {
  final String categoria;

  final List<Telefones> telefones;

  DetalheCategoriaTelefonesPage({this.categoria, this.telefones});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categoria: "+ this.categoria),
      ),
      body: ListView.builder(
        itemCount: telefones.length,
        itemBuilder:(BuildContext context, int i) {
          return ListTile(
            title: Text(
              telefones[i].nome,
              style: TextStyle( 
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              telefones[i].numero,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          );
        },           
      )
    );
  }
}
