import 'dart:core';
import 'package:flutter_localstorage/flutter_localstorage.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
LocalStorage localStorage = new LocalStorage();

void main() {
  print("Abey bc email me hai ye dekel");
//  print(localStorage.getItem("email"));
  String temp = localStorage.getItem("email");
  print(temp);
  if(localStorage.getItem("email")==null){
    runApp(new MaterialApp(
      title: 'Login Page',
      home: new LoginPage(),
    ));
  }
  else{
    runApp(new MaterialApp(
      title: 'Home page',
      home: new Home(),
    ));
  }

}


