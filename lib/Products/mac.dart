import 'package:badges/badges.dart';
import 'package:catalog/Helper/ItemContainer.dart';
import 'package:catalog/Screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:catalog/model/providerModel.dart';
import 'package:provider/provider.dart';

class Mac extends StatefulWidget {
  const Mac({Key? key}) : super(key: key);

  @override
  _MacState createState() => _MacState();
}

class _MacState extends State<Mac> {
  @override
  void initState() {
    super.initState();
  }

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
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => Cart()));
              })
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "iMac",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
      ),
      body: Stack(children: [
        Positioned(
          child: Text(
            "Featured iPhones",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          top: 10,
          left: 20,
        ),
        buildgrid()
      ]),
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
      childAspectRatio: 0.8,
      children: <Widget>[
        // ItemContainer(),
        ItemContainer(
          itemId: 2,
          height: 135,
          tag: "1",
          name: 'MacBook Air',
          price: 999,
          imagename: 'macbook/macair',
        ),
        ItemContainer(
          itemId: 2,
          height: 135,
          tag: "2",
          name: 'MacBook Pro  M1"',
          price: 1669,
          imagename: 'macbook/macair',
        ),
        ItemContainer(
          itemId: 2,
          height: 135,
          tag: "3",
          name: 'MacBook Pro  13"',
          price: 1989,
          imagename: 'macbook/macpro13',
        ),
        ItemContainer(
          itemId: 2,
          height: 135,
          tag: "4",
          name: 'MacBook Pro  16"',
          price: 2399,
          imagename: 'macbook/macpro16',
        ),
        ItemContainer(
          itemId: 2,
          height: 135,
          tag: "5",
          name: 'iMac 24"',
          price: 1299,
          imagename: 'macbook/imacF',
        ),
        ItemContainer(
          itemId: 2,
          height: 135,
          tag: "6",
          name: 'iMac 27"',
          price: 1589,
          imagename: 'macbook/imacB',
        ),
      ],
    ),
  );
}
