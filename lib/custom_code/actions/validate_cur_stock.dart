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

Future<bool> validateCurStock(
  dynamic obj,
  double reqstock,
) async {
  // Add your function code here!v
  List<dynamic> itemList;
  List<dynamic> productCart = FFAppState().productCart;
  bool flag = false;

  if (productCart.isNotEmpty) {
    var index = productCart.indexOf(obj);
    double diff = productCart[index]["currentStock"] - reqstock;
    print("****************");
    print(diff);
    if (diff < 0) {
      flag = true;
    } else {
      flag = false;
    }
  }

  return flag;
}
