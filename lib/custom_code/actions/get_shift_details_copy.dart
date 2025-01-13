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

Future<List<dynamic>> getShiftDetailsCopy(
  String outletId,
  int startdayId,
  int endDate,
) async {
  // Add your function code here!
  List<dynamic> list = [];

  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(outletId)
      .collection('SHIFT')
      .where('startTime',
          isGreaterThanOrEqualTo:
              startdayId) // Assuming 'startTime' is the date field
      .where('startTime',
          isLessThanOrEqualTo: endDate) // Filtering up to 'endDate'
      .get();

  if (querySnapshot.size == 0) {
    list.add({"shiftNo": "0", "shiftExists": false});
    FFAppState().noShift = true;
  } else {
    querySnapshot.docs.forEach((doc) {
      FFAppState().noShift = false;
      var data = doc.data() as Map<String, dynamic>; // Adjusted the type
      list.add({
        "advanceAmtTotal": data["advanceAmtTotal"],
        "billCount": data["billCount"],
        "cashSale": data["cashSale"],
        "creditSale": data["creditSale"],
        "customerReceiveAmtTotal": data["customerReceiveAmtTotal"],
        "dayId": data["dayId"],
        "deviceId": data["deviceId"],
        "digitalSale": data["digitalSale"],
        "discount": data["discount"],
        "endTime": data["endTime"],
        "extraCharges": data["extraCharges"],
        "id": data["id"],
        "inActive": data["inActive"],
        "lastBillNo": data["lastBillNo"],
        "lastBillTime": data["lastBillTime"],
        "openingAmt": data["openingAmt"],
        "paymentJson": data["paymentJson"],
        "productSale": data["productSale"],
        "receiveAmtTotal": data["receiveAmtTotal"],
        "refundAmount": data["refundAmount"],
        "roundOff": data["roundOff"],
        "shiftNo": data["shiftNo"],
        "startTime": data["startTime"],
        "subTotalBill": data["subTotalBill"],
        "tax": data["tax"],
        "totalSale": data["totalSale"],
        "userId": data["userId"],
      });
    });
  }
  print("list");
  print(list);
  return list;
}
