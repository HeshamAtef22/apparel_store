import 'package:flutter/material.dart';

import '../../components/conmponents.dart';

class KidsPage extends StatefulWidget {
  Color bannarcolor;
   KidsPage({super.key, required this.bannarcolor});

  @override
  State<KidsPage> createState() => _KidsPageState();
}

class _KidsPageState extends State<KidsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      //color: Colors.grey,
      margin: EdgeInsets.only(top: 20,right: 16,left: 16),
      width: double.infinity,

      child: Column(
        children: [
          //container for sale bannar
          SaleBanner(backgroundcolor: widget.bannarcolor,
            title: "SEASON SALE",
            subtitle: "UP TO 25% OFF",
          ),
          //Categorie Element
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Container(
                    width: double.infinity,
                    child: Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 20,
                        children: [
                          CategoriesElement(imageurl: "assets/images/mantshirticon.png", title: "T-shirt"),

                          CategoriesElement(imageurl: "assets/images/manJeansicon.png", title: "Jeans"),
                          CategoriesElement(imageurl: "assets/images/manshortsicon.png", title: "Shorts"),

                          CategoriesElement(imageurl: "assets/images/manhoodieicon.png", title: "hoodie"),
                          CategoriesElement(imageurl: "assets/images/manshirticon.png", title: "Shirt"),
                          CategoriesElement(imageurl: "assets/images/mansweatericon.png", title: "Sweater"),
                          CategoriesElement(imageurl: "assets/images/manJacketIcon.png", title: "Jacket"),
                          CategoriesElement(imageurl: "assets/images/manandericon.png", title: "UnderWear"),

                        ]
                    ),
                  ),
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}