import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'reports_widget.dart' show ReportsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReportsModel extends FlutterFlowModel<ReportsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getShiftDetails] action in Button widget.
  List<dynamic>? shiftdetails2;
  // Stores action output result for [Custom Action - getProductSale] action in Button widget.
  List<dynamic>? prdJson2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductRecord? productDetail2;
  // Stores action output result for [Custom Action - docToJsonCopy] action in Button widget.
  dynamic? productJson2;
  // Stores action output result for [Custom Action - getReport] action in Button widget.
  List<dynamic>? finalList2;
  // Stores action output result for [Custom Action - getShiftDetails] action in Button widget.
  List<dynamic>? shiftdetails1;
  // Stores action output result for [Custom Action - getProductSale] action in Button widget.
  List<dynamic>? prdJson1;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  ProductRecord? productDetail;
  // Stores action output result for [Custom Action - docToJsonCopy] action in Button widget.
  dynamic? productJson;
  // Stores action output result for [Custom Action - getCatEiseSale] action in Button widget.
  List<dynamic>? catJson1;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CategoryRecord? catDetails;
  // Stores action output result for [Custom Action - catDocToJson] action in Button widget.
  dynamic? categoryJson;
  // Stores action output result for [Custom Action - getReport] action in Button widget.
  List<dynamic>? finalList;
  // Stores action output result for [Backend Call - API (getCustomDateSale)] action in Button widget.
  ApiCallResponse? gstResult;
  // Stores action output result for [Backend Call - API (dayWiseSale)] action in Container widget.
  ApiCallResponse? result2;
  // Stores action output result for [Backend Call - API (dayWiseSale)] action in Container widget.
  ApiCallResponse? resulttax;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
