
// ignore_for_file: avoid_print

import 'dart:io';

const String apiPath = "http://192.168.1.2:80/restaurant/api/"; //192.168.2.42 - localhost
const String imagesPath = "http://192.168.1.2:80/restaurant/images/";

// gUserIdValue => global user id value
String  ? gUserIdValue ;

const String gUserId = "user_id";
const String gUserName = "user_name";
const String gUserEmail = "user_email";
// const String gUserImage = "user_image";

Future<bool> checkConnection()async{
  try{
    final result = await InternetAddress.lookup("google.com");
    if(result.isNotEmpty && result[0].rawAddress.isNotEmpty)
    {
      print("connected");
      return true;
    }else{
      print("No internet connection");
      return false;
    }
  } on SocketException catch(_){
      print("No internet connection");
      return false;
  }
}