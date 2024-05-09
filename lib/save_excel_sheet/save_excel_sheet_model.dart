import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/email_input_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'save_excel_sheet_widget.dart' show SaveExcelSheetWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class SaveExcelSheetModel extends FlutterFlowModel<SaveExcelSheetWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in SaveExcelSheet widget.
  List<CategoryRecord>? fetchedCat;
  // Stores action output result for [Firestore Query - Query a collection] action in SaveExcelSheet widget.
  List<ProductRecord>? fetchedPrd;
  // Stores action output result for [Custom Action - generateExcelofProducts] action in Button widget.
  String? file;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserProfileRecord? fetchedUser;
  // Stores action output result for [Backend Call - API (sendMail)] action in Button widget.
  ApiCallResponse? apiResultb2bCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
