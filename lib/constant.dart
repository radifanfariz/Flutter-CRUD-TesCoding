import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tescodingprojek/app/modules/home/controllers/home_controller.dart';
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

  static void showCupertinoSheet(BuildContext context, {
    required DateTime initialDateTime,
    required void Function(DateTime) onDateTimeChanged,
    required VoidCallback onClicked,
  }) =>
      showCupertinoModalPopup(
          context: context,
          builder: (context) =>
              CupertinoActionSheet(
                actions: [
                  _cupertinoDatePickerDialogStart(initialDateTime, onDateTimeChanged),
                ],
                cancelButton: CupertinoActionSheetAction(
                  onPressed: onClicked,
                  child: const Text("Done"),
                ),
              ));

  static String formatDateTime(String dateTime){
    return dateTime.substring(0,dateTime.indexOf('T'));
  }
}

Widget _cupertinoDatePickerDialogStart(DateTime initialDateTime, void Function(DateTime) onDateTimeChanged) {
  return SizedBox(
    height: 100,
    child: CupertinoDatePicker(
        initialDateTime: initialDateTime,
        maximumYear: DateTime
            .now()
            .year,
        mode: CupertinoDatePickerMode.date,
        onDateTimeChanged: onDateTimeChanged),
  );
}