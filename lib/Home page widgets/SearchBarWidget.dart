import 'package:flutter/material.dart';

Widget searchbar() {
  return Padding(
    padding: const EdgeInsets.only(top: 97),
    child: Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(5.0, 5.0),
            blurRadius: 5.0,
            color: Colors.black87.withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // IconButton(
          //     onPressed: () {},
          //     icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20)),
          Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          Padding(
            padding: const EdgeInsets.only(left: 9),
            child: Text(
              "Search...",
              style: TextStyle(
                  color: Color(0xff9B9B9B),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(),
          Icon(Icons.search),
        ],
      ),
    ),
  );
}
