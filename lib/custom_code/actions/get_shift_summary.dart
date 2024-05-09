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

Future<dynamic> getShiftSummary(
  List<dynamic> data,
  String shiftNo,
) async {
  // Add your function code here!
  List<dynamic> json = [];
  print(data);
  if (data[0]["shiftNo"].toString() != "0") {
    for (int i = 0; i < data.length; i++) {
      // print(shiftNo);
      // print(data[i]["shiftNo"]);

      if (shiftNo.toString() == data[i]["shiftNo"].toString()) {
        json.add(data[i]);
        print(json);
        break;
      }
    }
  } else {
    json.add(data[0]);
  }

  return json[0];
}
