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

import 'dart:math' as math;

Future<String> barcodeRandomGeneratedNew(DateTime? dateTime) async {
  DateTime now = DateTime.now();
  String dateTimeFormat =
      DateFormat('yyyyMMddHHmmss').format(now); // Format as YYYYMMDDHHMM

  // Define the total length for the barcode
  const int totalLength = 14; // Total length of the barcode
  const String chars = '0123456789'; // Characters to choose from (only digits)

  // Function to generate a random character from the chars
  var rnd = math.Random();
  String char() {
    return chars[rnd.nextInt(chars.length)];
  }

  // Generate the remaining random digits
  String generateRandomPart(int length) {
    StringBuffer tmp = StringBuffer();
    for (int i = 0; i < length; i++) {
      tmp.write(char());
    }
    return tmp.toString();
  }

  // Calculate how many random characters to generate after the dateTimeFormat
  int remainingLength = totalLength - dateTimeFormat.length;

  // Combine dateTimeFormat and random part to create the final barcode
  String barcode = dateTimeFormat + generateRandomPart(remainingLength);

  print(barcode); // For debugging, you can see the generated barcode
  return barcode; // Return the generated barcode
  // Add your function code here!
}
