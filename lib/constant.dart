import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConstantClass{
  static const baseUrl = "http://192.168.100.40:3000/api/tescoding/";

  static void showToast(String msg, {Color color = Colors.red}){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
    );
  }

  static String formatDateTime(String dateTime){
    return dateTime.substring(0,dateTime.indexOf('T'));
  }
}