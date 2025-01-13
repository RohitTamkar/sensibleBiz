import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/excel_listpremises/excel_listpremises_widget.dart';
import '/components/excel_view/excel_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'excel_sheetpremises_widget.dart' show ExcelSheetpremisesWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ExcelSheetpremisesModel
    extends FlutterFlowModel<ExcelSheetpremisesWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoryRecord? categoryid;
  // Stores action output result for [Custom Action - getUnitTypes] action in Button widget.
  int? unitId;
  // Stores action output result for [Custom Action - getTaxId] action in Button widget.
  int? taxID;
  // Stores action output result for [Custom Action - getweightable] action in Button widget.
  bool? weightable;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductRecord? createdDocumentProduct;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
