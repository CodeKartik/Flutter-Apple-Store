import 'package:badges/badges.dart';
import 'package:catalog/Helper/ItemContainer.dart';
import 'package:catalog/Screens/cart.dart';
import 'package:catalog/model/providerModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Ipad extends StatefulWidget {
  const Ipad({Key? key}) : super(key: key);

  @override
  _IpadState createState() => _IpadState();
}

class _IpadState extends State<Ipad> {
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
          "iPad",
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
            "Featured iPads",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          top: 10,
          left: 20,
        ),
        buildgrid(),
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
      childAspectRatio: 0.87,
      children: <Widget>[
        ItemContainer(
          itemId: 3,
          height: 135,
          tag: "1",
          name: 'iPad Pro 12.9"',
          price: 799,
          imagename: 'ipad/ipadpro',
        ),
        ItemContainer(
          itemId: 3,
          height: 135,
          tag: "2",
          name: 'iPad Air 10.9"',
          price: 599,
          imagename: 'ipad/ipadair',
        ),
        ItemContainer(
          itemId: 3,
          height: 135,
          tag: "3",
          name: 'iPad Pro 11""',
          price: 329,
          imagename: 'ipad/ipad11',
        ),
        ItemContainer(
          itemId: 3,
          height: 135,
          tag: "4",
          name: 'iPad 10.2"',
          price: 301,
          imagename: 'ipad/ipad102',
        ),
        ItemContainer(
          itemId: 3,
          height: 135,
          tag: "5",
          name: 'iPad Mini 7.9"',
          price: 399,
          imagename: 'ipad/ipad79',
        ),
        // ItemContainer(
        //   itemId: 2,
        //   height: 135,
        //   tag: "6",
        //   name: 'iMac 27"',
        //   price: "\$ 1145",
        //   imagename: 'macbook/imacB',
        // ),
      ],
    ),
  );
}
