import 'package:flutter/material.dart';
//
import 'package:componentes_app/src/pages/pages.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (_) => HomePage(),
    'alert': (_) => AlertPage(),
    AvatarPage.pageName: (_) => AvatarPage(),
    'card': (_) => CardPage(),
    'animatedContainer': (_) => AnimatedContainerPage(),
    'inputs': (_) => InputPage(),
    'slider': (_) => SliderPage(),
    'list': (_) => ListaPage(),
    'list2': (_) => ListPage2(),
    SettingsPage.settingsPage: (_) => SettingsPage(),
    CardSwiperPage.nameSwiper: (_) => CardSwiperPage(),
    SliverPage.nameSliver: (_) => SliverPage(),
    'animated': (_) => AnimatedWidgetPage(),
    'animatedSquare': (_) => SquareAnimatedPage(),
    'SlidesImage': (_) => SlidesImagePage(),
  };
}
