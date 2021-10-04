import 'package:flutter/widgets.dart';
import 'package:oscafest/state/products.dart';


class ListOfProduct with ChangeNotifier{

  final List<Products> _products = [
    Products(
    imagePath: "assets/images/sca.jpg",
    productName:"SCA sweatshirt",
    category: Category.sweatShirt,
    id: "a1",
    sizesAvailable: ["S", "M","L","XL","XXL"],
    price:99.0),
    Products(
      imagePath: "assets/images/OS_sweatshirt3.jpg",
      productName: "Yellow Osca fest sweatshirt",
      category: Category.sweatShirt,
      sizesAvailable: ["L","XL","XXL"],
      id: "a2",
      price:45.34),
    Products(
      imagePath: "assets/images/OS_sweatshirt1.jpg",
      productName: "Osca fest",
      category: Category.sweatShirt,
      id: "a3",
      sizesAvailable: [ "M","L","XL","XXL"],
      price:20.34),
    Products(
      imagePath: "assets/images/OS_sweatshirt1.jpg",
      productName: "Osca fest",
      category: Category.sweatShirt,
      id: "a4", 
      sizesAvailable: ["S", "M","L","XL"],
      price:15.34),
    Products(
      imagePath: "assets/images/OS_polo1.jpg",
      productName: "Osca fest",
      category: Category.tShirts,
      id: "a5",
      sizesAvailable: ["M","L","XL","XXL"],
      price:49.34),
    Products(
      imagePath: "assets/images/OS_sweatshirt1.jpg",
      productName: "Osca fest",
      category: Category.sweatShirt,
      id: "a6",
      sizesAvailable: [ "M","L"],
      price:415.34),

  ];

  /*
  Products findByCategory(String category){
    return _products.any((element) => element.category = category);
  }

   */
  List<Products> get products {
    return [..._products];
    // getting all products
  }
  List<Products> get getSweatshirts {
    return _products.where((element) => element.category ==Category.sweatShirt).toList();
    //get only sweatshirt
  }
  List<Products> get getFurniture {
    return _products.where((element) => element.category ==Category.furniture).toList();
    //get only sweatshirt
  }
  List<Products> get getStickers {
    return _products.where((element) => element.category ==Category.stickers).toList();
    //get only sweatshirt
  }
  List<Products> get getBags{
    return _products.where((element) => element.category ==Category.bags).toList();
    //get only sweatshirt
  }
  List<Products> get getShirts{
    return _products.where((element) => element.category == Category.tShirts).toList();
    //get only sweatshirt
  }
  List<Products> get getFavorites{
    return _products.where((element) => element.isFavourite).toList();
    //gets favorites back
  }
  Products findById(String? productId){
    return _products.firstWhere((element) => element.id == productId);
    // for the product detail page
  }
  



}
