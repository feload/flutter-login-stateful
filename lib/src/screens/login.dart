import 'package:flutter/material.dart';
import '../mixins/validation.dart';

class LoginScreen extends StatefulWidget {
  State createState () {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email;
  String password;

  Widget build (context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: submitButton()
            )
          ],
        ),
      ),
    );
  }

  Widget emailField () {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: validateEmail,
      onSaved: (String value) {
        email = value;
      },
      decoration: InputDecoration(
        labelText: "Email Address",
        hintText: "you@example.com",
      ),
    );
  }

  Widget passwordField () {
    return TextFormField(
      obscureText: true,
      validator: validatePassword,
      onSaved: (String value) {
        password = value;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Never share it"
      ),
    );
  }

  Widget submitButton() {
    return RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      child: Text('Send'),
      onPressed: () {
        if(formKey.currentState.validate()) {
          formKey.currentState.save();

          print('Time to post $email and $password');
        }
      },
    );
  }
}