import 'package:componentes_app/src/pages/alert_page.dart';
import 'package:componentes_app/src/pages/animated_container.dart';
import 'package:componentes_app/src/pages/avatar_page.dart';
import 'package:componentes_app/src/pages/card_page.dart';
import 'package:componentes_app/src/pages/card_swiper.dart';
import 'package:componentes_app/src/pages/home_page.dart';
import 'package:componentes_app/src/pages/input_page.dart';
import 'package:componentes_app/src/pages/listview_2.dart';
import 'package:componentes_app/src/pages/listview_builder_page.dart';
import 'package:componentes_app/src/pages/settings.dart';
import 'package:componentes_app/src/pages/slider_page.dart';
import 'package:componentes_app/src/pages/sliver_page.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    AvatarPage.pageName: (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
    'list': (BuildContext context) => ListaPage(),
    'list2': (BuildContext context) => ListPage2(),
    SettingsPage.settingsPage: (_) => SettingsPage(),
    CardSwiperPage.nameSwiper: (_) => CardSwiperPage(),
    SliverPage.nameSliver: (_) => SliverPage()
  };
}
