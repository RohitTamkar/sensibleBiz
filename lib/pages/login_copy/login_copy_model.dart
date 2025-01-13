import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'login_copy_widget.dart' show LoginCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginCopyModel extends FlutterFlowModel<LoginCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldNumber widget.
  FocusNode? textFieldNumberFocusNode1;
  TextEditingController? textFieldNumberTextController1;
  String? Function(BuildContext, String?)?
      textFieldNumberTextController1Validator;
  // State field(s) for TextFieldQuick widget.
  FocusNode? textFieldQuickFocusNode1;
  TextEditingController? textFieldQuickTextController1;
  late bool textFieldQuickVisibility1;
  String? Function(BuildContext, String?)?
      textFieldQuickTextController1Validator;
  // State field(s) for TextFieldNumber widget.
  FocusNode? textFieldNumberFocusNode2;
  TextEditingController? textFieldNumberTextController2;
  String? Function(BuildContext, String?)?
      textFieldNumberTextController2Validator;
  // State field(s) for TextFieldQuick widget.
  FocusNode? textFieldQuickFocusNode2;
  TextEditingController? textFieldQuickTextController2;
  late bool textFieldQuickVisibility2;
  String? Function(BuildContext, String?)?
      textFieldQuickTextController2Validator;

  @override
  void initState(BuildContext context) {
    textFieldQuickVisibility1 = false;
    textFieldQuickVisibility2 = false;
  }

  @override
  void dispose() {
    textFieldNumberFocusNode1?.dispose();
    textFieldNumberTextController1?.dispose();

    textFieldQuickFocusNode1?.dispose();
    textFieldQuickTextController1?.dispose();

    textFieldNumberFocusNode2?.dispose();
    textFieldNumberTextController2?.dispose();

    textFieldQuickFocusNode2?.dispose();
    textFieldQuickTextController2?.dispose();
  }
}
