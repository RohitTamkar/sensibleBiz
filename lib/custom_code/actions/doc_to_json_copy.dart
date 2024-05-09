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

Future<dynamic> docToJsonCopy(
  ProductRecord data,
  double prdPrice,
  double prdQty,
) async {
  // Add your function code here!

  // Add your function code here!
  List<dynamic> prdJson = [];
  double x = prdPrice * prdQty;
  // print("Pr0duct data");
  // print(data);
  if (data != null) {
    prdJson.add({
      "name": data.name,
      "price": data.price,
      "code": data.code,
      'currentStock': data.currentStock,
      'catId': data.category,
      'catTotal': x.toString(),
      'qty': prdQty
    });
  }
  return prdJson[0];
}
