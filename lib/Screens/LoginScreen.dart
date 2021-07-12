import 'package:catalog/Screens/HomePage.dart';
import 'package:catalog/Screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatefulWidget {
  final pref;
  LoginScreen({required this.pref});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print("This is password ${preferences.getString('password')}");
    print(data);
    print('Name: ${data.name}, Password: ${data.password}');

    return Future.delayed(loginTime).then((_) {
      if (preferences.getString('email') != data.name) {
        return 'User not exists';
      }
      if (preferences.getString('password') != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signUp(LoginData data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getString('email') != null) {
      return 'Account alredy exists try to login';
    }

    if (preferences.getString('email') == null) {
      preferences.setString('email', '${data.name}');
      preferences.setString('password', '${data.password}');
      return null;
    }

    return null;
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return 'undefined';
    });
  }

  getdata() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var e = preferences.getString('email');
    return e;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Apple Store',
      theme: LoginTheme(
          pageColorLight: Color(0xff00cdac).withOpacity(1),
          pageColorDark: Color(0xff02aab0)),
      logo: 'asset/images/logo.png',
      onLogin: _authUser,
      onSignup: _signUp,
      onSubmitAnimationCompleted: () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        var email = preferences.getString('email');
        var pass = preferences.getString('password');
        var name = preferences.getString('name');

        if (name == null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) =>
                      Signup(email: email, pass: pass, pref: widget.pref)));
        }
        if (name != null && email != null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (c) => HomePage(pref: widget.pref)));
        }
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
