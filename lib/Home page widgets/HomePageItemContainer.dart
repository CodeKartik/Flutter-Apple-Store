import 'package:catalog/Products/airpods.dart';
import 'package:catalog/Products/apple_watches.dart';
import 'package:catalog/Products/iPad.dart';
import 'package:catalog/Products/iPhones.dart';
import 'package:catalog/Products/mac.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageItemContainer extends StatelessWidget {
  final String imageName, productName, shortDisc, subName;
  final Color color;
  const HomePageItemContainer({
    Key? key,
    required this.imageName,
    required this.productName,
    required this.subName,
    required this.shortDisc,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // color: const Color(0xFF000000),
              spreadRadius: 5,
              offset: Offset(15.0, 15.0),
              blurRadius: 15.0,
              color: Colors.black87.withOpacity(0.05),
            ),
          ]),
      // height: 200,
      // width: 100,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Material(
            elevation: 3.5,
            borderRadius: BorderRadius.circular(20.9),
            child: Container(
              height: 160,
              width: 130,
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                      colors: [Colors.white, color], radius: 0.7),
                  // color: Colors.amber,
                  borderRadius: BorderRadius.circular(20.9)),
              child: Image.asset(
                'asset/images/$imageName',
              ),
            ),
          ),
          SizedBox(
            height: 150,
            width: 170,
            child: Stack(
              children: [
                Positioned(
                    top: 4,
                    left: 30,
                    child: Text(
                      "$productName",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Positioned(
                    top: 32,
                    left: 30,
                    child: Text(
                      "$subName",
                      style: TextStyle(fontSize: 15.8),
                    )),
                Positioned(
                    top: 52,
                    left: 30,
                    child: Text(
                      '$shortDisc',
                      style: TextStyle(fontSize: 12.1),
                    )),
                Positioned(
                    top: 90,
                    right: 8,
                    child: MaterialButton(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {
                        if (productName == 'iPhone') {
                          Get.to(() => IPhones());
                        }
                        if (productName == 'MacBook') {
                          Get.to(() => Mac());
                        }
                        if (productName == 'iPad') {
                          Get.to(() => Ipad());
                        }
                        if (productName == 'Apple Watch') {
                          Get.to(() => Watches());
                        }
                        if (productName == 'AirPods') {
                          Get.to(() => Airpods());
                        }
                      },
                      child: Text(
                        "Show",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.black,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
