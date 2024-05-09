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

Future<dynamic> decrementStock(
  dynamic obj,
  int billNo,
) async {
  // Add your function code here!
  List<dynamic> itemList;
  List<dynamic> productCart = FFAppState().productCart;

  if (productCart.isNotEmpty) {
    var index = productCart.indexOf(obj);
    if (productCart[index]["reqStock"] > 1) {
      productCart[index]["reqStock"]--;
      productCart[index]["totalStock"] =
          productCart[index]["currentStock"] + productCart[index]["reqStock"];
    } else if (productCart[index]["reqStock"] <= 1) {
      var index = productCart.indexOf(obj);
      productCart.removeAt(index);
    }
    print(productCart);

    FFAppState().productCart = productCart;
  }
  return productCart;
}
