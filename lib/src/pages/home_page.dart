import 'package:componentes_app/src/pages/settings.dart';
import 'package:flutter/material.dart';

import 'package:componentes_app/src/providers/menu_provider.dart';
import 'package:componentes_app/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Flutter Widget', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () =>
                Navigator.pushNamed(context, SettingsPage.settingsPage),
          ),
        ],
      ),
      body: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.yellow.shade400,
        child: _lista(),
      ),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          physics: BouncingScrollPhysics(),
          children: _listItems(snapshot.data!, context),
        );
      },
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.red),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          //final route = MaterialPageRoute(builder: (context) => AlertPage());
          //Navigator.push(context, route);
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
