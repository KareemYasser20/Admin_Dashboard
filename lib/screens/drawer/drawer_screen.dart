import 'package:admin_dashboard/screens/accounts/login.dart';
import 'package:admin_dashboard/shared/api/config.dart';
import 'package:admin_dashboard/shared/colors.dart';
import 'package:admin_dashboard/shared/constant.dart';
import 'package:admin_dashboard/shared/widgets/drawer_widgets/drawer_item_widget.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  static const String id = 'drawer_screen';

  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              prefs.getString("user_name").toString(),
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            accountEmail: Text(
              prefs.getString("user_email").toString(),
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
            currentAccountPicture: GestureDetector(
              child: const CircleAvatar(
                backgroundColor: primaryColor,
                // ignore: todo
                // TODO: put login user photo here 
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
            ),
          ),
          ExpansionTile(
            tilePadding: const EdgeInsets.only(left: 20.0, right: 22.0),
            leading: const Icon(
              Icons.person,
              color: primaryColor,
            ),
            title: const Text(
              "Profile",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),
            children: [
              DrawerItem(
                titleText: "Edit Profile",
                drawerIcon: Icons.settings,
                onTapFunction: () {
                  // Navigator.pushNamed(context, MyAccountScreen.id);
                }, dividerColor:  Colors.grey.shade500,
              ),
              DrawerItem(
                titleText: "Edit Password",
                dividerColor: Colors.white,
                drawerIcon: Icons.lock_open,
                onTapFunction: () {
                  // Navigator.pushNamed(context, ChangePasswordScreen.id);
                },
              ),
            ],
          ),
          Divider(
            color: Colors.grey.shade500,
          ),
          DrawerItem(
            titleText: "Categories List",
            dividerColor:  Colors.grey.shade500,
            drawerIcon: Icons.shopping_bag_outlined,
            onTapFunction: () {
              // Navigator.pushNamed(context, );
            },
          ),
          DrawerItem(
            titleText: "Product List",
            drawerIcon: Icons.home,
            dividerColor:  Colors.grey.shade500,
            onTapFunction: (){
              // Navigator.pushNamed(context, );
            },
          ),
          DrawerItem(
            titleText: "Customer Orders",
            drawerIcon: Icons.favorite,
            dividerColor:  Colors.grey.shade500,
            onTapFunction: () {
              // Navigator.pushNamed(context, );
            },
          ),
          DrawerItem(
            titleText: "Track orders",
            dividerColor:  Colors.grey.shade500,
            drawerIcon: Icons.drive_eta,
            onTapFunction: () {
              // Navigator.pushNamed(context, );
            },
          ),
       
       DrawerItem(
            titleText: "Logout",
         dividerColor:  Colors.grey.shade500,
            drawerIcon: Icons.logout,
            onTapFunction: () {
              prefs.remove(gUserId);
              prefs.remove(gUserName);
              prefs.remove(gUserEmail);
              // prefs.remove(gUserImage);
              prefs.clear();

              Navigator.pushReplacementNamed(context, LoginScreen.id);
            },
          ),
       
        ],
      ),
    );
  }
}