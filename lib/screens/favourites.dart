import 'package:flutter/material.dart';

import '../components/conmponents.dart';
import '../data/data.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //appbar
        AppBar(
          title: Text("Favourites"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            )
          ],
        ),
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    //favourite Product cart
                    CartElement(imageUrl: "assets/images/man1.jpg", price: "RS. 1999", title: "Andora Mens 34W23M3209 Jacket"),
                    CartElement(imageUrl: "assets/images/short.jpg", price: "RS. 169.49", title: "Chertex Men's Melton Shorts"),
                    CartElement(imageUrl: "assets/images/skirts.jpg", price: "RS. 2799.00", title: "Fashion Male Suit Set Blazer And Pants Plain Classic"),
                    SizedBox(height: 20),
                    //add more to list text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40,
                            child: Divider(thickness: 1, color: Colors.black)),
                        Text("Add more to list",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                        SizedBox(
                            width: 40,
                            child: Divider(thickness: 1, color: Colors.black),),
                      ],
                    ),
                    //More Products
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        ...List.generate(2, (index) => Container(
                          width: MediaQuery.of(context).size.width * .4,
                            child: productsandprice[index]),),
                      ]
                    ),
                    SizedBox(height: 20),
                  ]
                ),
              ),
            ),
          ),
        ),



      ],
    );
  }
}
