import 'package:flutter/material.dart';
import '../../colors.dart';

class DrawerItem extends StatelessWidget {
  final String titleText;
  final IconData drawerIcon;
  final VoidCallback onTapFunction;
  final Color dividerColor;

  // ignore: use_key_in_widget_constructors
  const DrawerItem(
      {required this.titleText,required this.drawerIcon,required this.onTapFunction,required this.dividerColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 10.0),
      child: Column(
        children: [
          InkWell(
            onTap: onTapFunction,
            child: ListTile(
              title: Text(
                titleText,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                drawerIcon,
                color: primaryColor,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 15.0,
              ),
            ),
          ),
          Divider(
            color: dividerColor,
          ),
        ],
      ),
    );
  }
}
