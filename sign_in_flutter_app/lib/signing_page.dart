import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_flutter_app/authentication_service.dart';
import 'dart:async';
import 'authentication_state.dart';
import 'authentication_service.dart';

class SignInPage extends StatelessWidget {
  final StreamController<AuthenticationState> _streamController;
  AuthenticationService _authenticationService = new AuthenticationService();
  SignInPage(this._streamController);

  signIn() async {
    _streamController.add(AuthenticationState.authenticated());
    var result = await _authenticationService.authenticate("Lagrango", "GreatLife2019");
    if (result){
      _streamController.add(AuthenticationState.authenticated());
    }else{
      _streamController.add(AuthenticationState.failed());
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Sign in')),
      body: Center(
        child: RaisedButton(
          child: Text('Sign In'),
          onPressed: signIn,
        ),
      ),
    );
  }
}