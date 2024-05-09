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

// Add your function code here!
String getTaxIdEdit(int? tax) {
  if (tax != null) {
    switch (tax.toInt()) {
      case 1:
        return "GST0";
      case 2:
        return "GST5";
      case 3:
        return "GST12";
      case 4:
        return "GST18";
      case 5:
        return "GST28";
      case 6:
        return "VAT22";
      case 7:
        return "GST3";
      case 8:
        return "GST2";
    }
  }
  // Default value if the provided tax is not found
  return "Gst0";
}
