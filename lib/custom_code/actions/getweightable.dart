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

bool getweightable(String? unittype) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  if (unittype != null) {
    switch (unittype.toLowerCase()) {
      case "yes":
        return true;
      case "no":
        return false;
    }
  }
  // Default value if the provided unittype is not found
  return false;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
