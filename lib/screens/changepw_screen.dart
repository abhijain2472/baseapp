import 'package:baseapp/services/network_service.dart';
import 'package:baseapp/utils/constants.dart';
import 'package:baseapp/utils/dialogues.dart';
import 'package:baseapp/utils/validation.dart';
import 'package:baseapp/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ChangePasswordScreen extends StatefulWidget {
  static const ROUTE_NAME = 'change-password';

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();

  FocusNode _rePasswordFocusNode = FocusNode();
  FocusNode _newPasswordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _secureOldPassword=true;
  bool _secureNewPassword = true;
  bool _secureRePassword = true;
  void _submit()async{
    if(_formKey.currentState.validate()){

      if(await NetworkService.checkDataConnectivity()){
        FocusScope.of(context).unfocus();
        print('change password successfull');
      }else{
        await showSimpleDialogue(
          context: context,
          message: 'Please check your internet connection...',
          showTwoActions: false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: width * 0.5,
                      ),
                      SizedBox(height: 70.0),
                      Text(
                        'Change Password',
                        textAlign: TextAlign.center,
                        style: kTitleTextStyle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Please enter your credentials',
                        textAlign: TextAlign.center,
                        style: kSubTitleTextStyle,
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(

                        controller: _oldPasswordController,
                        obscureText: _secureOldPassword,
                        textInputAction: TextInputAction.next,

                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: 'Enter old password',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: kDarkBlueColor,
                            size: 20.0,
                          ),
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            icon: FaIcon(
                              _secureOldPassword
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 16,
                              color: kDarkBlueColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _secureOldPassword = !_secureOldPassword;
                              });
                            },
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: kTextFieldColor,
                        ),
                        validator: (password) {
                          return validatePassword(password);
                        },
                        onFieldSubmitted: (value) {
                          if (value.isNotEmpty) {
                            FocusScope.of(context)
                                .requestFocus(_newPasswordFocusNode);
                          }
                        },

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        focusNode: _newPasswordFocusNode,
                        controller: _newPasswordController,
                        obscureText: _secureNewPassword,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: 'Enter new password',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_open,
                            color: kDarkBlueColor,
                            size: 20.0,
                          ),
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            icon: FaIcon(
                              _secureNewPassword
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 16,
                              color: kDarkBlueColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _secureNewPassword = !_secureNewPassword;
                              });
                            },
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: kTextFieldColor,
                        ),
                        validator: (password) {
                          return validatePassword(password);
                        },
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) {
                          if (value.isNotEmpty) {
                            FocusScope.of(context)
                                .requestFocus(_rePasswordFocusNode);
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        focusNode: _rePasswordFocusNode,
                        controller: _rePasswordController,
                        obscureText: _secureRePassword,
                        textAlignVertical: TextAlignVertical.center,
                        textInputAction: TextInputAction.done,

                        decoration: InputDecoration(
                          hintText: 'Re-enter new password',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          prefixIcon: Icon(
                            Icons.lock_open,
                            color: kDarkBlueColor,
                            size: 20.0,
                          ),
                          suffixIcon: IconButton(
                            splashColor: Colors.transparent,
                            icon: FaIcon(
                              _secureRePassword
                                  ? FontAwesomeIcons.eye
                                  : FontAwesomeIcons.eyeSlash,
                              size: 16,
                              color: kDarkBlueColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _secureRePassword = !_secureRePassword;
                              });
                            },
                          ),
                          errorMaxLines: 2,
                          border: InputBorder.none,
                          filled: true,
                          fillColor: kTextFieldColor,
                        ),
                        validator: (rePassword) {
                          return validateRePassword(_newPasswordController.text, _rePasswordController.text);
                        },
                        onEditingComplete: () => {},
                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      buildPrimaryButton(
                        title: 'Change Password',
                        onPress: () {
                          _submit();
                        },
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
