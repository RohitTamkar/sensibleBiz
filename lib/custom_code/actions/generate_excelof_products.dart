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

Future<String> generateExcelofProducts(String? shopName, String? dateTime,
    List<ProductRecord> products, List<CategoryRecord> category) async {
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

  // Add product details to the sheet
  /* final headers = [
    'id',
    'active',
    'barcode',
    'category',
    'cess',
    'code',
    'costPrice',
    'discount',
    'keyCount',
    'kitchenId',
    'mrpPrice',
    'name',
    'onlinePrice',
    'onlineSynced',
    'price',
    'priceTable',
    'recipeId',
    'regionalName',
    'reorderLevel',
    'selected',
    'shortName',
    'stockable',
    'taxIndex',
    'type',
    'unitId',
    'weightable',
    'currentStock',
    'unitType',
    'categoryNo',
    'batchNo',
    'hsnCode',
    'rooms',
    'state',
    'viewType',
    'defaultPrice'
  ];

  sheet.appendRow([TextCellValue(headers as String)]);
*/
  sheet.appendRow([
    // TextCellValue('id'),
    // TextCellValue('active (%)'),
    // TextCellValue('barcode'),
    TextCellValue('Product Name'),
    TextCellValue('Regional Name'),
    TextCellValue('defaultPrice'),
    TextCellValue('price'),
    TextCellValue('MRP Price'),
    TextCellValue('Purchase Price'),
    TextCellValue('Category Name'),
    TextCellValue('Category No'),
    TextCellValue('Tax'),
    TextCellValue('Barcode'),
    TextCellValue('Unit Type'),
    TextCellValue('Stock'),
    TextCellValue('Weightable'),
    TextCellValue('Search Code'),
    TextCellValue('Hsn Code'),
  ]);
  print(category);
  var productTotal = 0.0;
  for (var product in products) {
    String categoryName = '';
    int categoryNo = 0;
    String stockBool, weightBool;
    if (product.stockable == true) {
      stockBool = 'Yes';
    } else {
      stockBool = 'No';
    }
    if (product.weighable == true) {
      weightBool = 'Yes';
    } else {
      weightBool = 'No';
    }

    for (var cat in category) {
      // print(product.category);
      if (product.category == cat.reference.id) {
        categoryName = cat.name;
        categoryNo = cat.categoryNo;
        print(categoryName);
        // print(true);

        // break;
      }
      print(cat.name);
    }

    sheet.appendRow([
      // TextCellValue(product.id.toString()),
      // TextCellValue(product.active.toString()),
      // TextCellValue(product.barcode.toString()),
      TextCellValue(product.name.toString()),
      TextCellValue(product.regionalName.toString()),
      TextCellValue(product.price.toString()),
      TextCellValue(product.price.toString()),
      TextCellValue(product.mrpPrice.toString()),
      TextCellValue(product.costPrice.toString()),

      // TextCellValue(product.category.toString()),
      TextCellValue(categoryName),

      TextCellValue(categoryNo.toString()),
      TextCellValue(product.taxIndex.toString()),
      TextCellValue(product.barcode.toString()),
      TextCellValue(getUnitTypesEdit1(product.unitId)),
      TextCellValue(stockBool),
      TextCellValue(weightBool),
      TextCellValue(product.code.toString()),
      TextCellValue(product.hsnCode.toString()),
      // TextCellValue(product.cess.toString()),
      // TextCellValue(product.code.toString()),

      // TextCellValue(product.discount.toString()),
      // TextCellValue(product.keyCount.toString()),

      // TextCellValue(product.onlinePrice.toString()),

      // TextCellValue(product.priceTable.toString()),
      // TextCellValue(product.onlineSynced.toString()),

      // TextCellValue(product.recipeId.toString()),

      // TextCellValue(product.reorderLevel.toString()),
      // TextCellValue(product.reorderLevel.toString()),
      // TextCellValue(product.selected.toString()),
      // TextCellValue(product.shortName.toString()),

      // TextCellValue(product.type.toString()),
      // TextCellValue(product.unitId.toString()),

      // TextCellValue(product.currentStock.toString()),

      // TextCellValue(product.categoryNo.toString()),
      // TextCellValue(product.batchNo.toString()),
      // TextCellValue(product.hsnCode.toString()),
      // TextCellValue(product.rooms.toString()),
      // TextCellValue(product.state.toString()),
      // TextCellValue(product.viewType.toString()),
      // TextCellValue(product.price.toString())
    ]);
  }

  sheet.appendRow([TextCellValue('')]);
  // Add total product amount to the sheet

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
