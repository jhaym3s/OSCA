import 'package:flutter/material.dart';
import 'package:oscafest/app_theme.dart';
import 'package:oscafest/screen/grid_screen.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String? categoryPressed = "All Products";
  List<String> category = [
    "All Products",
    "Sweatshirts",
    "Furniture",
    "Stickers",
    "Bags",
    "T-Shirts"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  kPrimaryColor,
      body:SafeArea(child: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children:  [
          GestureDetector(
                  /*
                  onTap: (){
                    setState(() {
                      products..shuffle();
                    });
                  },
                   */
                  child: Image.asset(
                    "assets/images/open_source.png",
                    height: 15,
                  ),
                ),
           Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                     //onTap: ()=>Scaffold.of(context).openDrawer(),
                      child: Image.asset(
                        "assets/images/drawer.png",
                        height: 12,
                      ),
                    ),
                    Stack(
        alignment: Alignment.topRight,
        children: [
          IconButton(icon: const Icon(Icons.shopping_cart,color: kSecondaryColor,), onPressed: (){}),
          const CircleAvatar(backgroundColor: Colors.orangeAccent,radius: 9.2,
            child: Text("0",style: TextStyle(color: Colors.black,fontSize: 10),softWrap: true,),
          ),
        ],
    ),
                  ],
                ),
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: category.length,//categoryItems.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                              categoryPressed = category[index];
                          });
                        },
                        child:  Text(category[index]),
                        style: ElevatedButton.styleFrom(primary: Colors.white24,shape: RoundedRectangleBorder(
                            borderRadius:
                             BorderRadius.circular(30.0)),)
                      ),
                    ),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
                  Expanded(child: GridWidget(categoryPressed: categoryPressed,))
        ],),
      )
      ),
      drawer: const Drawer(
        child: Text("This is a drawer"),
      ),
    );
  }
}