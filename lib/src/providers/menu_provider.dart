import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    //print(dataMap['rutas']);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = _MenuProvider();

class _MenuEjercicio {
  List<dynamic> opcion = [];

  _MenuEjercicio() {
    //hola
  }

  Future<List<dynamic>> cargarEjercicio() async {
    final respuesta =
        await rootBundle.loadString('data/ejercicio.json'); // lee el archivo
    Map dateMap =
        json.decode(respuesta); // la respuesta del json se inserta en el MAP
    opcion = dateMap[
        'rutas']; // La lista opcion vacia se llena con los datos del MAP
    return opcion;
  }
}

final menuEjercicio = new _MenuEjercicio();
