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

Future<List<dynamic>> docsToJson(List<ProductRecord> docs) async {
  List<dynamic> list = [];
  for (int i = 0; i < docs.length; i++) {
    list.add({
      "id": docs[i].reference.id,
      "name": docs[i].name,
      "stockable": docs[i].stockable,
      "ref": docs[i].reference,
      "isChanged": false,
      "weightable": docs[i].weighable
    });
  }
  return list;
  // Add your function code here!
}
