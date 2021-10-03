import 'package:flutter/material.dart';
import 'package:oscafest/screen/cart_screen.dart';
import 'package:oscafest/state/cart.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({Key? key,})
      : super(key: key);
  static const routename = "/cartpage";
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(children: [
        Card(
          margin: const EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Chip(
                  label: Text(
                    cart.totalAmount.toStringAsFixed(2),
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                  elevation: 6,
                ),
               //OrderButton(cart: cart,),
              ],
            ),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => CartScreen(
              title: cart.items.values.toList()[index].title,
              productId: cart.items.keys.toList()[index],
              id: cart.items.values.toList()[index].id,
              price: cart.items.values.toList()[index].price,
              quantity: cart.items.values.toList()[index].quantity),
          itemCount: cart.itemCount,
        )),
      ]),
    );
  }
}