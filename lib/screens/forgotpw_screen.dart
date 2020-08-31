import 'package:baseapp/services/network_service.dart';
import 'package:baseapp/utils/constants.dart';
import 'package:baseapp/utils/dialogues.dart';
import 'package:baseapp/utils/validation.dart';
import 'package:baseapp/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const ROUTE_NAME ='forgot-password';

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    if (_formKey.currentState.validate()) {
      if (await NetworkService.checkDataConnectivity()) {
        FocusScope.of(context).unfocus();

        }else {
        await showSimpleDialogue(
          context: context,
          message: 'Please check your internet connection...',
          showTwoActions: false,
        );
      }
      }
    }

    @override
  void dispose() {
    _emailController.clear();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                        'Forgot Password',
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
                        controller: _emailController,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter email',
                          hintStyle: TextStyle(
                            fontSize: 14.0,
                          ),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: kDarkBlueColor,
                            size: 20.0,
                          ),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: kTextFieldColor,
                        ),
                        textInputAction: TextInputAction.next,
                        validator: (email) {
                          return validateEmail(email);
                        },

                      ),

                      SizedBox(
                        height: 20.0,
                      ),
                      buildPrimaryButton(
                        title: 'Verify',
                        onPress: ()=>submit(),
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
