import 'package:flutter/material.dart';
import 'package:oscafest/app_theme.dart';
import 'package:oscafest/state/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const routeName = "product_details";
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String?;
    final product = Provider.of<ListOfProduct>(context).findById(productId);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
              child:Column(
          children:[
            Row(
              children:  [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Padding(
                            padding:  EdgeInsets.all(8.0),
                            child:  CircleAvatar(
                              radius: 35,
                              child: Icon(Icons.arrow_back_ios_new, color: kPrimaryColor,),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        SizeTag(),
                      ],
                    )
                   // const SizeTag(),
                   // const SizeTag(),
                  ],
                ),
                Expanded( 
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50)),
                    child: SizedBox(
                      height: deviceSize.height/1.4,
                      child: Hero(tag: product.id!, child: Image.asset(product.imagePath!,height: 500,fit: BoxFit.cover,))),
                  )),
              ]
            )
          ],
              ),
            ),
        ),
    );
  }
}

class SizeTag extends StatefulWidget {
  const SizeTag({ Key? key }) : super(key: key);

  @override
  _SizeTagState createState() => _SizeTagState();
}

class _SizeTagState extends State<SizeTag> {
  @override
  Widget build(BuildContext context) {
    return   const Padding(
                        padding:   EdgeInsets.all(8.0),
                        child:  CircleAvatar(
                          backgroundColor: kWhite,
                          radius: 35,
                          child:  Text("M", style: TextStyle(color: kSecondaryColor),)
                        ),
                      );
  }
}