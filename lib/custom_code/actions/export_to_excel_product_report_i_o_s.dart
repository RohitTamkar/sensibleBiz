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

import 'package:path_provider/path_provider.dart';
import 'package:download/download.dart';
import 'dart:math' as math;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<dynamic> exportToExcelProductReportIOS(
  List<dynamic> productReport,
) async {
  // Add your function code here!
  // Add your function code here!
  List<dynamic> list = [];
  String fileName;
  bool active = false;
  String fileContent = "";
  fileContent = "Product Report as on" +
      "                                              " +
      FFAppState().selectedDate;

  /*fileContent = TextSpan(
          text: 'Product Report as on ',
          style: TextStyle(fontWeight: FontWeight.bold))
      .toString();
*/
  //fileContent += "\n";
  // += FFAppState().selectedDate;
  //fileContent += "\n" + DateTime.now;
  //DateTime now = DateTime.now();
  // String nowString = now.toString();
  //fileContent += "\n" + nowString;
  fileContent += "\n  Name, Quantity, Price ";

  print(productReport);

  for (int i = 0; i < productReport.length; i++) {
    for (int j = 0; j < productReport[i].length; j++) {
      //print(productReport[i][j]);
      var x = productReport[i][j];
      print(x);
      fileContent += "\n" +
          x["prdName"].toString() +
          "," +
          x["qty"].toString() +
          "," +
          x["price"].toString(); // +
      //   "," +
      //  productReport[i]["catTotal"].toString();
    }
  }

  print(fileContent);

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  if (defaultTargetPlatform == TargetPlatform.android) {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    fileName = '$appDocumentsPath/ProductwiseSaleReport.csv';
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    Directory? appDownloadDirectory = await getDownloadsDirectory();
    String appDocumentsPath = appDownloadDirectory!.path;
    fileName = '$appDocumentsPath/ProductwiseSaleReport.csv';
  } else {
    fileName = 'productwiseSaleReport.csv';
  }

  var bytes = utf8.encode(fileContent.toString());
  final stream = Stream.fromIterable(bytes);
  await download(stream, fileName);
}
