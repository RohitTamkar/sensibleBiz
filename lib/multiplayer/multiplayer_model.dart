import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'multiplayer_widget.dart' show MultiplayerWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MultiplayerModel extends FlutterFlowModel<MultiplayerWidget> {
  ///  Local state fields for this page.

  List<MultipliersListStruct> multi = [];
  void addToMulti(MultipliersListStruct item) => multi.add(item);
  void removeFromMulti(MultipliersListStruct item) => multi.remove(item);
  void removeAtIndexFromMulti(int index) => multi.removeAt(index);
  void insertAtIndexInMulti(int index, MultipliersListStruct item) =>
      multi.insert(index, item);
  void updateMultiAtIndex(
          int index, Function(MultipliersListStruct) updateFn) =>
      multi[index] = updateFn(multi[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  MultipliersRecord? ref;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
