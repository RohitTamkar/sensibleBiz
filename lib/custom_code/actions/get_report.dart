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

import 'index.dart'; // Imports other custom actions
import 'dart:convert';

Future<List<dynamic>> getReport(
  List<dynamic> productsList,
  List<dynamic> catList,
  String type,
) async {
  // Add your function code here!

  List<dynamic> list = [];
  List<dynamic> finalList = [];
  List<dynamic> listOfProducts = [];
  List<dynamic> listOfCategory = [];
  for (int k = 0; k < catList.length; k++) {
    List<dynamic> temp1 = [];
    productsList.forEach((element) {
      //  print(element["catId"]);
      // print(catList[k]["catId"]);
      if (catList[k]["catId"] == element["catId"]) {
        // print("matched");
        catList[k]["catTotal"] =
            catList[k]["catTotal"] + double.parse(element["catTotal"]);
        //  console.log(details[i]);
        temp1.add(element);
      }
    });
    list.add({"category": catList[k], "products": temp1});

    listOfCategory.add(catList[k]);
    // print(list);
  }
  // print("final");
  // listOfProducts.add(productsList);
  finalList.add({"details": list});
//  print(finalList);
  if (type == "product") {
    // print(productsList);
    return productsList;
  } else if (type == "category") {
    // print(listOfCategory);
    return listOfCategory;
  } else {
    return finalList;
  }
}
