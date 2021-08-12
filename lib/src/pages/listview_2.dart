import 'dart:async';

import 'package:flutter/material.dart';

class ListPage2 extends StatefulWidget {
  const ListPage2({Key? key}) : super(key: key);

  @override
  _ListPage2State createState() => _ListPage2State();
}

class _ListPage2State extends State<ListPage2> {
  ScrollController _scrollController = new ScrollController();

  List<int> _list = [];
  int _endItem = 0;

  @override
  void initState() {
    super.initState();
    _agregar10();
    _obtenerPageNew();
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
        title:
            Text('ListView Builder 2', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: Colors.green,
        child: Stack(
          children: [_crearList()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.logout),
          tooltip: 'Back',
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  Widget _crearList() {
    return RefreshIndicator(
      onRefresh: _obtenerPageNew,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int i) {
          final int cont = _list[i];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300?random=$cont'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _endItem++;
      _list.add(_endItem);

      setState(() {});
    }
  }

  Future _obtenerPageNew() async {
    final duration = Duration(seconds: 2);
    Timer(duration, () {
      _list.clear();
      _endItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }
}
