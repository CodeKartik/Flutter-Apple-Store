import 'package:catalog/Home%20page%20widgets/HomepageWidgets.dart';

import 'package:catalog/Helper/search.dart';

import 'package:catalog/Screens/LoginScreen.dart';

import 'package:catalog/Screens/profile.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  final pref;
  const HomePage({Key? key, required this.pref}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _textEditingController;
  bool searchEnabled = false;
  int currentIndex = 0;
  final controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    if (mounted) {
      _textEditingController = TextEditingController();
    }

    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: bottomNavBar(),
      drawer: drawer(),
      body: PageView(
        onPageChanged: (page) {
          setState(() {
            currentPage = page;
          });
        },
        controller: controller,
        children: [
          HomePageWidget(pref: widget.pref),
          SerachBarPage(),
          Profile(pref: widget.pref),
        ],
      ),
    );
  }

  void displayPrivacyPolicy() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("Privacy Policy"),
        content: new Text(
            "This is prototype of Apple store made for submission of \"Smartknower Major Project\" by Kartik More."),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void displayAboutApp() {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text("About app"),
        content: new Text(
            "This app performs all the basic functionalities of a E-Commerse app as sign in,sign up,product listing,add to cart and many more.It also manages its state with the help of Provider and makes use of Shared Prefernce as data storage."),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text("Ok"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

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

  Widget drawer() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
      child: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                        height: 45,
                        child: Image.asset('asset/images/logo.png')),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Apple Store",
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Prototype of apple store",
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 3,
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                leading: Icon(Icons.account_box_rounded),
                title: Text("Profile"),
                onTap: () {
                  Get.to(() => Profile(pref: widget.pref));
                },
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip_rounded),
                title: Text(
                  'Privacy Policy',
                ),
                onTap: () {
                  displayPrivacyPolicy();
                },
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                title: Text("Logout"),
                leading: Icon(
                  Icons.logout_rounded,
                  color: Colors.black,
                ),
                onTap: () {
                  displayLogoutDialog();
                },
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("About app"),
                onTap: () {
                  displayAboutApp();
                },
              ),
              Divider(
                indent: 20,
                endIndent: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Made with'),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('by'),
                      SizedBox(width: 10),
                      Text(
                        'KARTIK MORE',
                        style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container bottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300, spreadRadius: 2, blurRadius: 5),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5, left: 8, right: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home_sharp,
                  color: Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Search',
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.black,
                ),
              ),
            ],
            onTap: (page) {
              controller.animateToPage(page,
                  duration: Duration(milliseconds: 500), curve: Curves.ease);

              setState(() {
                currentPage = page;
              });
            },
          ),
        ),
      ),
    );
  }
}
