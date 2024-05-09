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

Future<String> mapCatToPrd(
  ProductRecord prdDoc,
  List<CategoryRecord> catList,
  int inte,
) async {
  // Add your function code here!
  String strId = '';
  int i;
  for (i = 0; i < catList.length; i++) {
    if (catList[i].id == prdDoc.category) {
      strId = catList[i].reference.id;
      // print(prdDoc.category + "    " + prdDoc.name);
      print(strId + "  =  " + catList[i].reference.id);
      // break;
    }
  }
  print(inte);
  return strId;
}
