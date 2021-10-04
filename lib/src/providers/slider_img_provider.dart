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
}
