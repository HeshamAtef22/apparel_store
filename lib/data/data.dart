import 'package:flutter/material.dart';

import '../components/conmponents.dart';

bool isFavorite = false;

List<ProductCard> products = [
  ProductCard(
    imageUrl: "assets/images/slimfit.jpg",
    showdetails: false,
    productName: "Kady Classic Plaids Long Sleeves Pajama",
    price: 499.99,
    isFavorite: isFavorite,
    description: "Jet products are manufactured from the finest Quality cotton to ensure maximum softness durability and and absorption of perspiration they are also whitened with oxygen , or dyed with materials that conform with international quality standards. Therefore , JET products are hygienic.The well studies design, the precision in sewing and the high quality of materials used allow best fits, ultimate comfort and endurance when used and washed repeatedly.",
  ),
  ProductCard(
    imageUrl: "assets/images/skirt2.jpg",
    showdetails: false,
    productName: "Fashion Great Formal Suit Long Sleeve",
    price: 555.99,
    isFavorite: isFavorite,
    description: """""Classic men's blazer, beige color, of high quality materials, with a satin lining The blazer is also suitable for all ages, young men and women. It is available in more than one attractive color that catches the eye when wearing it
  Available in more than one color and sizes from size M to size 4Xl
  So that it combines an attractive look in front of everyone and a sense of comfort and simplicity at the same time.
  Currently available from Clever for special occasions""",
  ),
  ProductCard(
    imageUrl: "assets/images/skirts.jpg",
    showdetails: false,
    isFavorite: isFavorite,
    productName: "Fashion Male Suit Set Blazer And Pants Plain Classic",
    price: 1799.00,
    description: """ Brands Hub evolves at the same pace as its customer, always watching out for new technologies, social movements and the latest artistic or musical trends.""",
  ),
  ProductCard(
    imageUrl: "assets/images/short.jpg",
    showdetails: false,
    price: 169.49,
    productName: "Chertex Men's Melton Shorts",
    isFavorite: isFavorite,
    description: "Step up your style with our fashionable stylish clothes ! Featuring great variety of designs that suits all tastes and all occasions with a very good quality.",
  ),
];

List<ProductCard> productsandprice = [
  ProductCard(
    imageUrl: "assets/images/jacket.jpg",
    showdetails: true,
    productName: "Andora Mens 34W23M3209 Jacket",
    price: 250,
    isFavorite: isFavorite,
    description: "Men's and youth's leather jacket of the finest imported leather, a distinctive model that has no equal in the local markets, suitable for all occasions, model 2023",
  ),
  ProductCard(
      imageUrl: "assets/images/short.jpg",
    showdetails: true,
      productName: "FILA Men’s Grey Shorts",
      isFavorite: isFavorite,
      price: 300,
    description: "Step up your style with our fashionable stylish clothes ! Featuring great variety of designs that suits all tastes and all occasions with a very good quality.",
  ),
];

//list of BannerSlider Data
List<SliderBanner> sliderBannerItems = [
  SliderBanner(
    imagetext: "assets/images/men.png",
    containercolor: Color.fromRGBO(108, 112, 235, 1),
    title: "Men",
    itemKey: 0,
  ),
  SliderBanner(
    imagetext: "assets/images/women.png",
    containercolor: Color.fromRGBO(108, 0, 150, 1),
    title: "Women",
    itemKey: 1,
  ),
  SliderBanner(
    imagetext: "assets/images/children.png",
    containercolor: Color.fromRGBO(0, 150, 150, 1),
    title: "Kids",
    itemKey: 2,
  ),
];


List<ProductCard> ProductBannar = [
  ProductCard(
    imageUrl: "assets/images/man2.jpg",
    showdetails: true,
    productName: "Andora Mens 34W23M3209 Jacket",
    price: 2900,
    isFavorite: isFavorite,
    description: "Men's and youth's leather jacket of the finest imported leather, a distinctive model that has no equal in the local markets, suitable for all occasions, model 2023",

  ),
  ProductCard(
    imageUrl: "assets/images/man3.jpeg",
    showdetails: true,
    productName: "FILA Men’s Grey Shorts",
    price: 2999,
    isFavorite: isFavorite,
    description: "Men's and youth's leather jacket of the finest imported leather, a distinctive model that has no equal in the local markets, suitable for all occasions, model 2023",

  ),

];