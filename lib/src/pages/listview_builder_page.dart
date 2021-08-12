import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  _ListviewBuilderPageState createState() => _ListviewBuilderPageState();
}

class _ListviewBuilderPageState extends State<ListaPage> {
  // nos sirve para controlar nuetro SCROLL
  ScrollController _scrollController = ScrollController();

  // creamos nuestra lista
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  // nuestra variable para saber si se esta cargando nuestra peticion
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agrega10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //print('pixel : ${_scrollController.position.pixels}');
        //print('maxscrollextend : ${_scrollController.position.maxScrollExtent}');
        //_agrega10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Listview Builder', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.next_plan_outlined),
            onPressed: () {
              Navigator.pushNamed(context, 'list2');
            },
          ),
        ],
      ),
      body: GlowingOverscrollIndicator(
          axisDirection: AxisDirection.down,
          color: Colors.purple,
          child: Stack(
            children: [_crearListas(), _crearLoading()],
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        tooltip: 'Back',
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  // Creamos nuestra ListView Builder
  Widget _crearListas() {
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int i) {
          final int image = _listaNumeros[i];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300?random=$image'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  Future obtenerPagina1() async {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agrega10();
    });

    return Future.delayed(duration);
  }

  // Creamos los items que mostraremos
  void _agrega10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);

      setState(() {});
    }
  }

  // nuestra metodo de tipo FUTURE
  Future fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    return Timer(duration, respuestaHTTP);
  }

  // obtenemos nuestra respuesta que dura 2 segundos y agregamos 10 imagenes mas.
  void respuestaHTTP() {
    _isLoading = false;

    // esto animacion nos sirve para que nos indique que hay mas imagenes
    _scrollController.animateTo(_scrollController.position.pixels + 250,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));

    _agrega10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
