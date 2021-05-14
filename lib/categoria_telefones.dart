import 'package:flutter/material.dart';
import 'categoria_telefones_page.dart';
import 'categoria_telefones_api.dart';
import 'detalhe_categoria_telefones_page.dart';

class CategoriaTelefonesPage extends StatefulWidget {
  @override
  _CategoriaTelefonesPageState createState() => _CategoriaTelefonesPageState();
}

class _CategoriaTelefonesPageState extends State<CategoriaTelefonesPage> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Telefones CZ"),
      ),
      body: FutureBuilder(
        future: CategoraTelefonesApi.getCategoriaTelefones(),
        builder: (BuildContext context, AsyncSnapshot snapshot){          
          if(snapshot.hasData){
            return _buildListViewCategorias(snapshot.data);
          }          
          return _buildCircularProgressIndicator();   
        }
      )
    );
  }

  ListView _buildListViewCategorias(List<CategoriaTelefones> telefones) {
    return ListView.builder(
      itemCount: telefones.length,
      itemBuilder:(BuildContext context, int i) {     
        return ListTile(
          title: Text(
            telefones[i].categoria,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          onTap:(){
            String categoria = telefones[i].categoria;
            List<Telefones> fones = telefones[i].telefones;
            Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) =>
                    DetalheCategoriaTelefonesPage(categoria: categoria, telefones: fones)
              )
            ); 
          },  
        );
      }
    );
  }

  Container _buildCircularProgressIndicator() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: CircularProgressIndicator(),
          ),
          Divider(
            color: Colors.transparent,
            height: 40,
          ),
          Text("Carregando", style: TextStyle(fontSize: 25,),),
        ],
      ),
    );
  }
}