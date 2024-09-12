import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'upload_excel_sheet_page_widget.dart' show UploadExcelSheetPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UploadExcelSheetPageModel
    extends FlutterFlowModel<UploadExcelSheetPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - readFromCsv] action in Button widget.
  List<ProductMasterListStruct>? readexceldataCopy;
  // Stores action output result for [Custom Action - readFromCsv] action in Button widget.
  List<ProductMasterListStruct>? readexceldata;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PremisesRecord>? premises;
  // Stores action output result for [Custom Action - readFromCsvnewprimise] action in Button widget.
  List<ProductMasterListStruct>? readexceldata22;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
