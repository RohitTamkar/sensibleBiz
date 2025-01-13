import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_expense_widget.dart' show EditExpenseWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditExpenseModel extends FlutterFlowModel<EditExpenseWidget> {
  ///  Local state fields for this page.

  bool wait = false;

  String? shortNamePS;

  String? birthday;

  String? anniversPs;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for ExpenseName widget.
  FocusNode? expenseNameFocusNode;
  TextEditingController? expenseNameTextController;
  String? Function(BuildContext, String?)? expenseNameTextControllerValidator;
  String? _expenseNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DescriptionTextField widget.
  FocusNode? descriptionTextFieldFocusNode;
  TextEditingController? descriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    expenseNameTextControllerValidator = _expenseNameTextControllerValidator;
  }

  @override
  void dispose() {
    expenseNameFocusNode?.dispose();
    expenseNameTextController?.dispose();

    descriptionTextFieldFocusNode?.dispose();
    descriptionTextFieldTextController?.dispose();
  }
}
