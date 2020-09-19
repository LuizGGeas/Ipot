import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipot_integrador/shared/models/planta.dart';
import 'package:ipot_integrador/shared/pages/header.dart';
import 'package:ipot_integrador/shared/models/PreferenciasPlantaEnum.dart';

class NovaPlanta extends StatefulWidget {
  @override
  _NovaPlantaState createState() => _NovaPlantaState();
}

class _NovaPlantaState extends State<NovaPlanta> {
  var planta = Planta();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: Header(),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: 'Nome da planta'),
              onChanged: (value) => planta.nome = value,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Nome Científico'),
              onChanged: (value) => planta.nome = value,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Temperatura Ideal'),
              onChanged: (value) => planta.temperatura = int.parse(value),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
            Row(
              children: getListSunMeasure(planta),
            ),
            Row(
              children: getListWaterMeasure(planta),
            )
          ],
        ),
      ),
    );
  }

  List<Radio> getListWaterMeasure(Planta planta) {
    List<Radio> radioList;
    QuantiaAgua.values.forEach((element) {
      radioList.add(
        Radio(
            value: element,
            groupValue: planta.quantiaSol,
            onChanged: (value) => planta.quantiaSol = value),
      );
    });
    return radioList;
  }

  List<Radio> getListSunMeasure(Planta planta) {
    List<Radio> radioList;
    QuantiaSol.values.forEach((element) {
      radioList.add(
        Radio(
            value: element,
            groupValue: planta.quantiaSol,
            onChanged: (value) => planta.quantiaSol = value),
      );
    });
    return radioList;
  }
}
