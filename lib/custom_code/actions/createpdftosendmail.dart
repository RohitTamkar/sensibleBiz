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

import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<void> createpdftosendmail(
    List<dynamic> productwisesaleReport, DateTime date) async {
  // Generate PDF
  final pdf = pw.Document();

  pdf.addPage(pw.MultiPage(
    build: (context) => [
      pw.Header(
        level: 0,
        child: pw.Text("Product-wise Sale Report - ${date.toLocal()}"),
      ),
      pw.Table.fromTextArray(
        context: context,
        data: <List<String>>[
          <String>['Product', 'Quantity', 'Amount'],
          for (var report in productwisesaleReport)
            <String>[
              report['prdName'].toString(),
              report['qty'].toString(),
              report['price'].toString(),
            ],
        ],
      ),
    ],
  ));

  // Save the PDF to a file
  final pdfFile = File('product_wise_sale_report.pdf');
  await pdfFile.writeAsBytes(await pdf.save());

  // Email configuration
  final smtpServer = gmail('shrikantkoli701@gmail.com', 'Sensible@123');

  final message = Message()
    ..from = Address('shrikantkoli701@gmail.com', 'shrikant koli')
    ..recipients.add(
        'shrikantkoli524@gmail.com') // replace with the recipient's email address
    ..subject = 'Product-wise Sale Report - ${date.toLocal()}'
    ..attachments.add(FileAttachment(pdfFile));

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ');
  } catch (e) {
    print('Error sending email: $e');
  }
}

void main() async {
  // Example usage
  final productwisesaleReport = [
    {'productName': 'Product A', 'quantity': 10, 'amount': 100.0},
    {'productName': 'Product B', 'quantity': 20, 'amount': 200.0},
    // Add more data as needed
  ];

  final date = DateTime.now();

  await createpdftosendmail(productwisesaleReport, date);
}
