import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final colorText = TextStyle(color: Colors.black);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Page', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.amberAccent,
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            _cardTipo1(context),
            SizedBox(height: 30.0),
            _cardTipo2(),
            SizedBox(height: 30.0),
            _cardTipo1(context),
            SizedBox(height: 30.0),
            _cardTipo3()
          ],
        ),
      ),
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

  Widget _cardTipo1(BuildContext context) {
    return Card(
      elevation: 3.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(children: [
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('My first card'),
          subtitle: Text(
              'en esta tarjeta vamos a escribir mucho texto con el fin de ver como se ve las letra en el card'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text('Cancelar', style: colorText),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Ok', style: colorText),
              onPressed: () {},
            ),
          ],
        ),
      ]),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://image.winudf.com/v2/image/Y29tLmh1YWRvbmcuZmVuZ2ppbmcxX3NjcmVlbnNob3RzXzFfYWUwOTcwNTE/screen-1.jpg?fakeurl=1&type=.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          //Image(
          //  image: NetworkImage(
          //      'https://image.winudf.com/v2/image/Y29tLmh1YWRvbmcuZmVuZ2ppbmcxX3NjcmVlbnNob3RzXzFfYWUwOTcwNTE/screen-1.jpg?fakeurl=1&type=.jpg'),
          //),
          Container(
              padding: EdgeInsets.all(20.0),
              child: Text('No tengo idea que poner')),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        // decoracion a mi tarjeta(container)
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0, // nivel de sombra fuerte o bajo
            spreadRadius: 10.0, //sombra a los bordes
            offset: Offset(2.0, 10.0), // posicion de la sombra
          )
        ],
      ),
      child: ClipRRect(
        // ajustar el contenido dentro de mi card para que no sobresalga
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }

  Widget _cardTipo3() {
    final card1 = Container(
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://i0.wp.com/www.lenda.net/wp-content/uploads/2018/09/travel-landscape-01.jpg?ssl=1'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Landscape'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 10.0,
                offset: Offset(2.0, 10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card1,
      ),
    );
  }
}
