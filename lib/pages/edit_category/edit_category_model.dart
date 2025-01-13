import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_category_widget.dart' show EditCategoryWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditCategoryModel extends FlutterFlowModel<EditCategoryWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for NameM widget.
  FocusNode? nameMFocusNode;
  TextEditingController? nameMTextController;
  String? Function(BuildContext, String?)? nameMTextControllerValidator;
  String? _nameMTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for regionalNameM widget.
  FocusNode? regionalNameMFocusNode;
  TextEditingController? regionalNameMTextController;
  String? Function(BuildContext, String?)? regionalNameMTextControllerValidator;
  // State field(s) for catCode widget.
  FocusNode? catCodeFocusNode;
  TextEditingController? catCodeTextController;
  String? Function(BuildContext, String?)? catCodeTextControllerValidator;
  // State field(s) for NameWeb widget.
  FocusNode? nameWebFocusNode;
  TextEditingController? nameWebTextController;
  String? Function(BuildContext, String?)? nameWebTextControllerValidator;
  String? _nameWebTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for RegNameW widget.
  FocusNode? regNameWFocusNode;
  TextEditingController? regNameWTextController;
  String? Function(BuildContext, String?)? regNameWTextControllerValidator;
  // State field(s) for CatCodeW widget.
  FocusNode? catCodeWFocusNode;
  TextEditingController? catCodeWTextController;
  String? Function(BuildContext, String?)? catCodeWTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nameMTextControllerValidator = _nameMTextControllerValidator;
    nameWebTextControllerValidator = _nameWebTextControllerValidator;
  }

  @override
  void dispose() {
    nameMFocusNode?.dispose();
    nameMTextController?.dispose();

    regionalNameMFocusNode?.dispose();
    regionalNameMTextController?.dispose();

    catCodeFocusNode?.dispose();
    catCodeTextController?.dispose();

    nameWebFocusNode?.dispose();
    nameWebTextController?.dispose();

    regNameWFocusNode?.dispose();
    regNameWTextController?.dispose();

    catCodeWFocusNode?.dispose();
    catCodeWTextController?.dispose();
  }
}
