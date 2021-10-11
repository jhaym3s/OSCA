import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:oscafest/app_theme.dart';
import 'package:oscafest/screen/grid_screen.dart';
import 'package:oscafest/state/cart.dart';
import 'package:oscafest/state/products.dart';
import 'package:oscafest/state/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:enum_to_string/enum_to_string.dart';


class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = "product_details";
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String?;
    final product = Provider.of<ListOfProduct>(context).findById(productId);
    final productSizes = product.sizesAvailable;
    final deviceSize = MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context);
    final category =
        EnumToString.convertToString(product.category, camelCase: true);
    int _cartCounter = 0;
    void increment() {
      setState(() {
        _cartCounter++;
      });
    }

    void decrement() {
      setState(() {
        _cartCounter--;
      });
    }

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: deviceSize.height / 1.4,
                child: Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 18),
                          child: CircleAvatar(
                            radius: 35,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              color: kPrimaryColor,
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: productSizes!
                                .map((e) => SizeTag(
                                      size: e,
                                    ))
                                .toList()),
                      )
                    ],
                  ),
                  Expanded(
                      child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50)),
                    child: SizedBox(
                        width: deviceSize.width - 50,
                        height: deviceSize.height / 1.4,
                        child: Hero(
                            tag: product.id!,
                            child: Image.asset(
                              product.imagePath!,
                              height: 500,
                              fit: BoxFit.cover,
                            ))),
                  )),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: increment,
                        icon: const Icon(CupertinoIcons.add),
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 60,
                        height: 50,
                        child: Card(
                          color: kPrimaryColor,
                          child: Center(
                              child: Text(
                            '$_cartCounter',
                            style: const TextStyle(
                                color: kSecondaryColor, fontSize: 26),
                          )),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _cartCounter != 0 ? decrement : null;
                        },
                        icon: const Icon(CupertinoIcons.minus),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>const GridWidget(
                                        //categoryPressed: category,
                                      )),
                            );
                          },
                          child: Text(
                            "# $category",
                            style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(product.productName!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                                Text("\$${product.price!.toStringAsFixed(2)}",style: const TextStyle(fontSize: 32,
                                fontWeight: FontWeight.w700, color: Colors.white))
                      ])
                ],
              ),
              ButtomButtons(deviceSize: deviceSize, cart: cart, product: product)
            ],
          ),
        ),
      ),
    );
  }
}

class ButtomButtons extends StatelessWidget {
  const ButtomButtons({
    Key? key,
    required this.deviceSize,
    required this.cart,
    required this.product,
  }) : super(key: key);

  final Size deviceSize;
  final Cart cart;
  final Products product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(fixedSize:  Size(deviceSize.width - 100, 50),
          primary: Colors.white,
          ),
          onPressed: () {
            cart.addItem(
                product.id!, product.price!, product.productName!);
            final snackBar = SnackBar(
              content: Text("${product.productName} added to cart"),
              duration: const Duration(seconds: 3),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {
                  cart.removeSingleProduct(product.id!);
                
                },
              ),
            );
            Scaffold.of(context).removeCurrentSnackBar(
                reason: SnackBarClosedReason.swipe);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          label: const Text("Add to cart",style: TextStyle(color: kSecondaryColor),),
          icon: const Icon(CupertinoIcons.shopping_cart,color: kSecondaryColor),
        ),
       Card(child: Consumer<Products>(
            builder: (ctx, product, _) => IconButton(
    icon: Icon(
      product.isFavourite ? Icons.favorite : Icons.favorite_border,
    ),
    color: kSecondaryColor,
    onPressed: () {
      product.toggleFavouriteStatus();
    },
            ),
          ),)
      ],
    );
  }
}

class SizeTag extends StatelessWidget {
  const SizeTag({Key? key, this.size}) : super(key: key);

  final String? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
          backgroundColor: kWhite,
          radius: 35,
          child: Text(
            size!,
            style: const TextStyle(color: kSecondaryColor),
          )),
    );
  }
}
