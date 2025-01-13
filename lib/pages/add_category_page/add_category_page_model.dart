import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_category_page_widget.dart' show AddCategoryPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddCategoryPageModel extends FlutterFlowModel<AddCategoryPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for CategoryNameM widget.
  FocusNode? categoryNameMFocusNode;
  TextEditingController? categoryNameMTextController;
  String? Function(BuildContext, String?)? categoryNameMTextControllerValidator;
  String? _categoryNameMTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for RegionalNameM widget.
  FocusNode? regionalNameMFocusNode;
  TextEditingController? regionalNameMTextController;
  String? Function(BuildContext, String?)? regionalNameMTextControllerValidator;
  // State field(s) for categoryNoM widget.
  FocusNode? categoryNoMFocusNode;
  TextEditingController? categoryNoMTextController;
  String? Function(BuildContext, String?)? categoryNoMTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CategoryRecord? doc;
  // State field(s) for CategoryNameW widget.
  FocusNode? categoryNameWFocusNode;
  TextEditingController? categoryNameWTextController;
  String? Function(BuildContext, String?)? categoryNameWTextControllerValidator;
  String? _categoryNameWTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for RegionalNameW widget.
  FocusNode? regionalNameWFocusNode;
  TextEditingController? regionalNameWTextController;
  String? Function(BuildContext, String?)? regionalNameWTextControllerValidator;
  // State field(s) for categoryNoW widget.
  FocusNode? categoryNoWFocusNode;
  TextEditingController? categoryNoWTextController;
  String? Function(BuildContext, String?)? categoryNoWTextControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CategoryRecord? docCopy;

  @override
  void initState(BuildContext context) {
    categoryNameMTextControllerValidator =
        _categoryNameMTextControllerValidator;
    categoryNameWTextControllerValidator =
        _categoryNameWTextControllerValidator;
  }

  @override
  void dispose() {
    categoryNameMFocusNode?.dispose();
    categoryNameMTextController?.dispose();

    regionalNameMFocusNode?.dispose();
    regionalNameMTextController?.dispose();

    categoryNoMFocusNode?.dispose();
    categoryNoMTextController?.dispose();

    categoryNameWFocusNode?.dispose();
    categoryNameWTextController?.dispose();

    regionalNameWFocusNode?.dispose();
    regionalNameWTextController?.dispose();

    categoryNoWFocusNode?.dispose();
    categoryNoWTextController?.dispose();
  }
}
