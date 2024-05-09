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

Future<List<dynamic>> getShiftDetails(
  String outletId,
  String dayId,
) async {
  List<dynamic> list = [];
  //FFAppState().shiftList = [];

  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('OUTLET')
      .doc(outletId)
      .collection('SHIFT')
      .where('dayId', isEqualTo: dayId)
      .get()
      .then((value) => value);
  if (querySnapshot.size == 0) {
    // print('No matching documents.');
    list.add({"shiftNo": "0", "shiftExists": false});
    // print(list);
    FFAppState().noShift = true;
    //	doneFlag=true;
  } else {
    querySnapshot.docs.forEach((doc) {
      FFAppState().noShift = false;
      // print(doc);
      var data = doc.data() as Map;
      list.add({
        "advanceAmtTotal": doc["advanceAmtTotal"],
        "billCount": doc["billCount"],
        //"billDeletesAmount": doc["billDeletesAmount"],
        // "billDeletesNumber": doc["billDeletesNumber"],
        "cashSale": doc["cashSale"],
        "creditSale": doc["creditSale"],
        "customerReceiveAmtTotal": doc["customerReceiveAmtTotal"],
        "dayId": doc["dayId"],
        "deviceId": doc["deviceId"],
        "digitalSale": doc["digitalSale"],
        "discount": doc["discount"],
        "endTime": doc["endTime"],
        "extraCharges": doc["extraCharges"],
        "id": doc["id"],
        "inActive": doc["inActive"],
        "lastBillNo": doc["lastBillNo"],
        "lastBillTime": doc["lastBillTime"],
        "openingAmt": doc["openingAmt"],
        "paymentJson": doc["paymentJson"],
        "productSale": doc["productSale"],
        "receiveAmtTotal": doc["receiveAmtTotal"],
        "refundAmount": doc["refundAmount"],
        "roundOff": doc["roundOff"],
        "shiftNo": doc["shiftNo"],
        "startTime": doc["startTime"],
        "subTotalBill": doc["subTotalBill"],
        "tax": doc["tax"],
        "totalSale": doc["totalSale"],
        "userId": doc["userId"],
      });
    });
  }
  // print("List");
  // print(list);

  return list;
  // Add your function code here!
}
