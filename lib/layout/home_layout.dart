import 'package:apparel/screens/favourites.dart';
import 'package:flutter/material.dart';

import '../components/conmponents.dart';
import '../screens/cart.dart';
import '../screens/home_page.dart';

class HomeLayOut extends StatefulWidget {
  const HomeLayOut({super.key});

  @override
  State<HomeLayOut> createState() => _HomeLayOutState();
}

class _HomeLayOutState extends State<HomeLayOut> {
  //متغير هياخد رقم الانديكس الخاص بالايتم بوتم بار
  int currentIndex = 0;

  //هعمل ليست للصفحات اللي هتنقل فيها علشان امررها للبوتن بار
  List<Widget> _screens = [
    HomePage(),
    Favourites(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(


        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: ""),

        ],



        //some Option

        selectedIconTheme: IconThemeData(size: 35, color: ColorTheme()),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        //value هو الانديكس اخاص بليست الايتم
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
      //مررة المتغير اللي بياخد قيمة الانديكس الخاص بالتاب وخليته يبقي هو الايندكس
      //الخاص برده بالليست بحيث لما يبق في ايتم 0يعرض اسكرين رقم 0 وهكذا
      body: _screens[currentIndex],
    );
  }
}
