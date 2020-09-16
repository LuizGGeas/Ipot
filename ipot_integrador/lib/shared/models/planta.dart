class Planta {
  String nome;
  String ambiente;

  Map<String, dynamic> toJson() {
    return {'nome': nome, 'ambiente': ambiente};
  }
}
