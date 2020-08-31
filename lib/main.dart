import 'package:baseapp/screens/authentication_screen.dart';
import 'package:baseapp/screens/changepw_screen.dart';
import 'package:baseapp/screens/contactus_screen.dart';
import 'package:baseapp/screens/forgotpw_screen.dart';
import 'package:baseapp/screens/home_screen.dart';
import 'package:baseapp/screens/login_screen.dart';
import 'package:baseapp/screens/profile_screen.dart';
import 'package:baseapp/screens/setting_screen.dart';
import 'package:baseapp/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        brightness: Brightness.light
      ),
      initialRoute: AuthenticationScreen.ROUTE_NAME,
      routes: {
        AuthenticationScreen.ROUTE_NAME: (ctx) => AuthenticationScreen(),
        LoginScreen.ROUTE_NAME: (ctx) => LoginScreen(),
        SignUpScreen.ROUTE_NAME: (ctx) => SignUpScreen(),
        ForgotPasswordScreen.ROUTE_NAME: (ctx) => ForgotPasswordScreen(),
        HomeScreen.ROUTE_NAME: (ctx) => HomeScreen(),
        ChangePasswordScreen.ROUTE_NAME: (ctx) => ChangePasswordScreen(),
        SettingScreen.ROUTE_NAME: (ctx) => SettingScreen(),
        ContactUsScreen.ROUTE_NAME: (ctx) => ContactUsScreen(),
        ProfileScreen.ROUTE_NAME:(ctx) => ProfileScreen(),



      },
    );
  }
}
