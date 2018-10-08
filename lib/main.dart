import 'dart:core';
import 'dart:async';
import 'dart:io';
import 'package:flutter_localstorage/flutter_localstorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';

import 'login_page.dart';
import 'home_page.dart';
import 'email_store.dart';

LocalStorage localStorage = new LocalStorage();

void main() {
  EmailStorage myStorage = new EmailStorage();

  String email = null;
  myStorage.readEmail().then((String value) {
    print("Value inside is");
    email = value;
    print(value);
  });


  if(email==null){
    print("Sall jab ye null hai");
    runApp(new MaterialApp(
      title: 'Login Page',
      home: new LoginPage(),
    ));
  }
  else{
    print("Sall jab ye nhi null hai");
    runApp(new MaterialApp(
      title: 'Home page',
      home: new Home(),
    ));
  }

}


