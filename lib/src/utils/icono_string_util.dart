import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'tune': Icons.tune,
  'list': Icons.list,
  'swipe': Icons.swipe,
  'smart_toy': Icons.smart_toy,
  'widgets': Icons.widgets,
  'crop_square': Icons.crop_square,
  'view_carousel': Icons.view_carousel
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.red);
}
