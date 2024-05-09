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

Future<dynamic> getUserDeletion(String userId) async {
  // Add your function code here!
  List<dynamic> list = [];
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection("USER_DELETION")
      .where("userId", isEqualTo: userId)
      .get()
      .then((value) => value);
  if (querySnapshot.size == 0) {
    print('No matching documents.');
    list.add({
      "dateOfDeletion": 0,
      "dateOfInitiate": 0,
      "isDelete": false,
      "userId": "0"
    });
  } else {
    int len = querySnapshot.docs.length;
    int count = 0;
    querySnapshot.docs.forEach((doc) {
      list.add({
        "dateOfDeletion": doc["dateOfDeletion"],
        "dateOfInitiate": doc["dateOfInitiate"],
        "isDelete": doc["isDelete"],
        "userId": doc["userId"]
      });
    });
  }
  return list[0];
}
