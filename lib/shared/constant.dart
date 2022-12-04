import 'package:admin_dashboard/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


late SharedPreferences prefs;
const String token = "wjeiwenwejwkejwke98w9e8wewnew8wehwenj232jh32j3h2j3h2j";


var homeProductList = [
  ProductModel(
    productId: 1,
    productName: "Burger",
    productDescription:"Burger Sandwich with fries and extra cheese and cola drink.",
    productImage: "images/product/burger.jpg",
    productPrice: 10,
    productOffer: 1,
    productRate: 2.0,
    productFavourite: 1,
    productFirstShow: 1,
    productQuantity: 5,
  ),
  ProductModel(
    productId: 2,
    productName: "Fish",
    productDescription: "Food Description and price.",
    productImage: "images/product/fish.jpg",
    productPrice: 15,
    productOffer: 1,
    productRate: 3.0,
    productFavourite: 0,
    productFirstShow: 1,
    productQuantity: 10,
  ),
  ProductModel(
    productId: 4,
    productName: "Pizza",
    productDescription: "Food Description and price.",
    productImage: "images/product/pizza.jpg",
    productPrice: 25,
    productOffer: 0,
    productRate: 1.0,
    productFavourite: 0,
    productFirstShow: 1,
    productQuantity: 15,
  ),
];

var categoryProduct = [

  ProductModel(
    productId: 1,
    productName: "juice",
    productDescription: "Food Description and price.",
    productImage: "images/product/fresh_juice.jpg",
    productPrice: 100,
    productOffer: 0,
    productRate: 1.0,
    productFavourite: 0,
    productFirstShow: 1,
    productQuantity: 2,
  ),

  ProductModel(
    productId: 2,
    productName: "Fish",
    productDescription: "Food Description and price.",
    productImage: "images/product/fish.jpg",
    productPrice: 15,
    productOffer: 1,
    productRate: 3.0,
    productFavourite: 0,
    productFirstShow: 1,
    productQuantity: 10,
  ),
  ProductModel(
    productId: 4,
    productName: "Pizza",
    productDescription: "Food Description and price.",
    productImage: "images/product/pizza.jpg",
    productPrice: 25,
    productOffer: 0,
    productRate: 1.0,
    productFavourite: 0,
    productFirstShow: 1,
    productQuantity: 15,
  ),
  
];

// var user