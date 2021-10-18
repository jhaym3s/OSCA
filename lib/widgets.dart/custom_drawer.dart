import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oscafest/app_theme.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Stack(children: [
              Container(
                color: kPrimaryColor,
                width: deviceSize.width,
                height: 200,
              ),
              Column(
                children: const [
                   CircleAvatar(
                    backgroundColor: kSecondaryColor,  
                  ),
                ],
              )
            ]),
            const CustomListTile(
              dividerHeight: 1,
              title: "Profile",
              iconData: CupertinoIcons.person,
              id: null,
            ),
            const CustomListTile(
              dividerHeight: 1,
              title: "News",
              iconData: CupertinoIcons.news_solid,
              id: null,
            ),
            const CustomListTile(
              dividerHeight: 1,
              title: "Favorites",
              iconData: CupertinoIcons.heart,
              id: null,
            ),
            const CustomListTile(
              dividerHeight: 1,
              title: "Shop",
              iconData: CupertinoIcons.person,
              id: null,
            ),
            const CustomListTile(
              dividerHeight: 1,
              title: "Logout",
              iconData: Icons.logout ,
              id: null,
            ),
            const CustomListTile(
              dividerHeight: 10,
              title: "Delete account",
              iconData: CupertinoIcons.delete,
              id: null,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({Key? key, this.id, this.title, this.iconData, this.dividerHeight})
      : super(key: key);

  final int? id;
  final String? title;
  final IconData? iconData;
  final double? dividerHeight;
  void _selectOption(int? id, BuildContext ctx) {
    switch (id) {
      case 1:
        //move to perform analysis
        break;

      case 2:
        //move to financial history
            //pushNewScreen(ctx,
            //screen: const PaymentOptionScreen(),
        break;

      case 3:
        //move to profile screen
        break;

      case 4:
        //move to settings
        // Navigator.of(ctx).pushNamed(Routes.settingScreen);
       
        break;

      case 5:
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            _selectOption(id, context);
          },
          leading: IconButton(icon: Icon(iconData), onPressed: () {},
          color:kPrimaryColor),
          title: Text(title!),
        ),
         Divider(height: dividerHeight,)
      ],
    );
  }
}
void _selectOption(int id, BuildContext ctx) {
    switch (id) {
      case 1:
        //move to perform analysis
        break;

      case 2:
        //move to financial history
            //pushNewScreen(ctx,
            //screen: const PaymentOptionScreen(),
        break;

      case 3:
        //move to profile screen
        break;

      case 4:
        //move to settings
        // Navigator.of(ctx).pushNamed(Routes.settingScreen);
       
        break;

      case 5:
        break;
    }
  }
