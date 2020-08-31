import 'dart:io';

import 'package:baseapp/widgets/icon_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  static const ROUTE_NAME = 'profile';

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController mobileController;
  File _imageFile;

  String name='Abhishek Jain';
  String email = 'abhi@gmail.com';
  String mobile ='1234567891';

  Future<void> _takePicture(ImageSource type) async {
    // ignore: deprecated_member_use
    final image = await ImagePicker.pickImage(
      source: type,
    );
    if (image != null) {
      final croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path,

      );
      if (croppedImage != null) {
        print("Picked image path ${croppedImage.path}");
        setState(() {
          _imageFile = croppedImage;
        });
      }
    }
  }

  void showImagePickerOption(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: 80,
              margin: EdgeInsets.all(25),
              child: Row(
                children: [
                  IconAvatar(
                    color: Colors.lightBlue,
                    icon: Icons.camera_alt,
                    name: 'Camera',
                    onPress: () {
                      Navigator.of(context).pop();
                      _takePicture(ImageSource.camera);
                    },
                  ),
                  IconAvatar(
                    color: Colors.teal,
                    icon: Icons.image,
                    name: 'Gallery',
                    onPress: () {
                      Navigator.of(context).pop();

                      _takePicture(ImageSource.gallery);
                    },
                  ),
                  IconAvatar(
                    color: Colors.redAccent,
                    icon: Icons.clear,
                    name: 'Clear',
                    onPress: () {
                      setState(() {
                        _imageFile = null;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }


  @override
  void initState() {
    nameController=TextEditingController(text: name);
    emailController=TextEditingController(text: email);
    mobileController=TextEditingController(text: mobile);
    super.initState();
  }

  void resetTextFields(){
    nameController.text=name;
    emailController.text=email;
    mobileController.text=mobile;
  }
  void setTextVariable(){
    name=nameController.text;
    email=emailController.text;
    mobile=mobileController.text;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: new Container(
        color: Colors.white,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Container(
                  color: Colors.white,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        child: Stack(
                          fit: StackFit.loose,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Hero(
                                  tag: 'image',
                                  child: new Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: new DecorationImage(
                                        image: _imageFile==null?ExactAssetImage(
                                          'assets/images/as.png',
                                        ):FileImage(_imageFile),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 90.0, left: 100.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                   onTap: ()=>showImagePickerOption(context) ,
                                    child: new CircleAvatar(
                                      backgroundColor: Colors.red,
                                      radius: 20.0,
                                      child: new Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                new Container(
                  // color: Colors.grey.withOpacity(0.5),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                  ),
                  color: Color(0xffFFFFFF),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Text(
                              'Parsonal Information',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            _status ? _getEditIcon() : new Container()
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 25.0,
                        ),
                        child: new Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 2.0,
                        ),
                        child: new TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            hintText: "Enter Your Name",
                          ),
                          enabled: !_status,
                          autofocus: !_status,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          top: 25.0,
                        ),
                        child: new Text(
                          'Email ID',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.0,
                        ),
                        child: new TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: "Enter Email ID",
                          ),
                          enabled: !_status,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 25.0,
                        ),
                        child: new Text(
                          'Mobile',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.0,
                        ),
                        child: new TextField(
                          controller: mobileController,
                          decoration: const InputDecoration(
                            hintText: "Enter Mobile Number",
                          ),
                          enabled: !_status,
                        ),
                      ),
                      !_status ? _getActionButtons() : new Container(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.clear();
    emailController.clear();
    mobileController.clear();
    myFocusNode.dispose();
    _imageFile=null;
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(
        left: 25.0,
        right: 25.0,
        top: 45.0,
      ),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                child: new RaisedButton(
                  child: new Text("Save"),
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    setState(() {
                      _status = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                      setTextVariable();
                    });
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                ),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                child: new RaisedButton(
                  child: new Text("Cancel"),
                  textColor: Colors.white,
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      _status = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                      resetTextFields();
                    });
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                ),
              ),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
