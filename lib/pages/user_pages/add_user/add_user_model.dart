import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_user_widget.dart' show AddUserWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddUserModel extends FlutterFlowModel<AddUserWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode;
  TextEditingController? textFieldNameTextController;
  String? Function(BuildContext, String?)? textFieldNameTextControllerValidator;
  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode;
  TextEditingController? textFieldMobileTextController;
  String? Function(BuildContext, String?)?
      textFieldMobileTextControllerValidator;
  // State field(s) for TextFieldMobilenew widget.
  FocusNode? textFieldMobilenewFocusNode;
  TextEditingController? textFieldMobilenewTextController;
  String? Function(BuildContext, String?)?
      textFieldMobilenewTextControllerValidator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode;
  TextEditingController? textFieldEmailTextController;
  String? Function(BuildContext, String?)?
      textFieldEmailTextControllerValidator;
  // State field(s) for PINTextField widget.
  FocusNode? pINTextFieldFocusNode;
  TextEditingController? pINTextFieldTextController;
  late bool pINTextFieldVisibility;
  String? Function(BuildContext, String?)? pINTextFieldTextControllerValidator;
  // State field(s) for ReportCheck widget.
  bool? reportCheckValue;
  // State field(s) for settingCheck widget.
  bool? settingCheckValue;
  // State field(s) for stockout widget.
  bool? stockoutValue;
  // State field(s) for paymentCheckbox widget.
  bool? paymentCheckboxValue;
  // State field(s) for ProdcutAddCheckbox widget.
  bool? prodcutAddCheckboxValue;
  // State field(s) for EditBillCheckbox widget.
  bool? editBillCheckboxValue;
  // State field(s) for shiftReportCheckbox widget.
  bool? shiftReportCheckboxValue;
  // State field(s) for GoodsReceivedCheckbox widget.
  bool? goodsReceivedCheckboxValue;
  // State field(s) for bizAppCheckbox widget.
  bool? bizAppCheckboxValue;
  // State field(s) for KOTmodifyCheckbox widget.
  bool? kOTmodifyCheckboxValue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserProfileRecord? userDoc;

  @override
  void initState(BuildContext context) {
    pINTextFieldVisibility = false;
  }

  @override
  void dispose() {
    textFieldNameFocusNode?.dispose();
    textFieldNameTextController?.dispose();

    textFieldMobileFocusNode?.dispose();
    textFieldMobileTextController?.dispose();

    textFieldMobilenewFocusNode?.dispose();
    textFieldMobilenewTextController?.dispose();

    textFieldEmailFocusNode?.dispose();
    textFieldEmailTextController?.dispose();

    pINTextFieldFocusNode?.dispose();
    pINTextFieldTextController?.dispose();
  }
}
