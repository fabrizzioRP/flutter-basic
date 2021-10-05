import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlidesImgProvider extends ChangeNotifier {
  double _index = 0;
  Color _primaryColor = Colors.pink;
  Color _secondColor = Colors.grey;

  double _primaryBullet = 12;
  double _secondBullet = 12;

  double get primaryBullet => this._primaryBullet;

  set primaryBullet(double value) {
    this._primaryBullet = value;
  }

  double get secondBullet => this._secondBullet;
  set secondBullet(double value) {
    this._secondBullet = value;
  }

  Color get primaryColor => this._primaryColor;

  set primaryColor(Color color) {
    this._primaryColor = color;
  }

  Color get secondColor => this._secondColor;

  set secondColor(Color color) {
    this._secondColor = color;
  }

  double get index => this._index;

  set index(double value) {
    this._index = value;
    notifyListeners();
  }

  // Provider para menu pinterest :
  int _itemSeleccionado = 0;
  bool _showMenu = true;
  Color _background = Colors.white;
  Color _activeColor = Colors.black;
  Color _inactiveColor = Colors.blueGrey;

  bool get showMenu => this._showMenu;

  set showMenu(bool show) {
    this._showMenu = show;
    notifyListeners();
  }

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int value) {
    this._itemSeleccionado = value;
    notifyListeners();
  }

  Color get background => this._background;

  set background(Color background) {
    this._background = background;
  }

  Color get activeColor => this._activeColor;

  set activeColor(Color activeColor) {
    this._activeColor = activeColor;
  }

  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color inactiveColor) {
    this._inactiveColor = inactiveColor;
  }
}
