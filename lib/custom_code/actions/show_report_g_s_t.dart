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

Future<dynamic> showReportGST(List<dynamic> jsonproduct) async {
  // Add your function code here!
  // Initialize tax categories
  // Initialize tax categories
  List<dynamic> list = [];
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
  var productTotal = 0.0;
  var totalBasicTaxAmount = 0.0;
  var totalQty = 0.0;
  var totalPrice = 0.0;

  // total tax amount
  for (var product in jsonproduct) {
    var taxPer = product['taxPer'];
    var taxAmountIn = double.parse(product['taxAmountInTotal'].toString());
    taxSummary[taxPer] = (taxSummary[taxPer] ?? 0) + taxAmountIn;
    totalTaxAmount += taxAmountIn;
    productTotal += double.parse(product['catTotal'].toString());

    totalQty += double.parse(product['qty'].toString());
    totalPrice += double.parse(product['price'].toString());
    totalBasicTaxAmount += double.parse(product['taxAmountInTotal'].toString());
  }

  FFAppState().totalTaxAmount = double.parse(totalTaxAmount.toStringAsFixed(2));

  FFAppState().totalProductSaleAmount =
      double.parse(productTotal.toStringAsFixed(2));

  FFAppState().qtyTotal = double.parse(totalQty.toStringAsFixed(2));

  FFAppState().priceTotal = double.parse(totalPrice.toStringAsFixed(2));

  FFAppState().taxAmtTotal =
      double.parse(totalBasicTaxAmount.toStringAsFixed(2));

  // Add tax totals to the sheet
  taxCategories.forEach((tax, label) {
    // sheet.appendRow([
    //   TextCellValue(label),
    //   TextCellValue((taxSummary[tax] ?? 0).toStringAsFixed(2)),
    // ]);
    print(label);
    print(taxSummary[tax]);
    list.add(
        {"lable": label, "total": (taxSummary[tax] ?? 0).toStringAsFixed(2)});
  });

  return list;
}
