import 'package:flutter/material.dart';

class User {
  String name;
  String emailId;
  String password;

  User({
    this.name,
    this.emailId,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        emailId = json['emailId'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'emailId': emailId,
        'password': password,
      };
}
