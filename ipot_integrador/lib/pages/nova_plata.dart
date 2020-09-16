import 'package:flutter/material.dart';
import 'package:ipot_integrador/shared/pages/header.dart';

class NovaPlanta extends StatefulWidget {
  @override
  _NovaPlantaState createState() => _NovaPlantaState();
}

class _NovaPlantaState extends State<NovaPlanta> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: Header(),
      body: Container(
        child: Center(
          child: Text('Olá'),
        ),
      ),
    );
  }
}
