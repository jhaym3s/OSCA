import 'package:flutter/material.dart';
import 'package:oscafest/state/products_provider.dart';
import 'package:oscafest/widgets.dart/grid_items.dart';
import 'package:provider/provider.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({ Key? key }) : super(key: key);

  @override
  _GridWidgetState createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  @override
  Widget build(BuildContext context) {
    final products =Provider.of<ListOfProduct>(context).products;
     return GridView.builder(gridDelegate:
   const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,mainAxisSpacing: 5,
        crossAxisSpacing: 7,
        childAspectRatio: 3.7 / 5),
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: const GridItem(),
        ),
      itemCount: products.length,
    );;
  }
}