import 'package:admin_dashboard/screens/accounts/login.dart';
import 'package:admin_dashboard/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class Splash extends StatelessWidget {
  static const String id = 'splash_screen';

  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SplashScreenView(
        navigateRoute:const LoginScreen(),
        //gUserIdValue ==null ? const HomeScreen() : const LoginScreen()  ,
        duration: 5000,
        imageSize: 130,
        imageSrc: "images/admin_dashboard_icon.png",
        text: "Welcome In Our Restaurant Management System",
        textType: TextType.TyperAnimatedText,
        textStyle: const TextStyle(
          fontSize: 30.0,
            color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: primaryColor,
      ),
    );
  }
}
