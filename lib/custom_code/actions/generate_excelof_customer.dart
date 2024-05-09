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

Future<String> generateExcelofCustomer(
    String? shopName, String? dateTime, List<CustomerRecord> customers) async {
  // Add your function code here!

  var excel = Excel.createExcel();
  var sheet = excel['Sheet1'];

  // Add headers to the sheet
  sheet.appendRow([
    TextCellValue('Shop Name'),
    TextCellValue(shopName ?? ''),
  ]);
  sheet.appendRow([
    TextCellValue('Date & Time'),
    TextCellValue(dateTime ?? ''),
  ]);
  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing

  // Tax summary

  // Add tax totals to the sheet

  sheet.appendRow([TextCellValue('')]);
  // Add total tax amount to the sheet

  sheet.appendRow([TextCellValue('')]); // Add an empty row for spacing
  sheet.appendRow([
    TextCellValue('Customer Name'),
    TextCellValue('Contact Number'),
    TextCellValue('Alternate Contact'),
    TextCellValue('Email Id'),
    TextCellValue('GST Number'),
    TextCellValue('Address'),
  ]);

  for (var cust in customers) {
    sheet.appendRow([
      TextCellValue(cust.name.toString()),
      TextCellValue(cust.contact.toString()),
      TextCellValue(cust.altContact.toString()),
      TextCellValue(cust.email.toString()),
      TextCellValue(cust.gstNo.toString()),
      TextCellValue(cust.address.toString()),
    ]);
  }

  sheet.appendRow([TextCellValue('')]);

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
