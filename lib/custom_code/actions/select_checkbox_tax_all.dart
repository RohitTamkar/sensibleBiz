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

// DO NOT REMOVE OR MODIFY THE CODE ABOVE!? of 1

List<dynamic> selectCheckboxTaxAll(
  String checkBoxType,
  bool checkboxStatus,
  List<dynamic> productJsonList,
  int taxIndexActn,
) {
  List<dynamic> resProductList = [];
  List<dynamic> selProductList = [];

  print(productJsonList);

  if (checkBoxType == "ALL") {
    for (int i = 0; i < productJsonList.length; i++) {
      {
        resProductList.add({
          "id": productJsonList[i]["id"],
          "code": productJsonList[i]["code"],
          "name": productJsonList[i]["name"],
          "isChanged": true,
          "ref": productJsonList[i]["ref"],
          //"taxIndexJson": taxIndexActn,
          "taxIndexNum": taxIndexActn,
          "taxIndexStr": getTaxIdEdit2(taxIndexActn),
          "taxindexPas": productJsonList[i]["taxindexPas"],
          "cb": true
        });
      }
      // resProductList[i].stockable = checkboxStatus;
    }
  } else if (checkBoxType == "NONE") {
    for (int i = 0; i < productJsonList.length; i++) {
      resProductList.add({
        "id": productJsonList[i]["id"],
        "name": productJsonList[i]["name"],
        "isChanged": true,
        "ref": productJsonList[i]["ref"],
        "code": productJsonList[i]["code"],
        "taxIndexNum": productJsonList[i]["taxIndexNum"],
        "taxIndexStr": productJsonList[i]["taxindexPas"],
        "taxindexPas": productJsonList[i]["taxindexPas"],
        "cb": false
      });
    }
  }

  // Add your function code here!
  print(
      "--------------------------------------------------------------------------");
  print(selProductList);
  print(
      "--------------------------------------------------------------------------");
  print(resProductList);
  return resProductList;
  // Add your function code here!
}
