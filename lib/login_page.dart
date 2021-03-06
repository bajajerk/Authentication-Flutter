import 'dart:core';
import 'package:flutter_localstorage/flutter_localstorage.dart';
import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'home_page.dart';
import 'email_store.dart';


LocalStorage localStorage = new LocalStorage();

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginData{
  String email = '';
  String password = '';
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _LoginData _data = new _LoginData();

  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return 'The Password must be at least 8 characters.';
    }

    return null;
  }


  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.
      localStorage.setItem("email",_data.email);


      print('Printing the login data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');
      print("Abey bc email me hai ye dekel");
      print(localStorage.getItem("email"));
      String temp = localStorage.getItem("email");

      EmailStorage myStorage = new EmailStorage();
      myStorage.writeEmail(_data.email);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );

    }
  }



  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                  keyboardType:  TextInputType.emailAddress,
                  decoration: new InputDecoration(
                      hintText: 'mayank@bajaj.com',
                      labelText: 'E-mail address'
                  ),
                  validator: this._validateEmail,
                  onSaved: (String value){
                    this._data.email = value;
                  }
              ),
              new TextFormField(
                obscureText: true,
                decoration: new InputDecoration(
                    labelText: 'Enter your pass',
                    hintText: 'Password'
                ),
                validator: this._validatePassword,
                onSaved: (String value){
                  this._data.password = value;
                },
              ),
              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new Text(
                    'Login',
                    style: new TextStyle(
                        color: Colors.white
                    ),
                  ),
                  onPressed: ()=> this.submit(),
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(
                    top: 20.0
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}