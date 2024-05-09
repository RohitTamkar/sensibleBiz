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

Future exportToExcel(
  List<dynamic> document,
) async {
  // Add your function code here!
  List<dynamic> list = [];
  String fileName;
  bool active = false;
  String fileContent = "";
  //fileContent = "CATEGORY REPORT as on ";
  //fileContent += FFAppState().selectedDate;

  fileContent = "CATEGORY REPORT as on " +
      "                                              " +
      FFAppState().selectedDate;

  fileContent += "\n CategoryName, Total";

  print(document);

  for (int i = 0; i < document.length; i++) {
    print(document[i]);
    fileContent += "\n" +
        document[i]["catName"] +
        "," +
        document[i]["catTotal"].toString();
  }

  print(fileContent);

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  if (defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS) {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    fileName = '$appDocumentsPath/CategorywiseSaleReport.csv';
  } else {
    fileName = 'CategorywiseSaleReport.csv';
  }

  var bytes = utf8.encode(fileContent.toString());
  final stream = Stream.fromIterable(bytes);
  await download(stream, fileName);
}
