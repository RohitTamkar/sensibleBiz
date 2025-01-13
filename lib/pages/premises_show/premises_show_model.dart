import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/premise/premise_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'premises_show_widget.dart' show PremisesShowWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PremisesShowModel extends FlutterFlowModel<PremisesShowWidget> {
  ///  Local state fields for this page.

  int? startLoop = 0;

  bool waitLoader = false;

  List<ProductRecord> prdList = [];
  void addToPrdList(ProductRecord item) => prdList.add(item);
  void removeFromPrdList(ProductRecord item) => prdList.remove(item);
  void removeAtIndexFromPrdList(int index) => prdList.removeAt(index);
  void insertAtIndexInPrdList(int index, ProductRecord item) =>
      prdList.insert(index, item);
  void updatePrdListAtIndex(int index, Function(ProductRecord) updateFn) =>
      prdList[index] = updateFn(prdList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PremisesShow widget.
  List<ProductRecord>? productDocs;
  // Stores action output result for [Custom Action - productDocToJsonList] action in PremisesShow widget.
  List<dynamic>? docsJson;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
