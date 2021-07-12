import 'dart:async';
import 'package:catalog/Screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginScreen.dart';
// import 'dashboard_screen.dart';

// import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  final pref;
  SplashScreen({required this.pref});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var name = preferences.getString('name');
    var email = preferences.getString('email');
    if (name == null && email == null) {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginScreen(pref: widget.pref))));
    }

    if (name != null && email != null) {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (c) => HomePage(pref: widget.pref))));
      // MaterialPageRoute(
      //     builder: (context) => DashboardScreen(
      //           name: email,
      //         ))));
    }

    //logout condition
    if (name != null && email == null) {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginScreen(pref: widget.pref))));
    }

    if (name == null && email != null) {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginScreen(pref: widget.pref))));
    }
  }

  @override
  void initState() {
    //go to home screen
    getName();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/logo.png',
              height: 135,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Apple Store",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Prototype of Apple store ",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Made with "),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Text(" by KARTIK MORE.")
              ],
            )
          ],
        ),
      ),
    );
  }
}
