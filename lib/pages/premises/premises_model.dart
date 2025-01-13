import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_data/no_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'premises_widget.dart' show PremisesWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PremisesModel extends FlutterFlowModel<PremisesWidget> {
  ///  Local state fields for this page.

  bool deleteAllb = false;

  List<PremisesRecord> localPrewmises = [];
  void addToLocalPrewmises(PremisesRecord item) => localPrewmises.add(item);
  void removeFromLocalPrewmises(PremisesRecord item) =>
      localPrewmises.remove(item);
  void removeAtIndexFromLocalPrewmises(int index) =>
      localPrewmises.removeAt(index);
  void insertAtIndexInLocalPrewmises(int index, PremisesRecord item) =>
      localPrewmises.insert(index, item);
  void updateLocalPrewmisesAtIndex(
          int index, Function(PremisesRecord) updateFn) =>
      localPrewmises[index] = updateFn(localPrewmises[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Premises widget.
  List<PremisesRecord>? fetchedPrem;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
