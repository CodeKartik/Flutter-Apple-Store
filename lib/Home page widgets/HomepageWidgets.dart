import 'package:badges/badges.dart';
import 'package:catalog/Helper/search.dart';

import 'package:catalog/Screens/cart.dart';
import 'package:catalog/model/providerModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'HomePageGridWidget.dart';
import 'SearchBarWidget.dart';

String greetingMessage() {
  var timeNow = DateTime.now().hour;

  if (timeNow <= 12) {
    return 'Good Morning';
  } else if ((timeNow > 12) && (timeNow <= 16)) {
    return 'Good Afternoon';
  } else if ((timeNow > 16) && (timeNow < 20)) {
    return 'Good Evening';
  } else {
    return 'Good Night';
  }
}

class HomePageWidget extends StatelessWidget {
  final pref;

  const HomePageWidget({
    Key? key,
    required this.pref,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return SafeArea(
      child: Stack(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => SerachBarPage()));
              },
              child: searchbar()),
          Positioned(
              top: 10,
              right: 130,
              child: Text(
                "Apple Store",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              )),
          Positioned(
              top: 48,
              left: 40,
              child: Text(
                greetingMessage(),
                style: TextStyle(fontSize: 15),
              )),
          Positioned(
              top: 68,
              left: 40,
              child: Text(
                "${pref.getString('name')}",
                style: TextStyle(fontSize: 20),
              )),
          Positioned(
            top: 2,
            child: IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                )),
          ),
          Positioned(
            top: 2,
            right: 5,
            child: IconButton(
                onPressed: () {
                  Get.to(() => Cart());
                },
                icon: Badge(
                  badgeContent: cart.listlength != 0
                      ? Text("${cart.listlength}")
                      : Text(''),
                  badgeColor: Colors.amber,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                )),
          ),
          buildgridForHomePage(),
        ],
      ),
    );
  }
}
