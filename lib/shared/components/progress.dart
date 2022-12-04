import 'package:admin_dashboard/shared/colors.dart';
import 'package:flutter/material.dart';

Container circularProgress()
{
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top:10.0),
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(primaryColor) ,
    ),
  );
}


Container linearProgress()
{
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(bottom:10.0),
    child: const LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(primaryColor) ,
    ),
  );
}