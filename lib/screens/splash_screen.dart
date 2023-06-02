import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_app/core/app_route.dart';
import 'package:quiz_app/themes/app_color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(AppRoute.menu);
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: AppColor.primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Text(
              'Quiz Game',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
            Text(
              'Let\'s go',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
