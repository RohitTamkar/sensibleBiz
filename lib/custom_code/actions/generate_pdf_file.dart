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

import 'index.dart'; // Imports other custom actions

import 'dart:convert';

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';
import 'dart:convert';
import 'dart:typed_data';

Future<String> generatePdfFile(
    List<BillSaleSummeryDataTypeStruct> dataList) async {
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];
  print(dataList);

  String getTimeFromMilliseconds(int milliseconds) {
    if (milliseconds > 1) {
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
      String formattedDateTime =
          DateFormat('dd/MM/yyyy hh:mm a').format(dateTime);
      return formattedDateTime;
    }
    return "-";
  }

  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  sheet.appendRow([
    TextCellValue('Date'),
    TextCellValue('Bill No'),
    TextCellValue('Check In Time'),
    TextCellValue('Check Out Time'),
    TextCellValue('Amount'),
  ]);

  for (var product in dataList) {
    sheet.appendRow([
      TextCellValue(product.dayId),
      TextCellValue(product.billNo),
      TextCellValue(getTimeFromMilliseconds(product.checkInTime)),
      TextCellValue(getTimeFromMilliseconds(product.checkOutTime)),
      TextCellValue(product.finalTotal.toString()),
    ]);
  }
  // }
  sheet.appendRow([TextCellValue('')]);

  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  // Encode the Excel file
  var fileBytes = excel.encode();

  // Convert bytes to base64
  var base64String = base64Encode(fileBytes!);

  // Prepare data URI
  var dataUri =
      'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,$base64String';

  print(dataUri);

  final encodedStr = "put base64 encoded string here";
  Uint8List bytes = base64.decode(base64String);

  Directory? directory = await getExternalStorageDirectory();
  // String downloadsPath = '${directory!.path}/Download';
  String downloadsPath = '/storage/emulated/0/Download';
  Directory downloadsDirectory = Directory(downloadsPath);

  // Create the downloads directory if it doesn't exist
  if (!downloadsDirectory.existsSync()) {
    downloadsDirectory.createSync(recursive: true);
  }

  File file = File("$downloadsPath/" +
      DateTime.now().millisecondsSinceEpoch.toString() +
      ".xlsx");
  await file.writeAsBytes(bytes);
  return file.path;
}
