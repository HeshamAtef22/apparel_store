import 'package:flutter/material.dart';

import '../components/conmponents.dart';

bool isFavorite = false;

List<ProductCard> products = [
  ProductCard(
    imageUrl: "assets/images/slimfit.jpg",
    isFavorite: isFavorite,
  ),
  ProductCard(
    imageUrl: "assets/images/skirt2.jpg",
    isFavorite: isFavorite,
  ),
  ProductCard(
    imageUrl: "assets/images/skirts.jpg",
    isFavorite: isFavorite,
  ),
  ProductCard(
    imageUrl: "assets/images/short.jpg",
    isFavorite: isFavorite,
  ),
];

List<ProductCard> productsandprice = [
  ProductCard(
    imageUrl: "assets/images/jacket.jpg",
    productName: "Andora Mens 34W23M3209 Jacket",
    price: 250,
    isFavorite: isFavorite,
  ),
  ProductCard(
      imageUrl: "assets/images/short.jpg",
      productName: "FILA Men’s Grey Shorts",
      isFavorite: isFavorite,
      price: 300),
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
