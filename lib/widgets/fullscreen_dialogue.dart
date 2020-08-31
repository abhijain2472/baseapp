import 'package:flutter/material.dart';

class FullScreenDialogue extends StatefulWidget {
  final String title;

  FullScreenDialogue({this.title});

  @override
  FullScreenDialogueState createState() => new FullScreenDialogueState();
}

class FullScreenDialogueState extends State<FullScreenDialogue> {

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: new Scaffold(

        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: 28.0),
                padding: EdgeInsets.symmetric(vertical: 15.0),
                alignment: Alignment.center,
                color: Colors.blueGrey,
                child: Text(
                  'Full Screen Dialogue',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Expanded(
                child: Center(child: Text('Full Screen Dialogue content')),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                  height: 70.0,
                  margin: EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 30.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          color: Colors.lightGreen,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text('YES'),
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Colors.redAccent,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text('NO'),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
