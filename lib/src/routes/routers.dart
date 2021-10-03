import 'package:flutter/material.dart';
//
import 'package:componentes_app/src/pages/pages.dart';

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
    SliverPage.nameSliver: (_) => SliverPage(),
    'animated': (_) => AnimatedWidgetPage(),
  };
}
