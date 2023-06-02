import 'package:flutter/material.dart';
import 'package:quiz_app/core/app_route.dart';
import 'package:quiz_app/themes/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splash,
      onGenerateRoute: AppRoute.onGenerateRoute,
      theme: awesomeQuizTheme(),
    );
  }
}
