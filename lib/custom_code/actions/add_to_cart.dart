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

Future<dynamic> addToCart(List<dynamic> json) async {
  // Add y
  // Add your function code here!
  List<dynamic> list = [];
  list = FFAppState().selectedProductList;
  print(json);
  List<ProductListStruct> returnList = [];
  ProductListStruct struct = ProductListStruct();

  for (int j = 0; j < json.length; j++) {
    struct = createProductListStruct(
      name: json[j]["name"],
      code: json[j]["code"],
      reqStock: json[j]["reqStock"],
      currentStock: json[j]["currentStock"],
      id: json[j]["id"],
    );

    returnList.add(struct);
  }
  FFAppState().selectedPrdDataMap = returnList;

  // if (list.length == 0) {
  list.add({
    "id": "1",
    "monthId": "09-2023",
    "dayId": getDayId(DateTime.now()),
    "prdList": json,
    "prdListSturct": returnList,
  });
  // } else {
  //  print("update");
  // }
  return list[0];
}
