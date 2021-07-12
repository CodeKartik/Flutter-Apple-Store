import 'package:catalog/model/providerModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

import '../model/model.dart';

class ProductViewForIphone extends StatefulWidget {
  final imageName;
  final productName;
  final int price;
  final String tag;

  const ProductViewForIphone({
    Key? key,
    required this.imageName,
    required this.tag,
    required this.productName,
    required this.price,
  }) : super(key: key);

  @override
  _ProductViewForIphoneState createState() => _ProductViewForIphoneState();
}

class _ProductViewForIphoneState extends State<ProductViewForIphone> {
  String id = "0";

  @override
  void initState() {
    print("${int.parse(widget.tag)}");
    setState(() {
      id = widget.tag;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cart = context.read<CartModel>();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.amber.shade600])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_rounded))),
              Container(
                child: Hero(
                    tag: '${widget.tag}',
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'asset/images/${widget.imageName}.png',
                        height: 300,
                        width: 250,
                      ),
                    )),
              ),
              Positioned(
                top: 300,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          offset: Offset(15.0, 15.0),
                          blurRadius: 25,
                          color: Colors.grey.shade800,
                        ),
                      ]),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 12,
                          left: 27,
                          child: Text(
                            "${widget.productName}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )),
                      Positioned(
                          top: 37,
                          left: 27,
                          child: Text(
                            "Highlights",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 20),
                          )),
                      Positioned(
                          top: 65,
                          left: 20,
                          child: Container(
                            height: 145,
                            width: 300,
                            child: ListView(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              children: [
                                Text(
                                  "${iphones[int.parse(id) - 1].description}",
                                  style: TextStyle(fontSize: 15.8),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                          top: 220,
                          left: 30,
                          child: Text(
                            "\$ ${widget.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          )),
                      Positioned(
                          top: 212,
                          right: 30,
                          child: MaterialButton(
                              height: 40,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Colors.black,
                              onPressed: () {
                                print("${cart.cartItems.toString()}");
                                cart.add(Items(
                                    imagename: widget.imageName,
                                    name: widget.productName,
                                    price: widget.price));
                                Fluttertoast.showToast(
                                    msg: "${widget.productName} added to cart.",
                                    gravity: ToastGravity.BOTTOM);
                                print("added to cart");
                              },
                              child: Text(
                                "Add to cart",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ))),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
