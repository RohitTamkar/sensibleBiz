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

Future<List<dynamic>> docsToJsonforTax(List<ProductRecord> docs) async {
  List<dynamic> list = [];
  for (int i = 0; i < docs.length; i++) {
    list.add({
      "id": docs[i].reference.id,
      "name": docs[i].name,
      "cat": docs[i].category,
      "ref": docs[i].reference,
      "code": docs[i].code,
      "taxIndexNum": docs[i].taxIndex,
      "taxIndexStr": getTaxIdEdit2(docs[i].taxIndex),
      "taxindexPas": getTaxIdEdit2(docs[i].taxIndex),
      "isChanged": false,
      "cb": false
    });
  }
  return list;
  // Add your function code here!
}
