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

int getUnitTypes(String? unittype) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  if (unittype != null) {
    switch (unittype.toUpperCase()) {
      case "KILOGRAM":
        return 0;
      case "LITER":
        return 1;
      case "NUMBER":
        return 2;
      case "MILLILITRE":
        return 3;
      case "BOX":
        return 4;
      case "TIN":
        return 5;
      case "JAR":
        return 6;
      case "BOTTLE":
        return 7;
      case "GRAM":
        return 8;
      case "METER":
        return 9;
      case "DOZEN":
        return 10;
      case "BAG":
        return 11;
      case "PIECE":
        return 12;
    }
  }
  // Default value if the provided unittype is not found
  return -1;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
