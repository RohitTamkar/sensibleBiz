import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
  // Stores action output result for [Custom Action - login] action in Button widget.
  bool? res;
  // Stores action output result for [Custom Action - login] action in Button widget.
  bool? res11;
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
  // Stores action output result for [Custom Action - login] action in Button widget.
  bool? res1;
  // Stores action output result for [Custom Action - login] action in Button widget.
  bool? res15;

  @override
  void initState(BuildContext context) {
    textFieldQuickVisibility1 = false;
    textFieldQuickVisibility2 = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
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
