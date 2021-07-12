import 'package:catalog/Helper/search.dart';

import 'package:catalog/model/providerModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return Scaffold(
      body: cart.cartItems.length != 0
          ? SafeArea(
              child: Stack(
                children: [
                  Positioned(
                      top: 2,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new_rounded))),
                  Positioned(
                      top: 10,
                      right: 135,
                      child: Text(
                        "My Cart",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      )),
                  Positioned(
                      top: 50,
                      right: 155,
                      child: Text(
                        "${cart.cartItems.length} Items",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      )),
                  Positioned(
                      bottom: 15,
                      left: 70,
                      child: MaterialButton(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          Fluttertoast.showToast(
                              msg:
                                  "This is just a prototype. Thank you for showing the intrest.",
                              gravity: ToastGravity.BOTTOM);
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          child: Text(
                            "CHECKOUT",
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                        color: Color(0xff343434), //jet black color
                      )),
                  Positioned(
                      bottom: 85,
                      left: 30,
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 5,
                                    offset: Offset(15.0, 15.0),
                                    blurRadius: 15.0,
                                    color: Colors.black87.withOpacity(0.05),
                                  ),
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.local_shipping_rounded),
                                Text(
                                  "FREE",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            height: 66,
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    // color: const Color(0xFF000000),
                                    spreadRadius: 5,
                                    offset: Offset(15.0, 15.0),
                                    blurRadius: 15.0,
                                    color: Colors.black87.withOpacity(0.05),
                                  ),
                                ]),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Total :',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey)),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      "\$ ${cart.totalPrice}",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  Gridbuilder(cart: cart),
                ],
              ),
            )
          : SafeArea(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded)),
                  ),
                  Text(
                    "My Cart",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(
                      'asset/images/add2cart.png',
                      height: 300,
                      width: 200,
                    ),
                  ),
                  Text(
                    "Your cart is empty!",
                    style: TextStyle(fontSize: 28),
                  ),
                  Text(
                    'Add items to it now.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (c) => SerachBarPage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Shop now",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    color: Colors.black,
                  )
                ],
              ),
            ),
    );
  }
}

class Gridbuilder extends StatelessWidget {
  const Gridbuilder({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, bottom: 170),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 10,
            childAspectRatio: 2.3,
            mainAxisSpacing: 10,
          ),
          primary: false,
          padding: const EdgeInsets.all(20),
          itemCount: cart.listlength,
          itemBuilder: (context, index) {
            if (index >= cart.cartItems.length) {
              return const Offstage();
            }
            return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 5,
                        offset: Offset(15.0, 15.0),
                        blurRadius: 15.0,
                        color: Colors.black87.withOpacity(0.05),
                      ),
                    ]),
                child: Stack(
                  children: [
                    Positioned(
                      top: 15,
                      left: 10,
                      child: Container(
                        height: 100,
                        width: 130,
                        child: Image.asset(
                            'asset/images/${cart.cartItems[index].imagename}.png'),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 150,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "${cart.cartItems[index].name}",
                                style: TextStyle(fontSize: 18),
                              )),
                          SizedBox(height: 10),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "\$ ${cart.cartItems[index].price}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                    Positioned(
                      child: IconButton(
                          tooltip: "Delete item",
                          onPressed: () {
                            cart.remove(cart.cartItems[index]);
                            print("item deleted from cart");
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      bottom: 7.5,
                      right: 7.5,
                    )
                  ],
                ));
          }),
    );
  }
}
