import 'package:badges/badges.dart';
import 'package:catalog/Helper/ItemContainer.dart';
import 'package:catalog/Screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:catalog/model/providerModel.dart';
import 'package:provider/provider.dart';

class IPhones extends StatefulWidget {
  const IPhones({Key? key}) : super(key: key);

  @override
  _IPhonesState createState() => _IPhonesState();
}

class _IPhonesState extends State<IPhones> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
              size: 22,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          IconButton(
              icon: Badge(
                badgeContent: cart.listlength != 0
                    ? Text("${cart.listlength}")
                    : Text(''),
                badgeColor: Colors.amber,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 22,
                ),
              ),
              onPressed: () {
                Get.to(() => Cart());
              })
        ],
        // centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "iPhones",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Stack(
        children: [
          buildgrid(),
          Positioned(
            child: Text(
              "Featured iPhones",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            top: 10,
            left: 20,
          ),
        ],
      ),
    );
  }
}

Widget buildgrid() {
  return Padding(
    padding: const EdgeInsets.only(top: 40),
    child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      childAspectRatio: 0.77,
      children: <Widget>[
        // ItemContainer(),
        ItemContainer(
          itemId: 1,
          height: 160,
          tag: "1",
          name: 'iPhone X (RED)',
          price: 499,
          imagename: 'iPhones/iphoneX',
        ),
        ItemContainer(
          itemId: 1,
          height: 160,
          tag: "2",
          name: 'iPhone 12 Pro',
          price: 999,
          imagename: 'iPhones/iphone12',
        ),
        ItemContainer(
            itemId: 1,
            height: 160,
            tag: "3",
            name: 'iPhone X Max (GOLD)',
            price: 659,
            imagename: 'iPhones/iphoneXmax'),
        ItemContainer(
          itemId: 1,
          height: 160,
          tag: "4",
          name: 'iPhone 11 (128GB)',
          price: 759,
          imagename: 'iPhones/iphone11',
        ),
        ItemContainer(
          itemId: 1,
          height: 160,
          tag: "5",
          name: 'iPhone 11 (64GB)',
          price: 699,
          imagename: 'iPhones/iphone1164',
        ),
        ItemContainer(
            itemId: 1,
            height: 160,
            tag: "6",
            name: 'iPhone 7',
            price: 489,
            imagename: 'iPhones/iphone7'),
      ],
    ),
  );
}
