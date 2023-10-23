import 'package:flutter/material.dart';

import '../components/conmponents.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        //appbar
        AppBar(
          title: Text("Cart"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            )
          ],
        ),
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: ListView(
                  children: [
                    //favourite Product cart
                    CardOfProduct(imageUrl: "assets/images/skirt2.jpg", price: "RS. 555.99", title: "Fashion Great Formal Suit Long Sleeve"),
                    CardOfProduct(imageUrl: "assets/images/slimfit.jpg", price: "RS. 555.99", title: "Kady Classic Plaids Long Sleeves Pajama"),
                    SizedBox(height: 20),
                    //Calculate total price
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Subtotal Total :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black54),),
                              Text("Rs. 6.027.00",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black54),),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Shipping :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black54),),
                              Text("Rs. 100.00",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black54),),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Price :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.black),),
                              Text("Rs. 6,127.00",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black),),
                            ],
                          ),
                          SizedBox(height: 20),
                          DefaultButton(text: "Checkout", function: (){},),


                        ]
                      ),
                    )


                  ]
              ),
            ),
          ),
        ),



      ],
    );
  }
}
