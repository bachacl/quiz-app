import 'package:flutter/material.dart';
import 'package:quiz_app/themes/app_color.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  void onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBackButtonPressed();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('About'),
          backgroundColor:
              AppColor.primaryColor, // Replace with your desired app bar color
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz Game',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '© 2023 American Code Lab',
                style: TextStyle(
                  fontSize: 24,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Version 1.0',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
