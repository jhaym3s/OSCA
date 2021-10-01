import 'package:flutter/material.dart';
import 'package:oscafest/app_theme.dart';
import 'package:oscafest/pages/product_detail.dart';
import 'package:oscafest/state/products.dart';
import 'package:provider/provider.dart';

class GridItem extends StatelessWidget {
   const GridItem({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context);
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id!);
          },
          child: Hero(
            tag: product.id!,
            child: Image.asset(
              product.imagePath!,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Products>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavourite ? Icons.favorite : Icons.favorite_border,
              ),
              color: kSecondaryColor,
              onPressed: () {
                product.toggleFavouriteStatus();
              },
            ),
          ),
          title: Text(
            product.productName!,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }
}
