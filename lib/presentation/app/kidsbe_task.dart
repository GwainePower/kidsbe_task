import 'package:flutter/material.dart';

import '../../constants/strings.dart';

import '../navigation/main_navigation.dart';

class KidsbeTask extends StatelessWidget {
  const KidsbeTask({Key? key}) : super(key: key);

  static final _mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kidsbe Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: Strings.merriweatherFont,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: Strings.merriweatherFont,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      initialRoute: RouteNames.home,
      routes: _mainNavigation.routes,
    );
  }
}
