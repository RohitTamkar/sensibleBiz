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

dynamic newCustomAction(ProductRecord doc) {
  /// MODIFY CODE ONLY BELOW THIS LINE
  dynamic json;
  json = {
    'id': doc.id,
    'name': doc.name,
    'price': doc.price,
    'category': doc.category,
  };
  //FFAppState().prdJson.add(json);
  print(json);
  // convert document to json
  return {
    'id': doc.id,
    'name': doc.name,
    'price': doc.price,
    'category': doc.category,
  };

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
