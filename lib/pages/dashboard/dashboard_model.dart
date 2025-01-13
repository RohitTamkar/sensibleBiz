import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/check_in_success/check_in_success_widget.dart';
import '/components/check_out_success/check_out_success_widget.dart';
import '/components/select_date_range/select_date_range_widget.dart';
import '/components/session_expired/session_expired_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getShiftDetails] action in Dashboard widget.
  List<dynamic>? loadShiftData;
  // Stores action output result for [Custom Action - getShiftSummary] action in Dashboard widget.
  dynamic? loadShiftSummary;
  // Stores action output result for [Custom Action - diffBetweenDates] action in Dashboard widget.
  String? loadTime;
  InstantTimer? instantTimer;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // Stores action output result for [Custom Action - getShiftDetails] action in Button widget.
  List<dynamic>? shiftdetailsDashboard1;
  // Stores action output result for [Custom Action - getProductSale] action in Button widget.
  List<dynamic>? prdJson5;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductRecord? productDetail5;
  // Stores action output result for [Custom Action - docToJsonCopy] action in Button widget.
  dynamic? productJson5;
  // Stores action output result for [Custom Action - getCatEiseSale] action in Button widget.
  List<dynamic>? catJson5;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CategoryRecord? catDetails5;
  // Stores action output result for [Custom Action - catDocToJson] action in Button widget.
  dynamic? categoryJson5;
  // Stores action output result for [Custom Action - getReport] action in Button widget.
  List<dynamic>? finalList5;
  // Stores action output result for [Custom Action - getShiftDetails] action in Button widget.
  List<dynamic>? shiftdetailsDashboard;
  // Stores action output result for [Custom Action - getProductSale] action in Button widget.
  List<dynamic>? prdJsonDashboard;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductRecord? productDetailDashboard;
  // Stores action output result for [Custom Action - docToJsonCopy] action in Button widget.
  dynamic? productJsonDashboard;
  // Stores action output result for [Custom Action - getReport] action in Button widget.
  List<dynamic>? finalListDashboard;
  // Stores action output result for [Backend Call - API (getCustomDateSale)] action in Button widget.
  ApiCallResponse? gstResult;
  // Stores action output result for [Custom Action - getShiftDetails] action in Text widget.
  List<dynamic>? data;
  // Stores action output result for [Custom Action - getProductSale] action in Text widget.
  List<dynamic>? prd;
  // Stores action output result for [Custom Action - getCatEiseSale] action in Text widget.
  List<dynamic>? cat;
  // Stores action output result for [Custom Action - getReport] action in Text widget.
  List<dynamic>? yy;
  var qrSerial = '';
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  DeviceRecord? deviceDocument;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  BillSaleSummaryRecord? billDocumnetQR;
  // Stores action output result for [Custom Action - getShiftDetails] action in IconButton widget.
  List<dynamic>? clickShiftData;
  // Stores action output result for [Custom Action - getShiftSummary] action in IconButton widget.
  dynamic? clickShiftSummary1;
  // Stores action output result for [Custom Action - getShiftDetailsCopy] action in IconButton widget.
  List<dynamic>? custmData;
  // Stores action output result for [Custom Action - getShiftSummaryWithDateRange] action in IconButton widget.
  dynamic? clickShiftSummary;
  // Stores action output result for [Custom Action - diffBetweenDates] action in IconButton widget.
  String? clickTime;
  // Stores action output result for [Custom Action - getShiftDetails] action in Button widget.
  List<dynamic>? buttonShiftDataWeb;
  // Stores action output result for [Custom Action - getShiftSummary] action in Button widget.
  dynamic? shiftClickW;
  // Stores action output result for [Custom Action - diffBetweenDates] action in Button widget.
  String? time;
  // Stores action output result for [Custom Action - getShiftDetails] action in Button widget.
  List<dynamic>? buttonShiftData;
  // Stores action output result for [Custom Action - getShiftSummary] action in Button widget.
  dynamic? shiftClick;
  // Stores action output result for [Custom Action - diffBetweenDates] action in Button widget.
  String? time2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
  }
}
