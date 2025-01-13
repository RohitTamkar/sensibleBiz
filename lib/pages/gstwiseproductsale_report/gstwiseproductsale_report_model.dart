import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
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
import 'gstwiseproductsale_report_widget.dart'
    show GstwiseproductsaleReportWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class GstwiseproductsaleReportModel
    extends FlutterFlowModel<GstwiseproductsaleReportWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in GstwiseproductsaleReport widget.
  UserProfileRecord? userdetails;
  // Stores action output result for [Custom Action - generateExcel] action in Text widget.
  String? base64;
  // Stores action output result for [Custom Action - generateExcel] action in IconButton widget.
  String? filebase64Copy;
  // Stores action output result for [Backend Call - API (sendMail)] action in IconButton widget.
  ApiCallResponse? apiResultb2bCopy;
  DateTime? datePicked;
  // Stores action output result for [Backend Call - API (dayWiseSale)] action in IconButton widget.
  ApiCallResponse? customdatewisegst;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
