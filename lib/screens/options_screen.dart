import 'package:flutter/material.dart';
import 'package:quiz_app/themes/app_color.dart';

class OptionsScreen extends StatefulWidget {
  const OptionsScreen({super.key});

  @override
  State<OptionsScreen> createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  void onNotificationSettingChanged(bool? value) {}

  void onDarkModeSettingChanged(bool? value) {}

  void onBackButtonPressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        onBackButtonPressed();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Options'),
          backgroundColor:
              AppColor.primaryColor, // Replace with your desired app bar color
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              CheckboxSetting(
                label: 'Enable notifications',
                isChecked: true,
                onCheckedChange: onNotificationSettingChanged,
              ),
              CheckboxSetting(
                label: 'Dark mode',
                isChecked: false,
                onCheckedChange: onDarkModeSettingChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckboxSetting extends StatelessWidget {
  final String label;
  final bool isChecked;
  final Function(bool?) onCheckedChange;

  const CheckboxSetting({
    Key? key,
    required this.label,
    required this.isChecked,
    required this.onCheckedChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColor.primaryColor,
          value: isChecked,
          onChanged: onCheckedChange,
        ),
        Text(label),
      ],
    );
  }
}
