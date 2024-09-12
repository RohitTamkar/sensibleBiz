import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'stock_weight_combine_page_widget.dart'
    show StockWeightCombinePageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StockWeightCombinePageModel
    extends FlutterFlowModel<StockWeightCombinePageWidget> {
  ///  Local state fields for this page.

  List<ProductRecord> prdList = [];
  void addToPrdList(ProductRecord item) => prdList.add(item);
  void removeFromPrdList(ProductRecord item) => prdList.remove(item);
  void removeAtIndexFromPrdList(int index) => prdList.removeAt(index);
  void insertAtIndexInPrdList(int index, ProductRecord item) =>
      prdList.insert(index, item);
  void updatePrdListAtIndex(int index, Function(ProductRecord) updateFn) =>
      prdList[index] = updateFn(prdList[index]);

  List<dynamic> prdJson = [];
  void addToPrdJson(dynamic item) => prdJson.add(item);
  void removeFromPrdJson(dynamic item) => prdJson.remove(item);
  void removeAtIndexFromPrdJson(int index) => prdJson.removeAt(index);
  void insertAtIndexInPrdJson(int index, dynamic item) =>
      prdJson.insert(index, item);
  void updatePrdJsonAtIndex(int index, Function(dynamic) updateFn) =>
      prdJson[index] = updateFn(prdJson[index]);

  int? startLoop = 0;

  bool waitLoader = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in stockWeightCombinePage widget.
  List<ProductRecord>? products;
  // Stores action output result for [Custom Action - docsToJson] action in stockWeightCombinePage widget.
  List<dynamic>? json;
  // State field(s) for StockableCheckbox widget.
  bool? stockableCheckboxValue;
  // Stores action output result for [Custom Action - selectCheckbox] action in StockableCheckbox widget.
  List<dynamic>? result;
  // Stores action output result for [Custom Action - selectCheckbox] action in StockableCheckbox widget.
  List<dynamic>? resultcopy;
  // State field(s) for WeightableCheckbox widget.
  bool? weightableCheckboxValue;
  // Stores action output result for [Custom Action - selectCheckbox] action in WeightableCheckbox widget.
  List<dynamic>? result1;
  // Stores action output result for [Custom Action - selectCheckbox] action in WeightableCheckbox widget.
  List<dynamic>? result1Copy;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap1 = {};
  List<dynamic> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Custom Action - selectCheckboxCopy] action in Checkbox widget.
  List<dynamic>? checkBoxClick;
  // Stores action output result for [Custom Action - selectCheckboxCopy] action in Checkbox widget.
  List<dynamic>? checkBoxClickCopy;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap2 = {};
  List<dynamic> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // Stores action output result for [Custom Action - selectCheckboxCopy] action in Checkbox widget.
  List<dynamic>? checkBoxClick1;
  // Stores action output result for [Custom Action - selectCheckboxCopy] action in Checkbox widget.
  List<dynamic>? checkBoxClickCopy2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
