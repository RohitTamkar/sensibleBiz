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

// Define function to print product data directly to web A4 size
Future<void> printA4size(
  List<ProductListStruct>? productdata,
  String? sourceOutletName,
  String? destinationOutletName,
  String? sourceOutletAddress,
  String? destinationOutletAddress,
  String? mobileNo,
  String? deliveryAddress,
  String? invNo,
  String? date,
  String? authorizedBy,
) async {
  // Create PDF document
  final pdf = pw.Document();
  //int srno = 0;
  // Add page to PDF document
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        // Create table to display product data
        return pw.Container(
          padding: pw.EdgeInsets.all(20),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header section
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text(
                    'Delivery Note',
                    style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColor.fromHex('#3498db')),
                  ),
                  pw.Text(
                    'Date: $date',
                    style: pw.TextStyle(
                        fontSize: 12, color: PdfColor.fromHex('#7f8c8d')),
                  ),
                ],
              ),
              pw.SizedBox(height: 10),
              // Outlet information
              pw.Row(
                children: [
                  _buildOutletInfo(
                      'From', sourceOutletName, sourceOutletAddress),
                  //_buildOutletInfo(
                  //    'To', destinationOutletName, destinationOutletAddress),
                ],
              ),
              pw.SizedBox(height: 20),

              // Product table
              pw.Table.fromTextArray(
                headerStyle: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromHex('#3498db')),
                cellAlignment: pw.Alignment.center,
                headerAlignment: pw.Alignment.center,
                cellStyle: const pw.TextStyle(fontSize: 12),
                data: <List<String>>[
                  <String>['SR. No', 'Product Name', 'Qty'],
                  ...productdata!.asMap().entries.map((entry) {
                    final product = entry.value;
                    final srNo = entry.key + 1;
                    return <String>[
                      srNo.toString(),
                      product.name,
                      product.reqStock.toString(), // Format price as currency
                    ];
                  }),
                ],

                /*  data: <List<String>>[
                  <String>['SR. No', 'Product Name', 'Current Stock', 'Req.Stock'],
                  ...productdata!.asMap().entries.map((entry) {
                    final product = entry.value;
                    final srNo = entry.key + 1;
                    return <String>[
                      srno.toString(),
                        product.name,
                        product.currentStock.toString(),
                        product.reqStock.toString(), // Format price as currency
                     ];
                  }),
                ],
              
*/
              ),

              // Authorized By section
              pw.SizedBox(height: 20),
              pw.Text(
                'Received By: $authorizedBy',
                style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromHex('#2ecc71')),
              ),
            ],
          ),
        );
      },
    ),
  );

  // Print PDF document
  try {
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save());
  } catch (e) {
    print('Error printing invoice: $e');
  }
}

// Helper function to build outlet information
pw.Widget _buildOutletInfo(
    String title, String? outletName, String? outletAddress) {
  return pw.Expanded(
    child: pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          title,
          style: pw.TextStyle(fontSize: 14, color: PdfColor.fromHex('#7f8c8d')),
        ),
        pw.Text(
          outletName ?? '',
          style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
        ),
        pw.Text(
          outletAddress ?? '',
          style: pw.TextStyle(fontSize: 12, color: PdfColor.fromHex('#7f8c8d')),
        ),
      ],
    ),
  );
}
