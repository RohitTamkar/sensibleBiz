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

int getTaxIdCopy(String? tax) {
  // Add your function code here!
  if (tax != null) {
    switch (tax.toUpperCase()) {
      case "GST0":
        return 1;
      case "GST5":
        return 2;
      case "GST12":
        return 3;
      case "GST18":
        return 4;
      case "GST28":
        return 5;
      case "VAT22":
        return 6;
      case "VAT10":
        return 7;
      case "GST3":
        return 8;
      case "GST2":
        return 9;
      case "IGST18":
        return 10;
    }
  }
  // Default value if the provided tax is not found
  return -1;
}
