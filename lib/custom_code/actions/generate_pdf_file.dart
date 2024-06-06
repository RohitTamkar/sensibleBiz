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

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<String> generatePdfFile(List<dynamic> dataList) async {
// final filteredData = dataList.where((entry) {
//       DateTime entryDate = DateTime.parse(entry['date']);
//       return entryDate.isAfter(startDate.subtract(Duration(days: 1))) && entryDate.isBefore(endDate.add(Duration(days: 1)));
//     }).toList();

  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Text('Report', style: pw.TextStyle(fontSize: 24)),
            pw.SizedBox(height: 20),
            pw.Table.fromTextArray(
              headers: [
                'Date',
                'Bill No',
                'Check Out Time',
                'Check In Time',
                'Amount'
              ],
              data: dataList.map((entry) {
                return [
                  entry['dayId'],
                  entry['billNo'],
                  entry['checkOutTime'],
                  entry['checkInTime'],
                  entry['finalTotal'].toString()
                ];
              }).toList(),
            ),
          ],
        );
      },
    ),
  );

  await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save());
  return "complted";
}
// Add your function code here!
