import 'package:catalog/Screens/SplashScreen.dart';
import 'package:catalog/model/providerModel.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(ChangeNotifierProvider(
    create: (context) => CartModel(),
    child: GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SF'),
      title: 'Apple Store',
      color: Colors.white,
      home: SplashScreen(
        pref: pref,
      ),
    ),
  ));
}
