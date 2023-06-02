import 'package:flutter/material.dart';
import 'package:quiz_app/screens/about_screen.dart';
import 'package:quiz_app/screens/game_screen.dart';
import 'package:quiz_app/screens/menu_screen.dart';
import 'package:quiz_app/screens/options_screen.dart';
import 'package:quiz_app/screens/splash_screen.dart';

class AppRoute {
  static const String splash = '/splash';
  static const String menu = '/menu';
  static const String game = '/game';
  static const String options = '/options';
  static const String about = '/about';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case menu:
        return MaterialPageRoute(builder: (context) => MenuScreen());
      case game:
        return MaterialPageRoute(builder: (context) => GameScreen());
      case options:
        return MaterialPageRoute(builder: (context) => OptionsScreen());
      case about:
        return MaterialPageRoute(builder: (context) => AboutScreen());
      default:
        return MaterialPageRoute(builder: (context) => MenuScreen());
    }
  }
}
