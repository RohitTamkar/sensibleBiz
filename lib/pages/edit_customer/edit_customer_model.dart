import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_customer_widget.dart' show EditCustomerWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditCustomerModel extends FlutterFlowModel<EditCustomerWidget> {
  ///  Local state fields for this page.

  bool wait = false;

  String? shortNamePS;

  String? birthday;

  String? anniversPs;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for GSTnum widget.
  FocusNode? gSTnumFocusNode;
  TextEditingController? gSTnumTextController;
  String? Function(BuildContext, String?)? gSTnumTextControllerValidator;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    employeeNameTextControllerValidator = _employeeNameTextControllerValidator;
    mobileTextFieldTextControllerValidator =
        _mobileTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    employeeNameFocusNode?.dispose();
    employeeNameTextController?.dispose();

    mobileTextFieldFocusNode?.dispose();
    mobileTextFieldTextController?.dispose();

    searchCodeFocusNode?.dispose();
    searchCodeTextController?.dispose();

    shortNameFocusNode?.dispose();
    shortNameTextController?.dispose();

    gSTnumFocusNode?.dispose();
    gSTnumTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();
  }
}
