import 'package:flutter/material.dart';

import 'screen_builder.dart';

class RouteNames {
  static const String home = '/home';
  static const String article = '/article';
}

class MainNavigation {
  static final _screenBuilder = ScreenBuilder();

  final routes = <String, Widget Function(BuildContext ctx)>{
    RouteNames.home: (ctx) => _screenBuilder.buildHomeScreen(),
    RouteNames.article: (ctx) => _screenBuilder.buildArticleScreen(),
  };
}
