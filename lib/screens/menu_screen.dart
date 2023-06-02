import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz_app/core/api_client.dart';
import 'package:quiz_app/core/app_route.dart';
import 'package:quiz_app/themes/app_color.dart';

class MenuScreen extends StatefulWidget {
  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ApiClient apiClient = ApiClient.getInstance();
  bool loading = false;

  Future<void> onPlayGamePressed() async {
    try {
      setState(() {
        loading = true;
      });
      await apiClient.getRemoteQuestions();
      Navigator.of(context).pushNamed(AppRoute.game);
    } catch (error) {
      print(error);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void onOptionsPressed() {
    Navigator.of(context).pushNamed(AppRoute.options);
  }

  void onAboutPressed() {
    Navigator.of(context).pushNamed(AppRoute.about);
  }

  void onExitPressed() {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onExitPressed();
        return false;
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
            body: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: onPlayGamePressed,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      primary: AppColor
                          .primaryColor, // Replace with your primary color
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      alignment: Alignment.center,
                      child: Text(
                        'PLAY GAME',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: onOptionsPressed,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      primary: AppColor
                          .primaryColor, // Replace with your primary color
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      alignment: Alignment.center,
                      child: Text(
                        'OPTIONS',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: onAboutPressed,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      primary: AppColor
                          .primaryColor, // Replace with your primary color
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      alignment: Alignment.center,
                      child: Text(
                        'ABOUT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: onExitPressed,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      primary: AppColor
                          .primaryColor, // Replace with your primary color
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      alignment: Alignment.center,
                      child: Text(
                        'EXIT',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: loading,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black12,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
