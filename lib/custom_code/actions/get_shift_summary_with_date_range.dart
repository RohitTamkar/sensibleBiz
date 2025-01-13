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

Future<dynamic> getShiftSummaryWithDateRange(List<dynamic> data) async {
  // Add your function code here!
  //dynamic json = {};

  dynamic json = {
    "advanceAmtTotal": 0,
    "billCount": 0,
    "cashSale": 0,
    "creditSale": 0,
    "customerReceiveAmtTotal": 0,
    "dayId": "",
    "deviceId": "",
    "digitalSale": 0,
    "discount": 0,
    "endTime": "",
    "extraCharges": 0,
    "id": "",
    "inActive": false,
    "lastBillNo": 0,
    "lastBillTime": "",
    "openingAmt": 0,
    "paymentJson": "",
    "productSale": 0,
    "receiveAmtTotal": 0,
    "refundAmount": 0,
    "roundOff": 0,
    "shiftNo": 0,
    "startTime": "",
    "subTotalBill": 0,
    "tax": 0,
    "totalSale": 0,
    "userId": ""
  };

  // for (int i = 0; i < data[i].length; i++) {
  //   json.advanceAmtTotal = json.advanceAmtTotal + data[i][i]["advanceAmtTotal"];
  //   json.billCount = json.billCount + data[i]["billCount"];
  //   json.cashSale = json.cashSale + data[i]["cashSale"];
  //   json.creditSale = json.creditSale + data[i]["creditSale"];
  //   json.customerReceiveAmtTotal =
  //       json.customerReceiveAmtTotal + data[i]["customerReceiveAmtTotal"];
  //   json.dayId = json.dayId + data[i]["dayId"];
  //   json.deviceId = json.deviceId + data[i]["deviceId"];
  //   json.digitalSale = json.digitalSale + data[i]["digitalSale"];
  //   json.discount = json.discount + data[i]["discount"];
  //   json.endTime = json.endTime + data[i]["endTime"];
  //   json.extraCharges = json.extraCharges + data[i]["extraCharges"];
  //   json.id = json.id + data[i]["id"];
  //   json.inActive = json.inActive + data[i]["inActive"];
  //   json.lastBillNo = json.lastBillNo + data[i]["lastBillNo"];
  //   json.lastBillTime = json.lastBillTime + data[i]["lastBillTime"];
  //   json.openingAmt = json.openingAmt + data[i]["openingAmt"];
  //   json.paymentJson = json.paymentJson + data[i]["paymentJson"];
  //   json.productSale = json.productSale + data[i]["productSale"];
  //   json.receiveAmtTotal = json.receiveAmtTotal + data[i]["receiveAmtTotal"];
  //   json.refundAmount = json.refundAmount + data[i]["refundAmount"];
  //   json.roundOff = json.roundOff + data[i]["roundOff"];
  //   json.shiftNo = json.shiftNo + data[i]["shiftNo"];
  //   json.startTime = json.startTime + data[i]["startTime"];
  //   json.subTotalBill = json.subTotalBill + data[i]["subTotalBill"];
  //   json.tax = json.tax + data[i]["tax"];
  //   json.totalSale = json.totalSale + data[i]["totalSale"];
  //   json.userId = json.userId + data[i]["userId"];
  // }
  // print(json);
  for (var record in data) {
    json["advanceAmtTotal"] += record["advanceAmtTotal"] ?? 0;
    json["billCount"] += record["billCount"] ?? 0;
    json["cashSale"] += record["cashSale"] ?? 0;
    json["creditSale"] += record["creditSale"] ?? 0;
    json["customerReceiveAmtTotal"] += record["customerReceiveAmtTotal"] ?? 0;
    json["dayId"] = record["dayId"] ?? json["dayId"];
    json["deviceId"] = record["deviceId"] ?? json["deviceId"];
    json["digitalSale"] += record["digitalSale"] ?? 0;
    json["discount"] += record["discount"] ?? 0;
    json["endTime"] = record["endTime"] ?? json["endTime"];
    json["extraCharges"] += record["extraCharges"] ?? 0;
    json["id"] = record["id"] ?? json["id"];
    json["inActive"] = record["inActive"] ?? json["inActive"];
    json["lastBillNo"] = record["lastBillNo"] ?? json["lastBillNo"];
    json["lastBillTime"] = record["lastBillTime"] ?? json["lastBillTime"];
    json["openingAmt"] += record["openingAmt"] ?? 0;
    json["paymentJson"] = record["paymentJson"] ?? json["paymentJson"];
    // json["productSale"] += record["productSale"] ?? 0;
    json["receiveAmtTotal"] += record["receiveAmtTotal"] ?? 0;
    json["refundAmount"] += record["refundAmount"] ?? 0;
    json["roundOff"] += record["roundOff"] ?? 0;
    json["shiftNo"] += record["shiftNo"] ?? 0;
    json["startTime"] = record["startTime"] ?? json["startTime"];
    json["subTotalBill"] += record["subTotalBill"] ?? 0;
    json["tax"] += record["tax"] ?? 0;
    json["totalSale"] += record["totalSale"] ?? 0;
    json["userId"] = record["userId"] ?? json["userId"];
  }
  return json;
}
