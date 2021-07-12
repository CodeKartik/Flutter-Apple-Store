import 'package:catalog/ProductView/airpodsview.dart';
import 'package:catalog/ProductView/ipadview.dart';
import 'package:catalog/ProductView/iphoneview.dart';
import 'package:catalog/ProductView/macview.dart';
import 'package:catalog/ProductView/watchview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemContainer extends StatelessWidget {
  final String name;
  final imagename;
  final String tag;
  final double height;
  final int itemId, price;

  const ItemContainer({
    Key? key,
    required this.name,
    required this.price,
    required this.imagename,
    required this.tag,
    required this.height,
    required this.itemId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (itemId == 1) {
          Get.to(() => ProductViewForIphone(
                imageName: '$imagename',
                tag: '$tag',
                price: price,
                productName: '$name',
              ));
        }
        if (itemId == 2) {
          Get.to(() => ProductViewForMac(
                imageName: '$imagename',
                tag: '$tag',
                price: price,
                productName: '$name',
              ));
        }
        if (itemId == 3) {
          Get.to(() => ProductViewForiPad(
                imageName: '$imagename',
                tag: '$tag',
                price: price,
                productName: '$name',
              ));
        }
        if (itemId == 4) {
          Get.to(() => ProductViewForWatch(
                imageName: '$imagename',
                tag: '$tag',
                price: price,
                productName: '$name',
              ));
        }
        if (itemId == 5) {
          Get.to(() => ProductViewForAirPods(
                imageName: '$imagename',
                tag: '$tag',
                price: price,
                productName: '$name',
              ));
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                spreadRadius: 2.2,
                offset: Offset(10.0, 10.0),
                blurRadius: 8.0,
                color: Colors.black87.withOpacity(0.05),
              ),
            ]),
        height: 10,
        width: 9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: '$tag',
              child: Image.asset(
                'asset/images/$imagename.png',
                height: height,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "$name",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 2),
            Text(
              "\$ $price",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
