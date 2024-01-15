import 'package:apparel/screens/categories/Categories.dart';
import 'package:apparel/screens/cart.dart';
import 'package:apparel/screens/details.dart';
import 'package:apparel/screens/favourites.dart';
import 'package:apparel/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'layout/layout.dart';
import 'login/login_screen.dart';
import 'login/register_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp( MyApp());
}

//عدد المحاولات
const int maxFailedLoadAttempts = 3;

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade800,

        primarySwatch: Colors.deepOrange,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade800,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: Colors.white,
          )
        )
      ),
      themeMode: ThemeMode.light,
      /*   initialRoute: "loginscreen",
      routes: {
        "loginscreen": (context) => LoginScreen(),
        "register": (context) => Register(),
        "homepage":(context) => HomePage(),
        "cart":(context) => CartPage(),
        "favourites":(context) => Favourites(),
        "homelayout":(context) => LayOut(),
        //"categories":(context) => Categories(),

      },*/

      home: LayOut(),
    );
  }
}
