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

Future<String> barcodeRandomGenerated() async {
  // Define the prefix and total length
  const String prefix = '2024'; // Fixed prefix
  const int totalLength = 12; // Total length of the barcode
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

  // Calculate how many characters to generate after the prefix
  int remainingLength = totalLength - prefix.length;

  // Combine prefix and random part to create the final barcode
  String barcode = prefix + generateRandomPart(remainingLength);

  print(barcode); // For debugging, you can see the generated barcode
  return barcode; // Return the generated barcode
}
