import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_customer_widget.dart' show AddCustomerWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddCustomerModel extends FlutterFlowModel<AddCustomerWidget> {
  ///  Local state fields for this page.

  bool wait = false;

  String? birthday;

  String? anniversary;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CustomerRecord? createdCust;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for MobileNumber widget.
  FocusNode? mobileNumberFocusNode;
  TextEditingController? mobileNumberTextController;
  String? Function(BuildContext, String?)? mobileNumberTextControllerValidator;
  String? _mobileNumberTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for AlternateNumber widget.
  FocusNode? alternateNumberFocusNode;
  TextEditingController? alternateNumberTextController;
  String? Function(BuildContext, String?)?
      alternateNumberTextControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for GSTNumber widget.
  FocusNode? gSTNumberFocusNode;
  TextEditingController? gSTNumberTextController;
  String? Function(BuildContext, String?)? gSTNumberTextControllerValidator;
  // State field(s) for Address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for creditLimit widget.
  FocusNode? creditLimitFocusNode;
  TextEditingController? creditLimitTextController;
  String? Function(BuildContext, String?)? creditLimitTextControllerValidator;
  // State field(s) for dayLimit widget.
  FocusNode? dayLimitFocusNode;
  TextEditingController? dayLimitTextController;
  String? Function(BuildContext, String?)? dayLimitTextControllerValidator;
  // State field(s) for OldBalence widget.
  FocusNode? oldBalenceFocusNode;
  TextEditingController? oldBalenceTextController;
  String? Function(BuildContext, String?)? oldBalenceTextControllerValidator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    mobileNumberTextControllerValidator = _mobileNumberTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    mobileNumberFocusNode?.dispose();
    mobileNumberTextController?.dispose();

    alternateNumberFocusNode?.dispose();
    alternateNumberTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    gSTNumberFocusNode?.dispose();
    gSTNumberTextController?.dispose();

    addressFocusNode?.dispose();
    addressTextController?.dispose();

    creditLimitFocusNode?.dispose();
    creditLimitTextController?.dispose();

    dayLimitFocusNode?.dispose();
    dayLimitTextController?.dispose();

    oldBalenceFocusNode?.dispose();
    oldBalenceTextController?.dispose();
  }
}
