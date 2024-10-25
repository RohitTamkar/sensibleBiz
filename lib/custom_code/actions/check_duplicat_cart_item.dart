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

Future<List<dynamic>> checkDuplicatCartItem(dynamic obj) async {
  List<dynamic> productCart = FFAppState().productCart;
  print(productCart);
  int count = 0;
  if (productCart.isNotEmpty) {
    bool flag = false;
    for (int i = 0; i < productCart.length; i++) {
      count++;
      if (productCart[i]["code"] == obj["code"]) {
        flag = true;
        break;
      } else {
        if (flag == false && count == productCart.length) {
          FFAppState().productCart.add(obj);
        }
      }
    }
  } else {
    FFAppState().productCart.add(obj);
  }
  print(FFAppState().productCart);

  return FFAppState().productCart;
  // Add your function code here!
}
