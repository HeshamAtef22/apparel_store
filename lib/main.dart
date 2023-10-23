import 'package:apparel/screens/categories/Categories.dart';
import 'package:apparel/screens/cart.dart';
import 'package:apparel/screens/details.dart';
import 'package:apparel/screens/favourites.dart';
import 'package:apparel/screens/home_page.dart';
import 'package:flutter/material.dart';

import 'layout/layout.dart';
import 'login/login_screen.dart';
import 'login/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
 theme:  ThemeData(
   scaffoldBackgroundColor: Colors.grey.shade100,
   appBarTheme: AppBarTheme(
     centerTitle:  true,
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
   /*   initialRoute: "loginscreen",
      routes: {
        "loginscreen": (context) => LoginScreen(),
        "register": (context) => Register(),
        "homepage":(context) => HomePage(),
        "cart":(context) => CartPage(),
        "favourites":(context) => Favourites(),
        "homelayout":(context) => HomeLayOut(),
        //"categories":(context) => Categories(),

      },*/

      home:  LayOut(),
    );
  }
}

