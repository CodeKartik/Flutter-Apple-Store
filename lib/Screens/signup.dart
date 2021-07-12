import 'package:catalog/Screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  final email;
  final pass;
  final pref;
  const Signup(
      {Key? key, required this.email, required this.pass, required this.pref})
      : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  int _selectedValue = 0;
  late CardType _selectedCardType;

  final name = TextEditingController();
  final phone = TextEditingController();
  final cardholdername = TextEditingController();
  final cardno = TextEditingController();
  final cardexp = TextEditingController();
  final cvv = TextEditingController();
  final bankname = TextEditingController();

  @override
  void initState() {
    super.initState();
    getDetails();
  }

  getDetails() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString('name') == null) {
      displaySignupDialog();
    } else {
      displaycontinueDialog();
    }
  }

  void displaySignupDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Sign Up"),
        content: new Text("Create a new account"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  void signupErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Alert"),
        content: new Text("Fill all the details"),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  void displaycontinueDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Alert"),
        content: new Text("Account alredy exist"),
        actions: [
          CupertinoDialogAction(
              isDefaultAction: true,
              child: CupertinoButton(
                  child: Text("Continue"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (c) => HomePage(pref: widget.pref)));
                  }))
        ],
      ),
    );
  }

  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        width: 300,
        height: 250,
        child: CupertinoPicker(
          backgroundColor: Colors.white,
          itemExtent: 30,
          scrollController: FixedExtentScrollController(initialItem: 1),
          children: [
            Text('AmericanExpress'),
            Text('dinersClub'),
            Text('discover'),
            Text('elo'),
            Text('jcb'),
            Text('maestro'),
            Text('masterCard'),
            Text('rupay'),
            Text('visa'),
            Text('other'),
          ],
          onSelectedItemChanged: (value) {
            setState(() {
              _selectedValue = value;
            });
            print(_selectedValue);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
          msg: 'Signup first.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
        );

        return false;
      },
      child: Scaffold(
        body: SafeArea(
            child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 20,
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 60,
              left: 20,
              child: Text(
                "Create your account",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 95, 20, 20),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CupertinoFormSection(
                        header: Text("Personal Details"),
                        children: [
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              maxLength: 15,
                              controller: name,
                              placeholder: "Enter name",
                            ),
                            prefix: Text("Name"),
                          ),
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              controller: phone,
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              placeholder: "Enter phone no",
                            ),
                            prefix: Text("Phone"),
                          ),
                        ],
                      ),
                      CupertinoFormSection(
                        header: Text("User"),
                        children: [
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              maxLength: 15,
                              placeholder: widget.email,
                              placeholderStyle:
                                  TextStyle(fontWeight: FontWeight.w400),
                            ),
                            prefix: Text("Email"),
                          ),
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              obscureText: true,
                              placeholder: widget.pass,
                              maxLength: 8,
                              placeholderStyle:
                                  TextStyle(fontWeight: FontWeight.w400),
                            ),
                            prefix: Text("Password"),
                          ),
                        ],
                      ),
                      CupertinoFormSection(
                        header: Text("Card Details"),
                        children: [
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              controller: bankname,
                              maxLength: 18,
                              placeholder: "Enter Bank name",
                            ),
                            prefix: Text("Bank Name :"),
                          ),
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              controller: cardholdername,
                              maxLength: 18,
                              placeholder: "Enter card holder name",
                            ),
                            prefix: Text("Name :"),
                          ),
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              controller: cardno,
                              keyboardType: TextInputType.number,
                              maxLength: 19,
                              placeholder: "Enter card no",
                            ),
                            prefix: Text("Card No :"),
                          ),
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              controller: cardexp,
                              keyboardType: TextInputType.datetime,
                              maxLength: 5,
                              placeholder: "expiry date Eg.02/25",
                            ),
                            prefix: Text("Card Expiry :"),
                          ),
                          CupertinoFormRow(
                            child: CupertinoTextFormFieldRow(
                              controller: cvv,
                              keyboardType: TextInputType.number,
                              maxLength: 3,
                              placeholder: "Enter cvv",
                            ),
                            prefix: Text("CVV :"),
                          ),
                          CupertinoButton(
                              child: Text("Select card type"),
                              onPressed: () {
                                _showPicker(context);
                                if (_selectedValue == 0) {
                                  setState(() {
                                    _selectedCardType = CardType.masterCard;
                                  });
                                }
                                if (_selectedValue == 1) {
                                  setState(() {
                                    _selectedCardType = CardType.dinersClub;
                                  });
                                }
                                if (_selectedValue == 2) {
                                  setState(() {
                                    _selectedCardType = CardType.discover;
                                  });
                                }
                                if (_selectedValue == 3) {
                                  setState(() {
                                    _selectedCardType = CardType.elo;
                                  });
                                }
                                if (_selectedValue == 4) {
                                  setState(() {
                                    _selectedCardType = CardType.jcb;
                                  });
                                }
                                if (_selectedValue == 5) {
                                  setState(() {
                                    _selectedCardType = CardType.maestro;
                                  });
                                }
                                if (_selectedValue == 6) {
                                  setState(() {
                                    _selectedCardType =
                                        CardType.americanExpress;
                                  });
                                }
                                if (_selectedValue == 7) {
                                  setState(() {
                                    _selectedCardType = CardType.rupay;
                                  });
                                }
                                if (_selectedValue == 8) {
                                  setState(() {
                                    _selectedCardType = CardType.visa;
                                  });
                                }
                                if (_selectedValue == 9) {
                                  setState(() {
                                    _selectedCardType = CardType.other;
                                  });
                                }
                                print("${_selectedCardType.toString()}");
                              }),
                        ],
                      ),
                      SizedBox(height: 22),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 5,
                            child: CupertinoButton.filled(
                              child: Text("Sign Up"),
                              onPressed: () async {
                                SharedPreferences preferences =
                                    await SharedPreferences.getInstance();
                                preferences.setString('name', name.text);
                                preferences.setString('phone', phone.text);
                                preferences.setString(
                                    'cardholdername', cardholdername.text);
                                preferences.setString('cardno', cardno.text);
                                preferences.setString('cardexp', cardexp.text);
                                preferences.setString('cvv', cvv.text);
                                preferences.setString(
                                    'cardtype', _selectedCardType.toString());
                                preferences.setString(
                                    'bankname', bankname.text);

                                // displayDialog();

                                // preferences.remove('name');

                                // print("${preferences.getString('name')}");

                                print(name.text);
                                print(bankname.text);
                                print(phone.text);
                                print(cardholdername.text);
                                print(cardno.text);
                                print(cardexp.text);
                                print(cvv.text);
                                print(_selectedCardType.toString());

                                if (name.text.isNotEmpty &&
                                    bankname.text.isNotEmpty &&
                                    phone.text.isNotEmpty &&
                                    cardholdername.text.isNotEmpty &&
                                    cardno.text.isNotEmpty &&
                                    cardexp.text.isNotEmpty &&
                                    cvv.text.isNotEmpty) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (c) =>
                                              HomePage(pref: widget.pref)));
                                } else {
                                  signupErrorDialog();
                                }
                              },
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
