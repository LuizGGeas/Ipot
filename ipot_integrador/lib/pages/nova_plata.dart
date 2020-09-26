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
  void initState() {
    super.initState();
    planta.quantiaAgua = null;
    planta.quantiaSol = null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: Header(),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Nome da planta',
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.greenAccent[400], width: 2.0),
                ),
              ),
              onChanged: (value) => planta.nome = value,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Nome Científico',
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.greenAccent[400], width: 2.0),
                ),
              ),
              onChanged: (value) => planta.nome = value,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Temperatura Ideal',
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.greenAccent[400], width: 2.0),
                ),
              ),
              onChanged: (value) => planta.temperatura = int.parse(value),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
            getRadioTileListOfMeasure(
                getListWaterMeasure(), planta.quantiaAgua),
            getRadioTileListOfMeasure(getListSunMeasure(), planta.quantiaSol)
          ],
        ),
      ),
    );
  }

  Widget getRadioTileListOfMeasure<T>(
      List<dynamic> measureList, String groupValue) {
    List<Widget> list = [];
    for (dynamic element in measureList) {
      list.add(
        new Flexible(child: getListTile(element, groupValue)),
      );
    }

    return new Row(
      children: list,
    );
  }

  Widget getListTile(element, groupValue) {
    return new RadioListTile(
      value: element,
      title: Text(element),
      groupValue: groupValue,
      onChanged: (value) {
        setStateWaterMeasureValue(value, groupValue);

        groupValue = value;

        print(groupValue + " / " + value);
      },
      selected: groupValue == element,
      activeColor: Colors.green,
    );
  }

  List<dynamic> getListWaterMeasure() {
    return QuantiaAgua.values.map((value) => getPropertyName(value)).toList();
  }

  List<dynamic> getListSunMeasure() {
    return QuantiaSol.values.map((value) => getPropertyName(value)).toList();
  }

  getWaterEnumOfString(String enumName) {
    return QuantiaAgua.values;
  }

  String getPropertyName(Object enumerator) {
    return enumerator.toString().split(".").last;
  }

  setStateWaterMeasureValue<T>(value, groupValue) {
    print("$value foi selecionado");

    setState(() {
      groupValue = value;
    });
  }
}
