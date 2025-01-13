import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_employee_widget.dart' show EditEmployeeWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditEmployeeModel extends FlutterFlowModel<EditEmployeeWidget> {
  ///  Local state fields for this page.

  bool wait = false;

  String? shortNamePS;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EmployeeName widget.
  FocusNode? employeeNameFocusNode;
  TextEditingController? employeeNameTextController;
  String? Function(BuildContext, String?)? employeeNameTextControllerValidator;
  String? _employeeNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Employee Name is required';
    }

    return null;
  }

  // Stores action output result for [Custom Action - shortNameAction] action in EmployeeName widget.
  String? getName;
  // State field(s) for MobileTextField widget.
  FocusNode? mobileTextFieldFocusNode;
  TextEditingController? mobileTextFieldTextController;
  String? Function(BuildContext, String?)?
      mobileTextFieldTextControllerValidator;
  String? _mobileTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a valid 10 digit mobile number';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }

    return null;
  }

  // State field(s) for SearchCode widget.
  FocusNode? searchCodeFocusNode;
  TextEditingController? searchCodeTextController;
  String? Function(BuildContext, String?)? searchCodeTextControllerValidator;
  // State field(s) for ShortName widget.
  FocusNode? shortNameFocusNode;
  TextEditingController? shortNameTextController;
  String? Function(BuildContext, String?)? shortNameTextControllerValidator;
  // State field(s) for Balence widget.
  FocusNode? balenceFocusNode;
  TextEditingController? balenceTextController;
  String? Function(BuildContext, String?)? balenceTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    employeeNameTextControllerValidator = _employeeNameTextControllerValidator;
    mobileTextFieldTextControllerValidator =
        _mobileTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    employeeNameFocusNode?.dispose();
    employeeNameTextController?.dispose();

    mobileTextFieldFocusNode?.dispose();
    mobileTextFieldTextController?.dispose();

    searchCodeFocusNode?.dispose();
    searchCodeTextController?.dispose();

    shortNameFocusNode?.dispose();
    shortNameTextController?.dispose();

    balenceFocusNode?.dispose();
    balenceTextController?.dispose();
  }
}
