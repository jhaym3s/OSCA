import 'package:flutter/material.dart';
import 'package:oscafest/state/products.dart';
import 'package:oscafest/state/products_provider.dart';
import 'package:oscafest/widgets.dart/grid_items.dart';
import 'package:provider/provider.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({ Key? key, this.categoryPressed}) : super(key: key);
  final String? categoryPressed;

  @override
  _GridWidgetState createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  List<Products>? switchStatement(BuildContext context){
    switch(widget.categoryPressed){
      case "All Products": {
        return Provider.of<ListOfProduct>(context).products;
      }
      case "Sweatshirts":{
        return  Provider.of<ListOfProduct>(context).getSweatshirts;
      }
      case "Furniture":{
        return  Provider.of<ListOfProduct>(context).getFurniture;
      }
      case "Stickers":{
        return  Provider.of<ListOfProduct>(context).getStickers;
      }
      case "Bags":{
        return  Provider.of<ListOfProduct>(context).getBags;
      }
      case "T-Shirts":{
        return  Provider.of<ListOfProduct>(context).getShirts;
      }

    }
  }
  @override
  Widget build(BuildContext context) {
    final products = switchStatement(context);
     return products!.isNotEmpty? GridView.builder(gridDelegate:
   const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,mainAxisSpacing: 5,
        crossAxisSpacing: 7,
        childAspectRatio: 3.7 / 5),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: const GridItem(),
        ),
      itemCount: products.length,
    ):  Center(child:Text("No ${widget.categoryPressed} available at the moment"));
  }
}