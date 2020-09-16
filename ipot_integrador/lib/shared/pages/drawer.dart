import 'package:flutter/material.dart';
import 'package:ipot_integrador/pages/nova_plata.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          PlantaLogo(),
          new ListTile(
            title: Text('Nova Planta'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NovaPlanta()));
            },
          ),
        ],
      ),
    );
  }
}

class PlantaLogo extends StatefulWidget {
  @override
  _PlantaLogoState createState() => _PlantaLogoState();
}

class _PlantaLogoState extends State<PlantaLogo> {
  @override
  Widget build(BuildContext context) {
    return new UserAccountsDrawerHeader(
      accountName: new Text('Bem vindo'),
      accountEmail: new Text(''),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: new NetworkImage(
            'https://investinplants.com/wp-content/uploads/2019/10/Lesser-celandine-e1571925441809.jpg'),
      ),
    );
  }
}
