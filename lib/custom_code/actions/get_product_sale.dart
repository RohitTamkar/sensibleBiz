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

Future<List<dynamic>> getProductSale(List<dynamic> data) async {
  List<dynamic> list = [];
  List<dynamic> finalList = [];
  List<dynamic> prd = [];
  List<dynamic> prdExtra = [];

  List<dynamic> prdDetails = [];
  List<dynamic> catDetails = [];
  List<String> catIdList = [];
  int count = 0;
  int countMain = 0;
  bool symbolFlag = false;
  for (int i = 0; i < data.length; i++) {
    countMain++;
    var entryList = data[i]["productSale"].entries.toList();
    entryList.forEach((item) {
      // print(item);
      var value1 = item.value;
      var value2 = value1.entries.toList();
      String id = item.key.toString();
      symbolFlag = id.contains(RegExp(r'[_]'));
      if (symbolFlag) {
        prdExtra.add({
          "prdId": item.key.toString(),
          "price": double.parse(value2[0].key),
          "qty": value2[0].value
        });
      } else {
        prd.add({
          "prdId": item.key.toString(),
          "price": double.parse(value2[0].key),
          "qty": value2[0].value
        });
      }
    });
    //   if (countMain == data.length) {
    //     var doc;
    //     for (int i = 0; i < prd.length; i++) {
    //       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
    //           .collection('OUTLET')
    //           .doc(FFAppState().outletId)
    //           .collection('PRODUCT')
    //           .where(FieldPath.documentId, isEqualTo: prd[i]["prdId"])
    //           .get();

    //       querySnapshot.docs.forEach((doc) {
    //         prdDetails.add({
    //           "prdId": prd[i]["prdId"],
    //           "price": prd[i]["price"],
    //           "qty": prd[i]["qty"],
    //           "prdName": doc["name"],
    //           "shortName": doc["shortName"],
    //           "catId": doc["category"],
    //           "catTotal": prd[i]["price"] * prd[i]["qty"],
    //           //"catTotal": price * qty,
    //         });
    //       });
    //     }
    //   }
    // }
  }
  return prd;
}
