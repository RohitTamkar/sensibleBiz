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

Future<List<dynamic>> selectCheckboxCopy(
  List<dynamic> prdJson,
  dynamic prdItem,
  bool checkboxStatus,
  String? type,
) async {
  List<dynamic> resProductList = [];
  List<dynamic> selProductList = [];

  print(prdItem);
  for (int i = 0; i < prdJson.length; i++) {
    if (prdItem["id"] == prdJson[i]["id"]) {
      if (type == "stock") {
        resProductList.add({
          "id": prdJson[i]["id"],
          "stockable": checkboxStatus,
          "name": prdJson[i]["name"],
          "isChanged": true,
          "ref": prdJson[i]["ref"],
          "weightable": prdJson[i]["weightable"]
        });
        selProductList.add({
          "id": prdJson[i]["id"],
          "stockable": checkboxStatus,
          "name": prdJson[i]["name"],
          "isChanged": true,
          "ref": prdJson[i]["ref"],
          "weightable": prdJson[i]["weightable"]
        });
      } else if (type == "weight") {
        resProductList.add({
          "id": prdJson[i]["id"],
          "stockable": prdJson[i]["stockable"],
          "name": prdJson[i]["name"],
          "isChanged": true,
          "ref": prdJson[i]["ref"],
          "weightable": checkboxStatus
        });
        selProductList.add({
          "id": prdJson[i]["id"],
          "stockable": prdJson[i]["stockable"],
          "name": prdJson[i]["name"],
          "isChanged": true,
          "ref": prdJson[i]["ref"],
          "weightable": checkboxStatus
        });
      }
    } else {
      resProductList.add({
        "id": prdJson[i]["id"],
        "stockable": prdJson[i]["stockable"],
        "name": prdJson[i]["name"],
        "isChanged": false,
        "ref": prdJson[i]["ref"],
        "weightable": prdJson[i]["weightable"]
      });
    }
  }

  //  productList[index].stockable = checkboxStatus;

  // Add your function code here!
  print(selProductList);
  print(resProductList);
  return resProductList;
}
