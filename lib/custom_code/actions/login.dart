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

import 'index.dart'; // Imports other custom actions

Future<bool> login(String? mobile, String pin) async {
  // Add your function code here!
  return FirebaseFirestore.instance
      .collection('USER_PROFILE')
      .where('mobile', isEqualTo: mobile)
      .where('quickPin', isEqualTo: pin)
      .get()
      .then((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      print('Document data: ${snapshot.docs}');
      List<dynamic> lst = [];

      print(snapshot.docs.first.data());

      lst.add(snapshot.docs.first.data());
      FFAppState().loggedInUser.add({
        "ref": snapshot.docs.first.reference,
        "role": snapshot.docs.first.data()['roll'],
        "id": snapshot.docs.first.id
      });
      FFAppState().currentUserId = snapshot.docs.first.id;
      FFAppState().currentUserRef = snapshot.docs.first.reference;
      FFAppState().currentUserRole = snapshot.docs.first.data()['roll'];
      FFAppState().outletId = snapshot.docs.first.data()['outletId'];
      FFAppState().outletRef = getOutletRefById(FFAppState().outletId);

      // FFAppState().currentUserRole = snapshot.docs.first.data()['role'];
      var access = snapshot.docs.first.data()['userAccess'];
      FFAppState().userAccessList.bizAppScanQR = access["bizAppScanQR"];
      FFAppState().userAccessList.barcode = access["barcode"];
      FFAppState().userAccessList.editBill = access["editBill"];
      FFAppState().userAccessList.goodsReceived = access["goodsReceived"];
      FFAppState().userAccessList.kOTModify = access["kOTModify"];
      FFAppState().userAccessList.payment = access["payment"];
      FFAppState().userAccessList.reports = access["reports"];
      FFAppState().userAccessList.settings = access["settings"];
      print("bizAppScanQR");
      print(FFAppState().userAccessList.bizAppScanQR);
      print(FFAppState().loggedInUser);

      return true;
    } else {
      FFAppState().loggedInUser.clear();
      FFAppState().currentUserId = "";
      //FFAppState().currentUserRef=null;
      FFAppState().currentUserRole = "";

      print('Document does not exist on the database');
      return false;
    }
  });
}
