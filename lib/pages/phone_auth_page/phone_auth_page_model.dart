import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'phone_auth_page_widget.dart' show PhoneAuthPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneAuthPageModel extends FlutterFlowModel<PhoneAuthPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldNumber widget.
  FocusNode? textFieldNumberFocusNode;
  TextEditingController? textFieldNumberTextController;
  String? Function(BuildContext, String?)?
      textFieldNumberTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldNumberFocusNode?.dispose();
    textFieldNumberTextController?.dispose();
  }
}
