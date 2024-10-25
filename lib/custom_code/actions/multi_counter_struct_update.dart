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

Future<List<MultipliersListStruct>> multiCounterStructUpdate(
  double mrpPrice,
  String? gstPer,
) async {
  // Add your function code here!
  List<MultipliersListStruct> returnList = [];
  List<MultipliersListStruct> list = FFAppState().multiCounterOutletList;
  MultipliersListStruct struct = MultipliersListStruct();

  for (int j = 0; j < list.length; j++) {
    struct = createMultipliersListStruct(
      outletId: list[j].outletId,
      outletName: list[j].outletName,
      multiplier: list[j].multiplier,
      id: list[j].id,
      sPrice: getMrpAndSPriceforMultipleOutlets(
          mrpPrice.toString(), gstPer, "SP", list[j].multiplier),
      mrp: getMrpAndSPriceforMultipleOutlets(
          mrpPrice.toString(), gstPer, "MRP", list[j].multiplier),
    );
    print(struct);
    returnList.add(struct);
  }
  print(returnList);
  return returnList;
}
