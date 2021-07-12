import 'package:badges/badges.dart';
import 'package:catalog/Helper/ItemContainer.dart';
import 'package:catalog/Screens/cart.dart';
import 'package:catalog/model/providerModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Airpods extends StatefulWidget {
  const Airpods({Key? key}) : super(key: key);

  @override
  _AirpodsState createState() => _AirpodsState();
}

class _AirpodsState extends State<Airpods> {
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
          "AirPods",
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
            "Featured AirPods",
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
          itemId: 5,
          height: 135,
          tag: "1",
          name: 'AirPods Max',
          price: 439,
          imagename: 'airpods/airpodsmax',
        ),
        ItemContainer(
          itemId: 5,
          height: 135,
          tag: "2",
          name: 'AirPods Pro',
          price: 269,
          imagename: 'airpods/airpodspro',
        ),
        ItemContainer(
          itemId: 5,
          height: 135,
          tag: "3",
          name: 'AirPods WC',
          price: 189,
          imagename: 'airpods/airpods',
        ),
        ItemContainer(
          itemId: 5,
          height: 135,
          tag: "4",
          name: 'AirPods',
          price: 99,
          imagename: 'airpods/airpods',
        ),
        // ItemContainer(
        //   itemId: 4,
        //   height: 135,
        //   tag: "5",
        //   name: 'Apple watch S5',
        //   price: 1145,
        //   imagename: 'watches/iwatch',
        // ),
        // ItemContainer(
        //   itemId: 4,
        //   height: 135,
        //   tag: "6",
        //   name: 'Apple watch S3',
        //   price: 1145,
        //   imagename: 'watches/watch3',
        // ),
      ],
    ),
  );
}
