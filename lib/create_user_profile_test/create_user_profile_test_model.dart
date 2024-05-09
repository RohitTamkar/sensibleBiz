import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_user_profile_test_widget.dart' show CreateUserProfileTestWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CreateUserProfileTestModel
    extends FlutterFlowModel<CreateUserProfileTestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode1;
  TextEditingController? textFieldNameTextController1;
  String? Function(BuildContext, String?)?
      textFieldNameTextController1Validator;
  String? _textFieldNameTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode1;
  TextEditingController? textFieldMobileTextController1;
  String? Function(BuildContext, String?)?
      textFieldMobileTextController1Validator;
  String? _textFieldMobileTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode2;
  TextEditingController? textFieldMobileTextController2;
  String? Function(BuildContext, String?)?
      textFieldMobileTextController2Validator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode1;
  TextEditingController? textFieldEmailTextController1;
  String? Function(BuildContext, String?)?
      textFieldEmailTextController1Validator;
  // State field(s) for PINTextField widget.
  FocusNode? pINTextFieldFocusNode1;
  TextEditingController? pINTextFieldTextController1;
  late bool pINTextFieldVisibility1;
  String? Function(BuildContext, String?)? pINTextFieldTextController1Validator;
  String? _pINTextFieldTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Custom Action - platformDetails] action in Button widget.
  String? did;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserProfileRecord? doc;
  // State field(s) for TextFieldName widget.
  FocusNode? textFieldNameFocusNode2;
  TextEditingController? textFieldNameTextController2;
  String? Function(BuildContext, String?)?
      textFieldNameTextController2Validator;
  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode3;
  TextEditingController? textFieldMobileTextController3;
  String? Function(BuildContext, String?)?
      textFieldMobileTextController3Validator;
  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode4;
  TextEditingController? textFieldMobileTextController4;
  String? Function(BuildContext, String?)?
      textFieldMobileTextController4Validator;
  // State field(s) for TextFieldEmail widget.
  FocusNode? textFieldEmailFocusNode2;
  TextEditingController? textFieldEmailTextController2;
  String? Function(BuildContext, String?)?
      textFieldEmailTextController2Validator;
  // State field(s) for PINTextField widget.
  FocusNode? pINTextFieldFocusNode2;
  TextEditingController? pINTextFieldTextController2;
  late bool pINTextFieldVisibility2;
  String? Function(BuildContext, String?)? pINTextFieldTextController2Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  UserProfileRecord? doc1;

  @override
  void initState(BuildContext context) {
    textFieldNameTextController1Validator =
        _textFieldNameTextController1Validator;
    textFieldMobileTextController1Validator =
        _textFieldMobileTextController1Validator;
    pINTextFieldVisibility1 = false;
    pINTextFieldTextController1Validator =
        _pINTextFieldTextController1Validator;
    pINTextFieldVisibility2 = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldNameFocusNode1?.dispose();
    textFieldNameTextController1?.dispose();

    textFieldMobileFocusNode1?.dispose();
    textFieldMobileTextController1?.dispose();

    textFieldMobileFocusNode2?.dispose();
    textFieldMobileTextController2?.dispose();

    textFieldEmailFocusNode1?.dispose();
    textFieldEmailTextController1?.dispose();

    pINTextFieldFocusNode1?.dispose();
    pINTextFieldTextController1?.dispose();

    textFieldNameFocusNode2?.dispose();
    textFieldNameTextController2?.dispose();

    textFieldMobileFocusNode3?.dispose();
    textFieldMobileTextController3?.dispose();

    textFieldMobileFocusNode4?.dispose();
    textFieldMobileTextController4?.dispose();

    textFieldEmailFocusNode2?.dispose();
    textFieldEmailTextController2?.dispose();

    pINTextFieldFocusNode2?.dispose();
    pINTextFieldTextController2?.dispose();
  }
}
