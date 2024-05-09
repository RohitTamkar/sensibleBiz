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

Future<dynamic> getDeviceDetails(String serial) async {
  // Add your function code here!
  List<dynamic> list = [];
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection("DEVICE")
      .where("serial", isEqualTo: serial)
      .get()
      .then((value) => value);
  if (querySnapshot.size == 0) {
    print('No matching documents.');
    list.add({
      "id": "0",
      "active": "0",
      "outletId": "0",
      "outletName": "0",
      "branch": "0",
      "loggredIn": "0",
      "deviceExists": false
    });
  } else {
    int len = querySnapshot.docs.length;
    int count = 0;
    querySnapshot.docs.forEach((doc) {
      list.add({
        "id": doc["id"],
        "active": doc["active"],
        "outletId": doc["outletId"],
        "outletName": doc["outletName"],
        "branch": doc["branch"],
        "loggredIn": doc["loggedIn"],
        "deviceExists": true
      });
    });
  }
  return list[0];
}
