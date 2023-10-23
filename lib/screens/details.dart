import 'package:apparel/components/conmponents.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
   var info;
   DetailsPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        actions: [

          Padding(
            padding: EdgeInsetsDirectional.only(end: 15),
            child: Icon(Icons.add_shopping_cart_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SingleChildScrollView(
         child:  Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              //Image
              Container(
                height: MediaQuery.of(context).size.height * .70,
                width: double.infinity,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(info.imageUrl),
                    fit: BoxFit.fill,
                  )
                ),
              ),
              SizedBox(height: 20),
              //product name and Rating
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                      child: Text(info.productName,maxLines: 2,overflow:TextOverflow.ellipsis , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  SizedBox(child: Row(
                    children: [
                      Text("4.5/5",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: ColorTheme()),),
                      SizedBox(width: 5),
                      Icon(Icons.star,color: ColorTheme(),),
                    ]
                  ),),
                ],
              ),
              SizedBox(height: 10),
              //Price
              Text(
              "${info.price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400,color: Colors.black54),),
              SizedBox(height: 10),
              //Description

             Container(
                 width: double.infinity,
                 child: Text(info.description,
                 maxLines: 7,
                   overflow: TextOverflow.ellipsis,
                 ),


               ),
             SizedBox(height: 20),
              DefaultButton(function: (){}, text: "Add to cart"),
              SizedBox(height: 20),


            ],
          )
        ),
      ),
      
    );
  }
}
