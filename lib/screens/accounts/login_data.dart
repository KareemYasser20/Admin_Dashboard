import 'dart:convert';
import 'package:admin_dashboard/screens/home/home_screen.dart';
import 'package:admin_dashboard/shared/api/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:admin_dashboard/shared/constant.dart';

Future<bool> loginUsers(
    String userEmail, String userPassword, BuildContext context) async {
  Uri url = Uri.parse("${apiPath}users/login.php?user_pass=$userPassword&user_email=$userEmail&token=$token");

  http.Response response = await http.get(url);
  if (json.decode(response.body)["code"] == "200") {
    Map array = json.decode(response.body)["message"];
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(gUserId, array["user_id"]);
    preferences.setString(gUserName, array["user_name"]);
    preferences.setString(gUserEmail, array["user_email"]);
    // preferences.setString(gUserImage, array["user_image"]);

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, HomeScreen.id);

    print("Success to login");
    return true;
  } else {
    print("Fail to login");
    return false;
  }
}
