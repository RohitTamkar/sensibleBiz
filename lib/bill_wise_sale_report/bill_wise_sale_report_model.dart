import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/calender_widget.dart';
import '/components/check_in_success_widget.dart';
import '/components/check_out_success_widget.dart';
import '/components/session_expired_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'bill_wise_sale_report_widget.dart' show BillWiseSaleReportWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BillWiseSaleReportModel
    extends FlutterFlowModel<BillWiseSaleReportWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var billNumberQR = '';
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  BillSaleSummaryRecord? billDocumnetQR;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
