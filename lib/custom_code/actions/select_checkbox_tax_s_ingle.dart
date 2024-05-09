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

List<dynamic> selectCheckboxTaxSIngle(
  bool checkboxStatus,
  List<dynamic> productJsonList,
  int taxIndexActn,
  dynamic prdItem,
) {
  List<dynamic> resProductList = [];
  List<dynamic> selProductList = [];

  print(productJsonList);

  if (checkboxStatus == true) {
    print("Ameya 1");
    for (int i = 0; i < productJsonList.length; i++) {
      {
        if (prdItem["id"] == productJsonList[i]["id"]) {
          resProductList.add({
            "id": productJsonList[i]["id"],
            "name": productJsonList[i]["name"],
            "code": productJsonList[i]["code"],
            "isChanged": true,
            "ref": productJsonList[i]["ref"],
            //"taxIndexJson": taxIndexActn,
            "taxIndexNum": taxIndexActn,
            "taxIndexStr": getTaxIdEdit2(taxIndexActn),
            "taxindexPas": productJsonList[i]["taxindexPas"],
            "cb": true
          });
        } else {
          print("Ameya 2");
          resProductList.add({
            "id": productJsonList[i]["id"],
            "name": productJsonList[i]["name"],
            "code": productJsonList[i]["code"],
            "isChanged": true,
            "ref": productJsonList[i]["ref"],
            //"taxIndexJson": taxIndexActn,
            "taxIndexNum": productJsonList[i]["taxIndexNum"],
            "taxIndexStr": getTaxIdEdit2(productJsonList[i]["taxIndexNum"]),
            "taxindexPas": productJsonList[i]["taxindexPas"],
            "cb": productJsonList[i]["cb"]
          });
        }
      }
      // resProductList[i].stockable = checkboxStatus;
    }
  } else if (checkboxStatus == false) {
    print("Ameya 3");
    for (int i = 0; i < productJsonList.length; i++) {
      if (prdItem["id"] == productJsonList[i]["id"]) {
        resProductList.add({
          "id": productJsonList[i]["id"],
          "name": productJsonList[i]["name"],
          "code": productJsonList[i]["code"],
          "isChanged": true,
          "ref": productJsonList[i]["ref"],
          // "taxIndexJson": productJsonList[i]["taxIndexJson"],
          "taxIndexNum": getTaxIdCopy(productJsonList[i]["taxindexPas"]),
          "taxIndexStr": productJsonList[i]["taxindexPas"],
          "taxindexPas": productJsonList[i]["taxindexPas"],
          "cb": false
        });
      } else {
        print("Ameya 4");
        resProductList.add({
          "id": productJsonList[i]["id"],
          "name": productJsonList[i]["name"],
          "code": productJsonList[i]["code"],
          "isChanged": true,
          "ref": productJsonList[i]["ref"],
          //"taxIndexJson": taxIndexActn,
          "taxIndexNum": productJsonList[i]["taxIndexNum"],
          "taxIndexStr": getTaxIdEdit2(productJsonList[i]["taxIndexNum"]),
          "taxindexPas": productJsonList[i]["taxindexPas"],
          "cb": productJsonList[i]["cb"]
        });
      }
    }
  }

  // Add your function code here!
  print(
      "--------------------------------------------------------------------------");
  // print(selProductList);
  print(
      "--------------------------------------------------------------------------");
  print(resProductList);
  print(
      "--------------------------------------------------------------------------");
  return resProductList;
  // Add your function code here!
}
