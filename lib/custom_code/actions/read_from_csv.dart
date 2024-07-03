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

import '../../flutter_flow/upload_data.dart';

import 'package:csv/csv.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

// import 'dart:convert' show utf8;
import 'dart:convert';

Future<List<ProductMasterListStruct>> readFromCsv(
  BuildContext context,
  String? divider,
) async {
  // null safety check
  divider = divider ?? ',';

//************** */

// void main() {
//   String userName1 = 'John Doe';
//   String userName2 = 'Alice Smith';

//   print(extractInitials(userName1)); // Output: JD
//   print(extractInitials(userName2)); // Output: AS
// }

//*********** */

  final List<ProductMasterListStruct> productList = [];

  final selectedFile = await selectFile(allowedExtensions: ['csv']);

  if (selectedFile != null) {
    showUploadMessage(
      context,
      'Reading file...',
      showLoading: true,
    );

    final fileBytes = selectedFile.bytes;
    final fileString = utf8.decode(fileBytes);
    List<String> rows = [];
    String fileType = 'csv';

    if (selectedFile.storagePath.contains('csv')) {
      rows = fileString.split('\n');

      // Use a flag to skip the first row (header)
      bool isFirstRow = true;

      for (var row in rows) {
        if (row.isEmpty) {
          continue; // Skip empty rows
        }

        if (isFirstRow) {
          isFirstRow = false;
          continue; // Skip the header row
        }

        List<String> fields = row.split(divider);

        if (fields.length < 2) {
          print("Skipping row: Insufficient fields");
          continue; // Skip rows without enough fields
        }

        var name = fields[0];
        var regionalName = fields[1];
        var defaultPrice = fields[2];
        var price = fields[3];
        var mrpPrice = fields[4];
        var purchasePrice = fields[5];

        var category = fields[6];
        var categoryNo = fields[7];
        var tax = fields[8];
        var barcode = fields[9];

        var unitType = fields[10];
        var stock = fields[11];
        var weightable = fields[12];
        var code = fields[13];
        // var dayType = fields[14];

        String generateShortName(String name) {
          List<String> words = name.split(' ');
          String shortName = '';

          for (String word in words) {
            if (word.isNotEmpty) {
              shortName += word[0].toUpperCase();
            }
          }

          return shortName;
        }

        productList.add(ProductMasterListStruct(
          id: '',
          active: false,
          barcode: barcode ?? '',
          category: category ?? '',
          cess: 00,
          code: int.parse(code ?? '0'),
          costPrice: double.parse(purchasePrice ?? '0.00'),
          discount: 0,
          keyCount: 0,
          kitchenId: '',
          mrpPrice: double.parse(mrpPrice ?? '0.00'),
          name: name ?? '',
          onlinePrice: 0,
          onlineSynced: false,
          price: double.parse(price ?? '0.00'),
          priceTable: '{"default price":$defaultPrice}',
          recipeId: '',
          regionalName: regionalName ?? '',
          reorderLevel: 0,
          selected: false,
          shortName: generateShortName(name),
          stockable: false,
          taxIndex: int.parse(tax ?? '0'),
          type: 0,
          unitId: 0,
          weightable: weightable ?? '',
          currentStock: double.parse(stock ?? '0.00'),
          unitType: unitType ?? ' ',
          categoryNo: int.parse(categoryNo ?? '0'),
          batchNo: 0,
          hsnCode: "",
          rooms: false,
          state: 0,
          viewType: 0,
          defaultPrice: double.parse(defaultPrice ?? '0.00'),
          // dayType: dayType.trim() ?? '',
        ));
      }
    }

    showUploadMessage(
      context,
      'Success!',
    );
  }
  print(productList);
  return productList;
}
