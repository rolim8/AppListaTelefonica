class CategoriaTelefones {
  String categoria;
  List<Telefones> telefones;

  CategoriaTelefones({this.categoria, this.telefones});

  CategoriaTelefones.fromJson(Map<String, dynamic> json) {
    categoria = json['categoria'];
    if (json['telefones'] != null) {
      telefones = <Telefones>[];
      json['telefones'].forEach((v) {
        telefones.add(new Telefones.fromJson(v));
      });
    }
  }
}

class Telefones {
  String nome;
  String numero;

  Telefones({this.nome, this.numero});

  Telefones.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    numero = json['numero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['numero'] = this.numero;
    return data;
  }
  @override
  String toString() {
    return "$nome, $numero";
  }
}