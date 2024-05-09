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

//-----------------------------------------------------------------------------------------------------------------------------
Future<List<dynamic>> selectCheckbox(
  String checkBoxType,
  String changeType,
  bool checkboxStatus,
  List<dynamic> productJsonList,
) async {
  List<dynamic> resProductList = [];
  List<dynamic> selProductList = [];

  print(productJsonList);

  if (checkBoxType == "ALL") {
    for (int i = 0; i < productJsonList.length; i++) {
      if (changeType == "stock") {
        resProductList.add({
          "id": productJsonList[i]["id"],
          "stockable": checkboxStatus,
          "name": productJsonList[i]["name"],
          "isChanged": true,
          "ref": productJsonList[i]["ref"],
          "weightable": productJsonList[i]["weightable"]
        });
      } else if (changeType == "weight") {
        resProductList.add({
          "id": productJsonList[i]["id"],
          "stockable": productJsonList[i]["stockable"],
          "name": productJsonList[i]["name"],
          "isChanged": true,
          "ref": productJsonList[i]["ref"],
          "weightable": checkboxStatus
        });
      }

      // resProductList[i].stockable = checkboxStatus;
    }
  } else if (checkBoxType == "NONE") {
    for (int i = 0; i < productJsonList.length; i++) {
      if (changeType == "stock") {
        resProductList.add({
          "id": productJsonList[i]["id"],
          "stockable": checkboxStatus,
          "name": productJsonList[i]["name"],
          "isChanged": true,
          "ref": productJsonList[i]["ref"],
          "weightable": productJsonList[i]["weightable"],
        });
      } else if (changeType == "weight") {
        resProductList.add({
          "id": productJsonList[i]["id"],
          "stockable": productJsonList[i]["stockable"],
          "name": productJsonList[i]["name"],
          "isChanged": true,
          "ref": productJsonList[i]["ref"],
          "weightable": checkboxStatus
        });
      }
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
}
