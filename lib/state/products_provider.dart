import 'package:flutter/widgets.dart';
import 'package:oscafest/state/products.dart';


class ListOfProduct with ChangeNotifier{

  final List<Products> _products = [
    Products(
    imagePath: "assets/images/sca.jpg",
    productName:"SCA sweatshirt",
    category: "Sweatshirts",
    id: "a1",
    sizesAvailable: ["S", "M","L","XL","XXL"],
    price:99.0),
    Products(
      imagePath: "assets/images/OS_sweatshirt3.jpg",
      productName: "Yellow Osca fest sweatshirt",
      category: "Sweatshirts",
      sizesAvailable: ["L","XL","XXL"],
      id: "a2",
      price:45.34),
    Products(
      imagePath: "assets/images/OS_sweatshirt1.jpg",
      productName: "Osca fest",
      category: "Sweatshirts",
      id: "a3",
      sizesAvailable: [ "M","L","XL","XXL"],
      price:20.34),
    Products(
      imagePath: "assets/images/OS_sweatshirt1.jpg",
      productName: "Osca fest",
      category: "Sweatshirts",
      id: "a4", 
      sizesAvailable: ["S", "M","L","XL"],
      price:15.34),
    Products(
      imagePath: "assets/images/OS_polo1.jpg",
      productName: "Osca fest",
      category: "Open source polo",
      id: "a5",
      sizesAvailable: ["S", "M","L","XL","XXL"],
      price:49.34),
    Products(
      imagePath: "assets/images/OS_sweatshirt1.jpg",
      productName: "Osca fest",
      category: "Sweatshirts",
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
    return _products.where((element) => element.category =="Sweatshirts").toList();
    //get only sweatshirt
  }
  List<Products> get getFurniture {
    return _products.where((element) => element.category =="Furniture").toList();
    //get only sweatshirt
  }
  List<Products> get getStickers {
    return _products.where((element) => element.category =="Stickers").toList();
    //get only sweatshirt
  }
  List<Products> get getBags{
    return _products.where((element) => element.category =="Bags").toList();
    //get only sweatshirt
  }
  List<Products> get getShirts{
    return _products.where((element) => element.category =="Shirts").toList();
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
  /*
  Products findByCategory(String category){
    List<Products> categoryProduct = [];
    if(_products.any((element) => element.category.contains(category))){
      _products = categoryProduct;
    }
    return categoryProduct;
  }
   */



}
