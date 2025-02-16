import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_date_range_copy/custom_date_range_copy_widget.dart';
import '/components/no_data/no_data_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_sale_report_daywise_widget.dart'
    show ProductSaleReportDaywiseWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProductSaleReportDaywiseModel
    extends FlutterFlowModel<ProductSaleReportDaywiseWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in productSaleReportDaywise widget.
  UserProfileRecord? userDetails;
  // Stores action output result for [Custom Action - getShiftDetailsCopy] action in IconButton widget.
  List<dynamic>? shiftdetails6;
  // Stores action output result for [Custom Action - getProductSale] action in IconButton widget.
  List<dynamic>? prdJson3;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  ProductRecord? productDetail3;
  // Stores action output result for [Custom Action - docToJsonCopyCopy] action in IconButton widget.
  dynamic? productJson5;
  // Stores action output result for [Custom Action - docToJsonCopy] action in IconButton widget.
  dynamic? productJson3;
  // Stores action output result for [Custom Action - getReport] action in IconButton widget.
  List<dynamic>? finalList4;
  // Stores action output result for [Custom Action - genrateExcelForProductWiseSaleReportForWeb] action in IconButton widget.
  String? base64Link;
  // Stores action output result for [Backend Call - API (sendMail)] action in IconButton widget.
  ApiCallResponse? apiResultOfMailSend;
  // Stores action output result for [Custom Action - exportToExcelProductReport] action in Icon widget.
  dynamic? res;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
