import 'package:flutter/material.dart';
import 'package:oscafest/pages/cart_page.dart';
import 'package:oscafest/pages/pages.dart';
import 'package:oscafest/pages/product_detail.dart';
import 'package:oscafest/state/cart.dart';
import 'package:oscafest/state/products.dart';
import 'package:oscafest/state/products_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
 
         ChangeNotifierProvider(create: (BuildContext context) => Products(),),
         ChangeNotifierProvider(create: (BuildContext context) => ListOfProduct(),),
          ChangeNotifierProvider(create: (BuildContext context) => Cart(),),

      ],
      child: MaterialApp(
        title: 'OSCA-FEST',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange,)
          .copyWith(secondary: Colors.blue)
        ),
        home: const HomePage(),
        routes:  {
          ProductDetailScreen.routeName:(context) => const ProductDetailScreen(),
          CartPage.routename: (context)=> const CartPage(),
          HomePage.routeName:(context) => const HomePage(),

        },
      ),
    );
  }
}


