import 'package:admin_dashboard/screens/category/category.dart';
import 'package:admin_dashboard/screens/drawer/drawer_screen.dart';
import 'package:admin_dashboard/screens/users/users.dart';
import 'package:admin_dashboard/shared/colors.dart';
import 'package:admin_dashboard/shared/widgets/home_widgets/home_screen_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text('Restaurant Management'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      endDrawer: const DrawerScreen(),

      body: LayoutBuilder(
        builder: (context, constraints)
        {
          if(constraints.minWidth.toInt() == 560){

            return ListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                 HomeWidget(
                icon: Icons.group,
                text: 'Users',
                iconColor: primaryColor,
                onTapFunction: (){
                  Navigator.pushNamed(context, UsersScreen.id);
                },
              ),

               HomeWidget(
                icon: Icons.category,
                text: 'Categories',
                iconColor: primaryColor,
                onTapFunction: (){
                  Navigator.pushNamed(context, CategoryScreen.id);
                },
              ),

               HomeWidget(
                icon: Icons.fastfood,
                text: 'Products',
                iconColor: primaryColor,
                  onTapFunction: (){},
              ),


               HomeWidget(
                icon: Icons.message,
                text: 'Orders',
                iconColor: primaryColor,
                 onTapFunction: (){},
              ),

              HomeWidget(
                icon: Icons.notifications,
                text: 'Notifications',
                iconColor: primaryColor,
                 onTapFunction: (){},
              ),


               HomeWidget(
                icon: Icons.access_alarm,
                text: 'Orders in progress',
                iconColor: primaryColor,
                 onTapFunction: (){},
              ),

              ],
            );

          }

        return GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10.0),
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.8),
        children: <Widget>[

            HomeWidget(
                icon: Icons.group,
                text: 'Users',
                iconColor: primaryColor,
                onTapFunction: (){
                  Navigator.pushNamed(context, UsersScreen.id);
                },
              ),

               HomeWidget(
                icon: Icons.category,
                text: 'Categories',
                iconColor: primaryColor,
                onTapFunction: (){
                  Navigator.pushNamed(context, CategoryScreen.id);
                },
              ),

               HomeWidget(
                icon: Icons.fastfood,
                text: 'Products',
                iconColor: primaryColor,
                  onTapFunction: (){},
              ),


               HomeWidget(
                icon: Icons.message,
                text: 'Orders',
                iconColor: primaryColor,
                 onTapFunction: (){},
              ),

              HomeWidget(
                icon: Icons.notifications,
                text: 'Notifications',
                iconColor: primaryColor,
                 onTapFunction: (){},
              ),


               HomeWidget(
                icon: Icons.access_alarm,
                text: 'Orders in progress',
                iconColor: primaryColor,
                 onTapFunction: (){},
              ),

        ],
        );
        },
      ),
      
    //   ListView(
    //     children: [
    //       Row(
    //         children: [
    //           HomeWidget(
    //             icon: Icons.group,
    //             text: 'Users',
    //             iconColor: primaryColor,
    //             onTapFunction: (){
    //               Navigator.pushNamed(context, UsersScreen.id);
    //             },
    //           ),
    //           HomeWidget(
    //             icon: Icons.category,
    //             text: 'Categories',
    //             iconColor: primaryColor,
    //             onTapFunction: (){
    //               Navigator.pushNamed(context, CategoryScreen.id);
    //             },
    //           ),
    //         ],
    //       ),
    //       Row(
    //         children: [
    //             HomeWidget(
    //             icon: Icons.fastfood,
    //             text: 'Products',
    //             iconColor: primaryColor,
    //               onTapFunction: (){},
    //           ),
    //            HomeWidget(
    //             icon: Icons.message,
    //             text: 'Orders',
    //             iconColor: primaryColor,
    //              onTapFunction: (){},
    //           ),
    //         ],
    //       ),
    //       Row(
    //         children: [
    //            HomeWidget(
    //             icon: Icons.notifications,
    //             text: 'Notifications',
    //             iconColor: primaryColor,
    //              onTapFunction: (){},
    //           ),
    //            HomeWidget(
    //             icon: Icons.access_alarm,
    //             text: 'Orders in progress',
    //             iconColor: primaryColor,
    //              onTapFunction: (){},
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
    );
  }
}

