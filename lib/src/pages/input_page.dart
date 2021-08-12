import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcSelect = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super Fuerza'];
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  // Crear el primer input
  Widget _crearInput() {
    return TextField(
      //autofocus: true, Para que automaticamente habrá el teclado
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
        counter: Text('Letras : ${_nombre.length}'),
        hintText: 'Nombre de la Persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  // metodo que retorna la cantidad de caracteres del String
  //String _backLenght() {
  //  final int _caracteres;
  //  if (_nombre == null) {
  //    _caracteres = 0;
  //  } else {
  //   _caracteres = _nombre!.length;
  //  }
  //  String convert = _caracteres.toString();
  //  return convert;
  //}

  // Crea el field Email
  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          hintText: 'Ingrese Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
        ),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  // Crea el field Password
  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock),
        ),
        onChanged: (valor) => setState(() {
              _password = valor;
            }));
  }

  // Crea el Field Fecha
  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection:
          false, // para no nos muestre la opcion copiar texto
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  // funcion para la Fecha
  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2021),
        lastDate: new DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        final _formatDate = DateFormat('dd/MM/yyyy');
        _fecha = _formatDate.format(picked);
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  // metodo que retorna una lista de tipo DropdownMenuItem de tipo String.
  List<DropdownMenuItem<String>> getOpcionesDropDown() {
    List<DropdownMenuItem<String>> lista = [];

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  // creacion del DropDown
  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        DropdownButton(
          value: _opcSelect,
          items: getOpcionesDropDown(),
          onChanged: (opt) {
            setState(() {
              _opcSelect = opt.toString();
            });
          },
        )
      ],
    );
  }

  // metodo que nos muestra el VALOR que se le asigna al INPUT
  Widget _crearPersona() {
    if (_nombre == ' ') {
      _nombre = ' ';
    } else {
      _nombre = _nombre;
    }

    return ListTile(
      title: Text('El nombre es : $_nombre'),
      subtitle: Text('El email es : $_email'),
      trailing: Text(_opcSelect),
    );
  }
}
