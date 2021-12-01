import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final colorTexto = TextStyle(color: Colors.black);
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp', style: colorTexto),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.amberAccent,
        child: ListView(
          //children: _crearItems()
          children: _crearItemsCorta(),
        ),
      ), //Para mi ClampingScrollPhysics
    );
  }

  // First mode do : ListView
  // List<Widget> _crearItems() {
  //   List<Widget> lista = [];

  //   for (String opt in opciones) {
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );

  //     lista
  //       ..add(tempWidget)
  //       ..add(Divider(
  //           color: Colors.amberAccent,
  //           height: 15.0,
  //           endIndent: 10.0,
  //           indent: 10.0,
  //           thickness: 1.5));
  //   }

  //   return lista;
  // }

  // second mode do : ListView

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + ' !!'),
            subtitle: Text('No sé que poner !!'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
            onLongPress: () {},
          ),
          Divider(
              color: Colors.amberAccent,
              height: 15.0,
              endIndent: 10.0,
              indent: 10.0,
              thickness: 1.5)
        ],
      );
    }).toList();
  }
}
