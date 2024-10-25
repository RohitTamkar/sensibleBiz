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

Future<int> getTaxId(int? tax) async {
  // Add your function code here!
  if (tax != null) {
    switch (tax) {
      case 0:
        return 1;
      case 5:
        return 2;
      case 12:
        return 3;
      case 18:
        return 4;
      case 28:
        return 5;
      case 22:
        return 6;
      case 3:
        return 7;
      case 2:
        return 8;
      case 18:
        return 9;
    }
  }
  // Default value if the provided tax is not found
  return -1;
}
