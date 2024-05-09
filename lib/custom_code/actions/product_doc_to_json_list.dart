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

Future<List<dynamic>> productDocToJsonList(List<ProductRecord> docs) async {
  // Add your function code here!

  List<dynamic> list = [];
  for (int i = 0; i < docs.length; i++) {
    list.add({
      "id": docs[i].reference.id,
      "name": docs[i].name,
      "ref": docs[i].reference,
      "priceTable": docs[i].priceTable
    });
  }
  return list;
}
