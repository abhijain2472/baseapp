import 'package:baseapp/screens/authentication_screen.dart';
import 'package:baseapp/services/auth_service.dart';
import 'package:baseapp/services/network_service.dart';
import 'package:baseapp/utils/dialogues.dart';
import 'package:baseapp/utils/shared_pref.dart';
import 'package:baseapp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const ROUTE_NAME = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String fsDialogueResult = 'not chosen yet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                size: 100.0,
                color: Colors.grey,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Full Screen Dialogue Result : $fsDialogueResult',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () async {
                  bool result = await showFullScreenDialogue(
                    context: context,
                    title: 'New Full Screen Dialogue',
                  );
                  if (result) {
                    fsDialogueResult = 'YES';
                  } else {
                    fsDialogueResult = 'NO';
                  }
                  setState(() {});
                },
                child: Text('Show Full Screen Dialogue'),
                color: Colors.lightBlue,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
