class Planta {
  String nome;
  String nomeCientifico;
  String quantiaAgua;
  String quantiaSol;
  int temperatura;
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'nomeCientifico': nomeCientifico,
      'quantiaAgua': quantiaAgua,
      'quantiaSol': quantiaSol,
      'temperatura': temperatura
    };
  }

  fromJson(Map<String, dynamic> map) {
    nome = map['nome'];
    nomeCientifico = map[nomeCientifico];
    quantiaAgua = map['quantiaAgua'];
    quantiaSol = map['quantiaSol'];
    temperatura = map['temperatura'];
  }
}
