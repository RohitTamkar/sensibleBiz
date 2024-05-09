import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/custom_date_range_widget.dart';
import '/components/email_input_widget.dart';
import '/components/g_s_tsale_summary_report_widget.dart';
import '/components/no_data_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'gst_prd_rprt_cust_date_widget.dart' show GstPrdRprtCustDateWidget;
import 'package:styled_divider/styled_divider.dart';
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

class GstPrdRprtCustDateModel
    extends FlutterFlowModel<GstPrdRprtCustDateWidget> {
  ///  Local state fields for this page.

  DateTime? startDate;

  DateTime? endDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in GstPrdRprtCustDate widget.
  UserProfileRecord? userdetails;
  // Stores action output result for [Custom Action - showReportGST] action in GstPrdRprtCustDate widget.
  dynamic? gstTaxPer2;
  // Stores action output result for [Custom Action - showReportGST] action in Text widget.
  dynamic? gstTaxPer;
  // Stores action output result for [Custom Action - generateExcel] action in IconButton widget.
  String? filebase64Copy;
  // Stores action output result for [Backend Call - API (sendMail)] action in IconButton widget.
  ApiCallResponse? apiResultb2bCopy;
  // Stores action output result for [Backend Call - API (getCustomDateSale)] action in IconButton widget.
  ApiCallResponse? customdatewisegstSale;
  // Stores action output result for [Custom Action - showReportGST] action in IconButton widget.
  dynamic? gstTaxPer3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
