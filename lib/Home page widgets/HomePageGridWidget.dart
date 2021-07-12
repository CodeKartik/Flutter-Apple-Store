import 'package:flutter/material.dart';

import 'HomePageItemContainer.dart';

Widget buildgridForHomePage() {
  return Padding(
    padding: const EdgeInsets.only(top: 148),
    child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 1,
      childAspectRatio: 2,
      children: <Widget>[
        HomePageItemContainer(
          productName: 'iPhone',
          subName: 'Blast past fast',
          shortDisc: '''Feel the power in your
hands and dominate.''',
          imageName: 'iPhones/homeiphone.png',
          color: Colors.amber,
        ),
        HomePageItemContainer(
          productName: 'MacBook',
          subName: 'Incredible power.',
          shortDisc: '''Powerfull and long lasting
MacBooks for you.''',
          imageName: 'macbook/macair.png',
          color: Colors.blue,
        ),
        HomePageItemContainer(
          productName: 'iPad',
          subName: 'Powerfull iPad',
          shortDisc: '''Feel the ultimate iPad
experience and joy.''',
          imageName: 'ipad/homeipad.png',
          color: Colors.pinkAccent.shade200,
        ),
        HomePageItemContainer(
          productName: 'Apple Watch',
          subName: 'Towards health',
          shortDisc: '''The future of health
is on your wrist.''',
          imageName: 'watches/iwatch.png',
          color: Colors.orange.shade700,
        ),
        HomePageItemContainer(
          productName: 'AirPods',
          subName: 'Magic airpods',
          shortDisc: '''Listen it in a way only you
can and joy.''',
          imageName: 'airpods/airpods.png',
          color: Colors.greenAccent,
        ),
      ],
    ),
  );
}
