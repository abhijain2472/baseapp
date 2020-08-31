import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  static const ROUTE_NAME = 'contact-us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),

        title: Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Icon(
            Icons.contact_phone,
            size: 150.0,
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}
