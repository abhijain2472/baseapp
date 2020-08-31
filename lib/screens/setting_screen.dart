import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  static const ROUTE_NAME = 'settings';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Icon(
            Icons.settings_applications,
            size: 150.0,
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
