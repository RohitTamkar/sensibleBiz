import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_data/no_data_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'category_wise_sale_report_widget.dart'
    show CategoryWiseSaleReportWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CategoryWiseSaleReportModel
    extends FlutterFlowModel<CategoryWiseSaleReportWidget> {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // Stores action output result for [Custom Action - getShiftDetails] action in IconButton widget.
  List<dynamic>? shiftdetails2;
  // Stores action output result for [Custom Action - getProductSale] action in IconButton widget.
  List<dynamic>? prdJson2;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  ProductRecord? productDetail1;
  // Stores action output result for [Custom Action - docToJsonCopy] action in IconButton widget.
  dynamic? productJson2;
  // Stores action output result for [Custom Action - getCatEiseSale] action in IconButton widget.
  List<dynamic>? catJson2;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  CategoryRecord? catDetails1;
  // Stores action output result for [Custom Action - catDocToJson] action in IconButton widget.
  dynamic? categoryJson2;
  // Stores action output result for [Custom Action - getReport] action in IconButton widget.
  List<dynamic>? finalList2;

  @override
  void initState(BuildContext context) {
    dataTableShowLogs = false; // Disables noisy DataTable2 debug statements.
  }

  @override
  void dispose() {}
}
