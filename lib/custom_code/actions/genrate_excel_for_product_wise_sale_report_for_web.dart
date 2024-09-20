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

import 'dart:convert';

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';

Future<String> genrateExcelForProductWiseSaleReportForWeb(
  List<dynamic> jsonproduct,
  String? startdate,
  String? endDate,
) async {
  // Create Excel file
  print(jsonproduct);
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];

  // Add headers to the sheet
  sheet.appendRow([
    TextCellValue('Shop Name'),
    TextCellValue(FFAppState().outletName ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('Start Date'),
    TextCellValue(startdate ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('End Date'),
    TextCellValue(endDate ?? ''),
  ]);

  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  // Add product details to the sheet
  sheet.appendRow([
    TextCellValue('Product Name'),
    TextCellValue('Barcode'),
    TextCellValue('HSN'),
    TextCellValue('Quantity'),
    TextCellValue('Price'),
    TextCellValue('Total'),
  ]);

  double totalqty = 0;
  double totalAmt = 0;

  for (var product in jsonproduct) {
    // Ensure 'qty' and 'catTotal' are correctly parsed to avoid the type mismatch
    double qty = product['qty'] is int
        ? product['qty'].toDouble()
        : double.tryParse(product['qty'].toString()) ?? 0.0;
    double catTotal = double.tryParse(product['catTotal'].toString()) ?? 0.0;

    totalqty += qty;
    totalAmt += catTotal;

    sheet.appendRow([
      TextCellValue(product['name'].toString()),
      TextCellValue(product['barcode'].toString()),
      TextCellValue(product['hsnCode'].toString()),
      TextCellValue(qty.toString()),
      TextCellValue(product['price'].toString()),
      TextCellValue(catTotal.toString()),
    ]);
  }

  sheet.appendRow([TextCellValue('')]);
  sheet.appendRow([TextCellValue('')]);

  sheet.appendRow([
    TextCellValue(''),
    TextCellValue(''),
    TextCellValue('Total Qty'),
    TextCellValue(totalqty.toString()),
    TextCellValue('Total Price'),
    TextCellValue(totalAmt.toString()),
  ]);

  // Encode the Excel file
  var fileBytes = excel.encode();

  // Convert bytes to base64
  var base64String = base64Encode(fileBytes!);

  // Prepare data URI
  var dataUri =
      'data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,$base64String';
  print(dataUri);
  return dataUri;
}
