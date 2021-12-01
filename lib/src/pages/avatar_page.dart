import 'package:flutter/material.dart';

import 'package:componentes_app/src/providers/menu_provider.dart';
import 'package:componentes_app/src/utils/icono_string_util.dart';

class AvatarPage extends StatelessWidget {
  // nombre de la ruta para usarlo
  static final pageName = 'avatar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(3.0), // separacion
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1326212145307136000/CPBmiyJ1_400x400.jpg'),
              radius: 25.0, // tamaño del avatar o circulo
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundColor: Colors.amber[700],
              child: Text('ML'),
            ),
          )
        ],
      ),
      body: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Colors.amberAccent,
          child: _listaNew()),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        tooltip: 'Back',
        backgroundColor: Colors.amberAccent,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _listaNew() {
    return FutureBuilder(
        future: menuEjercicio.cargarEjercicio(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _items(snapshot.data!, context),
          );
        });
  }

  List<Widget> _items(List<dynamic> data, BuildContext context) {
    final List<Widget> opcion = [];

    final Widget _photo = Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://i.ebayimg.com/thumbs/images/g/UAIAAOSwjUxgotIe/s-l300.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 150,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );

    final Widget _decorationPhoto = Container(
        margin: EdgeInsets.all(35.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60.0),
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 10.0,
                  offset: Offset(2.0, 10.0))
            ]),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(60.0), child: _photo));

    opcion.add(_decorationPhoto);

    data.forEach((o) {
      final newWidget = ListTile(
        title: Text(o['name']),
        subtitle: Text(o['profesion']),
        leading: getIcon(o['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {},
      );

      opcion..add(newWidget)..add(Divider());
    });

    return opcion;
  }
}
