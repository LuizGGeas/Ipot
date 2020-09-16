import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ipot_integrador/shared/models/planta.dart';

class DatabaseConnection {
  final dataBase = Firestore.instance;

  void novaPlanta(Planta planta) async {
    await dataBase
        .collection('plantas')
        .document(planta.nome)
        .setData(planta.toJson());
  }

  void editPlanta(Planta planta) async {
    await dataBase
        .collection('plantas')
        .document(planta.nome)
        .setData(planta.toJson());
  }

  void dropPlanta(Planta planta) async {
    await dataBase.collection('plantas').document(planta.nome).delete();
  }

  Future<QuerySnapshot> getAllPlantas() async {
    return await dataBase.collection('plantas').getDocuments();
  }
}
