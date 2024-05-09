// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<String> diffBetweenDates(
  DateTime date1,
  int date2,
) async {
  int result;
  String resString = "";
  DateTime dt2 = DateTime.fromMillisecondsSinceEpoch(date2);

  Duration diff = date1.difference(dt2);
  print(diff.inMinutes);

  if (diff.inSeconds < 60) {
    result = diff.inSeconds;
    resString = result.toString() + " sec ago";
  } else if (diff.inMinutes < 60) {
    result = diff.inMinutes;
    resString = result.toString() + " min ago";
  } else if (diff.inMinutes > 60) {
    result = diff.inHours;
    if (result == 1) {
      resString = result.toString() + " hour ago";
    } else {
      resString = result.toString() + " hours ago";
    }
  } else if (diff.inHours > 24) {
    result = diff.inDays;

    if (result == 1) {
      resString = result.toString() + " day ago";
    } else {
      resString = result.toString() + " days ago";
    }
  }
  return resString;
  // Add your function code here!
}
