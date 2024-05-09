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

Future<List<dynamic>> getCatEiseSale(
  List<dynamic> productsList,
  String outletId,
) async {
  List<dynamic> catDetails = [];
  List<dynamic> list = [];
  List<dynamic> finalList = [];
  List<dynamic> catIdList = [];

  productsList.forEach((prdDoc) {
    // print(prdDoc);
    catIdList.add(prdDoc["catId"]);
    // catIdList.add(prdDoc.category);
  });
  var distinctCatIdList = catIdList.toSet().toList();
  // print(distinctCatIdList);
  // for (int k = 0; k < distinctCatIdList.length; k++) {
  //   FirebaseFirestore.instance
  //       .collection('OUTLET')
  //       .doc(outletId)
  //       .collection('CATEGORY')
  //       .where(FieldPath.documentId, isEqualTo: distinctCatIdList[k])
  //       .get()
  //       .then((QuerySnapshot querySnapshot1) {
  //     querySnapshot1.docs.forEach((doc) {
  //       catDetails
  //           .add({"catId": doc.id, "catName": doc["name"], "catTotal": 0});
  //       print(catDetails);
  //     });
  //   });
  // }
  return distinctCatIdList;
}
