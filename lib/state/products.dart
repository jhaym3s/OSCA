import 'package:flutter/material.dart';

class Products with ChangeNotifier{
  final String? imagePath,id,productName,category,description;
  bool isFavourite;
  final double? price;
  final List? sizesAvailable;
  //final String category;

  Products({this.category,this.imagePath,this.isFavourite = false,this.id, this.price, 
  this.productName,this.sizesAvailable,
    this.description = "Lorem ipsum dolor sit amet, consectetur "
        "adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip "
        "ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum "
        "dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non "
        "proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  });

  toggleFavouriteStatus(){
    isFavourite = !isFavourite;
    notifyListeners();
  }
}


