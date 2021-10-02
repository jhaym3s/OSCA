import 'package:flutter/material.dart';
import 'package:oscafest/state/cart.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  const CartItem({this.title, this.id, this.price, Key? key, this.quantity, this.productId})
      : super(key: key);

  final String? title;
  final String? productId;
  final String? id;
  final double? price;
  final int? quantity;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        child:
            const Icon(
              Icons.delete,
              color: Colors.white,
              size: 30,),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        Provider.of<Cart>(context, listen: false).removeItem(productId!);
      },
      confirmDismiss: (direction) => showDialog(context: context,builder: (context) =>AlertDialog(
        title: const Text("Are you sure?"),
        content: const Text("Do you want to delete the whole product"),
        actions: [
          TextButton(onPressed: (){
          Navigator.of(context).pop(false);
           Scaffold.of(context).hideCurrentSnackBar();
          // Scaffold.of(context).showSnackBar(SnackBar(content: Text("The product weren't deleted"),));
          }, child:const Text("NO")),
          TextButton(onPressed: (){
            // Scaffold.of(context).hideCurrentSnackBar();
            Navigator.of(context).pop(true);
            // Scaffold.of(context).hideCurrentSnackBar();
            // Scaffold.of(context).showSnackBar(SnackBar(content: Text("So you no get money to buy you add am to cart"),));
          }, child:const Text("YES")),
        ],
      ) ),
      child:  Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.purpleAccent,
              child: FittedBox(
                child: Text(
                  "$price",
                  softWrap: true,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              title!,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text("${price! * quantity!}"),
            trailing: Text("$quantity x"),
          ),
        ),
      ),
    );
  }
}