import 'dart:convert';
import 'package:admin_dashboard/screens/users/users.dart';
import 'package:admin_dashboard/shared/api/config.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:admin_dashboard/shared/constant.dart';
import 'package:toast/toast.dart';

Future<bool> createUser(String userName, String userEmail, String userPassword,
    bool userActive, String userNote, BuildContext context) async {
      //apiPath + "users/insert_user.php?token=" + token;
  Uri url = ("${apiPath}users/insert_user.php?token=$token") as Uri;

  Map userData = {
    "user_name": userName,
    "user_email": userEmail,
    "user_pass": userPassword,
    "user_active": userActive ? "1" : "0",
    "user_note": userNote,
  };

  http.Response response = await http.post(url, body: userData);
  if (json.decode(response.body)["code"] == "200") {
    // ignore: use_build_context_synchronously
    Toast.show("Add user successfully.",
        //context,
        duration: Toast.lengthLong, gravity: Toast.bottom);

    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, UsersScreen.id);
    // ignore: avoid_print
    print("insert user successfully");

    return true;
  } else {
    // ignore: avoid_print
    print("Fail to login");
    return false;
  }
}

Future<List?> getUsersData (int count , String searchText) async{
  Uri url = Uri.parse("${apiPath}users/readuser.php?txtsearch=$searchText&start=$count&end=40&token=$token");

   http.Response response = await http.get(url);
   if (json.decode(response.body)["code"] == "200") {

    List userArray = (json.decode(response.body)["message"]);
    return userArray;

  } else {
    // ignore: avoid_print
    print("Fail to load user data");
    return null;
  }


}
