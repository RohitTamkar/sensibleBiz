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

Future<List<MultipliersListStruct>> multiCounterStruct(
  List<OutletRecord> outletList,
  MultipliersRecord doc,
) async {
  List<MultipliersListStruct> returnList = [];
  MultipliersListStruct struct = MultipliersListStruct();

  for (int j = 0; j < doc.outletList.length; j++) {
    struct = createMultipliersListStruct(
        // outletId: outletList[j].id,
        // outletName: outletList[j].name,
        // multiplier: 10,
        // id: (j + 1).toString(),
        outletId: doc.outletList[j].outletId,
        outletName: doc.outletList[j].outletName,
        multiplier: doc.outletList[j].multiplier,
        id: doc.id,
        sPrice: 0,
        mrp: 0);

    returnList.add(struct);
  }
  print(returnList);
  return returnList;

  // Add your function code here!
}
