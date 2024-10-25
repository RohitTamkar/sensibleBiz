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

Future<List<MultipliersListStruct>> mrpUpdate(
  double mrpPrice,
  String? gstPer,
  String outletId,
) async {
  // Add your function code here!
  List<MultipliersListStruct> returnList = [];
  List<MultipliersListStruct> list = FFAppState().multiCounterOutletList;
  MultipliersListStruct struct = MultipliersListStruct();

  for (int j = 0; j < list.length; j++) {
    print("outletId");
    print(outletId);
    if (list[j].outletName == outletId) {
      print(list[j].sPrice);
      print(list[j].mrp);
      list[j].sPrice = getMrpAndSPriceforMultipleOutlets(
          mrpPrice.toString(), gstPer, "SP", 1.0);
      list[j].mrp = getMrpAndSPriceforMultipleOutlets(
          mrpPrice.toString(), gstPer, "MRP", 1.0);

      int index = FFAppState().multiCounterOutletList.indexOf(list[j]);
      if (index != -1) {
        FFAppState().multiCounterOutletList[index].sPrice =
            getMrpAndSPriceforMultipleOutlets(
                mrpPrice.toString(), gstPer, "SP", 1.0);
        FFAppState().multiCounterOutletList[index].mrp =
            getMrpAndSPriceforMultipleOutlets(
                mrpPrice.toString(), gstPer, "MRP", 1.0);
      }
    }
  }
  print(FFAppState().multiCounterOutletList);

  return FFAppState().multiCounterOutletList;
}
