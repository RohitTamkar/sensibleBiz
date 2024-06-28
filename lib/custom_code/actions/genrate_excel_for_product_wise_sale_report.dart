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

import 'dart:convert';

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';

Future<String> genrateExcelForProductWiseSaleReport(
  List<dynamic> jsonproduct,
  String? startdate,
  String? outletName,
) async {
  // Create Excel file
  print(jsonproduct);
  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];

  // Add headers to the sheet
  sheet.appendRow([
    TextCellValue('Shop Name'),
    TextCellValue(outletName ?? ''),
  ]);
/*
  sheet.appendRow([
    TextCellValue('Date & Time'),
    TextCellValue(dateTime ?? ''),
  ]);*/

  sheet.appendRow([
    TextCellValue('Start Date'),
    TextCellValue(startdate ?? ''),
  ]);

  sheet.appendRow([
    TextCellValue('End Date'),
    // TextCellValue(endDate ?? ''),
  ]);

  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  // Add product details to the sheet
  sheet.appendRow([
    TextCellValue('Product Name'),
    TextCellValue('Tax (%)'),
    TextCellValue('Tax Amount'),
    TextCellValue('Qty'),
    TextCellValue('Calculated Tax'),
    TextCellValue('Price'),
    TextCellValue('Total'),
  ]);

  var productTotal = 0.0;
  for (var product in jsonproduct) {
    var taxAmountIn = double.parse(product['taxAmountIn'].toString());
    // var qty = int.parse(product['qty'].toString());
    var qty = double.parse(product['qty'].toString());
    var calculatedTax = (taxAmountIn * qty).toStringAsFixed(2);
    sheet.appendRow([
      TextCellValue(product['prdName'].toString()),
      TextCellValue(product['taxPer'].toString()),
      TextCellValue(product['taxAmountIn'].toString()),
      TextCellValue(product['qty'].toString()),
      TextCellValue(calculatedTax),
      TextCellValue(product['price'].toString()),
      TextCellValue(product['catTotal'].toString()),
    ]);
    productTotal += double.parse(product['catTotal'].toString());
  }

  sheet.appendRow([TextCellValue('')]);
  // Add total product amount to the sheet
  sheet.appendRow([
    TextCellValue('Product Total'),
    TextCellValue(productTotal.toStringAsFixed(2)),
  ]);
  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  sheet.appendRow([
    TextCellValue('Tax (%)'),
    TextCellValue('Basic Tax Amount'),
  ]);

  // Initialize tax categories
  var taxCategories = {
    0: '0% GST TOTAL',
    3: '3% GST TOTAL',
    5: '5% GST TOTAL',
    12: '12% GST TOTAL',
    18: '18% GST TOTAL',
    28: '28% GST TOTAL',
    22: '22% VAT TOTAL',
  };

  // Tax summary
  var taxSummary = <int, double>{};
  var totalTaxAmount = 0.0;
  for (var product in jsonproduct) {
    var taxPer = product['taxPer'];
    var taxAmountIn = double.parse(product['taxAmountInTotal'].toString());
    taxSummary[taxPer] = (taxSummary[taxPer] ?? 0) + taxAmountIn;
    totalTaxAmount += taxAmountIn;
  }

  // Add tax totals to the sheet
  taxCategories.forEach((tax, label) {
    sheet.appendRow([
      TextCellValue(label),
      TextCellValue((taxSummary[tax] ?? 0).toStringAsFixed(2)),
    ]);
  });

  sheet.appendRow([TextCellValue('')]);
  // Add total tax amount to the sheet
  sheet.appendRow([
    TextCellValue('Total Tax'),
    TextCellValue(totalTaxAmount.toStringAsFixed(2)),
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
