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

import 'package:cloud_firestore/cloud_firestore.dart';

// request count increment
// Import necessary packages

// Define function to request count increment
Future<int> reqCountIncrement(StockLogRecord document) async {
  // Get reference to Firestore collection
  CollectionReference stockLogs =
      FirebaseFirestore.instance.collection('stock_logs');

  String docId = document.id;

  int currentCount = document.reqCount;

  int newCount = currentCount + 1;

  // Update count value in Firestore
  await stockLogs.doc(docId).update({'count': newCount});

  // Return new count value
  return newCount;
}
