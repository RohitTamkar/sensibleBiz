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

import 'package:collection/collection.dart';

Future<List<ProductRecord>> sortProducts(
    List<ProductRecord> allPrd, String switchCase, String cat) async {
  switch (switchCase) {
    case 'code':
      allPrd.sort((a, b) => a.code.compareTo(b.code));
      break;

    case 'nameAZ':
      allPrd.sort((a, b) => a.name.compareTo(b.name));
      break;

    case 'date':
      allPrd.sort((a, b) => a.dateTme!.compareTo(b.dateTme!));
      break;
    default:
      break;
    // Add your function code here!
  }
  print(allPrd);
  FFAppState().allProductdoc = allPrd.cast<ProductListStruct>();
  return allPrd;
}
