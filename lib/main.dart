import 'package:admin_dashboard/screens/accounts/login.dart';
import 'package:admin_dashboard/screens/category/add_category_screen.dart';
import 'package:admin_dashboard/screens/category/category.dart';
import 'package:admin_dashboard/screens/category/edit_category_screen.dart';
import 'package:admin_dashboard/screens/drawer/drawer_screen.dart';
import 'package:admin_dashboard/screens/home/home_screen.dart';
import 'package:admin_dashboard/screens/start_screens/splash_screen.dart';
import 'package:admin_dashboard/screens/users/add_users_screen.dart';
import 'package:admin_dashboard/screens/users/users.dart';
import 'package:admin_dashboard/shared/api/config.dart';
import 'package:admin_dashboard/shared/constant.dart';
import 'package:admin_dashboard/shared/provider/loading_provider.dart';
import 'package:admin_dashboard/shared/widgets/category_widgets/category_screen_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'screens/users/edit_users_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  gUserIdValue = prefs.getString(gUserId).toString();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingControl>(
          create: (context)=> LoadingControl(),
          ),
      ],
      child:  const MyApp(),
      )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder
        (
          child,
          maxWidth: MediaQuery.of(context).size.width,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
          ],
        ),
          initialRoute: HomeScreen.id,
      routes: {
        Splash.id : (context)=> const Splash(),
        DrawerScreen.id : (context)=> const DrawerScreen(),
        HomeScreen.id : (context)=> const HomeScreen(),
        LoginScreen.id : (context) => const LoginScreen(),
        CategoryScreen.id: (context)=> const CategoryScreen(),
        CategoryHeader.id : (context)=> const CategoryHeader(),
        EditCategory.id : (context)=>  const EditCategory(),
        AddCategory.id : (context)=>const AddCategory(),
        UsersScreen.id : (context) => const UsersScreen(),
        AddUser.id : (context) => const AddUser(),
        EditUser.id : (context) =>  const EditUser(),
      },
    );
  }
}
