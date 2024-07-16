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

Future<List<dynamic>> incrementStock(
  dynamic obj,
  int billNo,
) async {
  // Add your function code here!

  List<dynamic> itemList;
  List<dynamic> productCart = FFAppState().productCart;

  if (productCart.isNotEmpty) {
    var index = productCart.indexOf(obj);
    //productCart[index]["reqStock"]++;
    productCart[index]["totalStock"] =
        productCart[index]["currentStock"] + productCart[index]["reqStock"];

    print(productCart);

    FFAppState().productCart = productCart;
  }

  return productCart;
}
