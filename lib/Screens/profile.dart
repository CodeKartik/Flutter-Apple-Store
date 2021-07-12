import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginScreen.dart';

class Profile extends StatefulWidget {
  final pref;
  const Profile({Key? key, required this.pref}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String bankname = 'Axis Bank';
  bool showBack = false;
  late SharedPreferences preferences;

  void displayLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Alert"),
        content: new Text("Are you sure you want to Logout."),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text(
              "Logout",
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              print("Account Logged Out");
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (c) => LoginScreen(pref: widget.pref)));
            },
          )
        ],
      ),
    );
  }

  void displayDeleteDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Alert"),
        content: new Text(
            "Are you sure you want to delete your account. Your email and password will be removed from database."),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            isDefaultAction: false,
            child: Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              print("Account deleted");

              widget.pref.remove('email');
              widget.pref.remove('name');
              widget.pref.remove('password');
              widget.pref.remove('phone');
              widget.pref.remove('cardholdername');
              widget.pref.remove('cardno');
              widget.pref.remove('cardexp');
              widget.pref.remove('cvv');

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (c) => LoginScreen(pref: widget.pref)));
            },
          )
        ],
      ),
    );
  }

  void menuAction(String value) {
    switch (value) {
      case 'Logout':
        displayLogoutDialog();
        break;
      case 'Delete account':
        displayDeleteDialog();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton(
                  onSelected: menuAction,
                  itemBuilder: (BuildContext itemBuilder) =>
                      {'Logout', 'Delete account'}
                          .map((value) => PopupMenuItem(
                                child: Text(value),
                                value: value,
                              ))
                          .toList())),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: 160,
              width: 130,
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: [Colors.white, Colors.lightBlueAccent],
                      radius: 0.6),
                  borderRadius: BorderRadius.circular(20.9)),
              child: Image.asset(
                'asset/images/profile.png',
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              '${widget.pref.getString('name')}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              '+91 ${widget.pref.getString('phone')}',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  showBack = !showBack;
                });
              },
              child: CreditCard(
                cardNumber: widget.pref.getString('cardno'),
                cardExpiry: widget.pref.getString('cardexp'),
                cardHolderName: widget.pref.getString('cardholdername'),
                cardType: CardType.masterCard,
                cvv: widget.pref.getString('cvv'),
                bankName: widget.pref.getString('bankname'),
                showBackSide: showBack,
                frontBackground: CardBackgrounds.black,
                backBackground: CardBackgrounds.white,
                showShadow: true,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
