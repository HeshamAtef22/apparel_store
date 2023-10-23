import 'package:apparel/screens/categories/kids.dart';
import 'package:apparel/screens/categories/woman.dart';
import 'package:flutter/material.dart';

import '../../components/conmponents.dart';
import '../../data/data.dart';
import 'man.dart';

class Categories extends StatefulWidget {
  var data;
  Color color;

   Categories({super.key, required this.data, required this.color});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: sliderBannerItems.length,
      initialIndex:widget.data,
      child: Scaffold(
        appBar: AppBar(title: Text("Categories"), actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 24),
          ),
        ],

        bottom: TabBar(
          indicatorColor:ColorTheme(),

          tabs: [
            Tab(

              child: Text("Men",style: TextStyle(
                color: Colors.black,
              ),)

            ),
            Tab(
                child: Text("Woman",style: TextStyle(
                  color: Colors.black,
                ),)
            ),
            Tab(
                child: Text("Kids",style: TextStyle(
                  color: Colors.black,
                ),)
            ),
          ],

        ),
        ),
        body: TabBarView(
          children: [
            ManPage(bannarcolor: widget.color,),
            WomanPage(bannarcolor: widget.color),
            KidsPage(bannarcolor: widget.color),
          ]
        )
      ),
    );
  }
}
