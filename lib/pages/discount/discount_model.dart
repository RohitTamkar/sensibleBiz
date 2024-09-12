import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'discount_widget.dart' show DiscountWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DiscountModel extends FlutterFlowModel<DiscountWidget> {
  ///  Local state fields for this page.

  ProductRecord? listprd;

  bool updateStatus = false;

  bool selectAllBoolean = false;

  bool waitUpload = false;

  bool all = false;

  String idString = '';

  String selectedId = '';

  int? startLoop = 0;

  int discValue = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Discount widget.
  List<ProductRecord>? products;
  // Stores action output result for [Custom Action - updateDiscountToJson] action in Discount widget.
  List<dynamic>? json;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductRecord>? products2;
  // Stores action output result for [Custom Action - updateDiscountToJson] action in Button widget.
  List<dynamic>? json2;
  // Stores action output result for [Firestore Query - Query a collection] action in ContainerButton widget.
  List<ProductRecord>? products1;
  // Stores action output result for [Custom Action - updateDiscountToJson] action in ContainerButton widget.
  List<dynamic>? jsonbyCat;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for SelectAllCheckbox widget.
  bool? selectAllCheckboxValue;
  // Stores action output result for [Custom Action - updateAddDiscountAction] action in SelectAllCheckbox widget.
  List<dynamic>? result2;
  // Stores action output result for [Custom Action - updateAddDiscountAction] action in SelectAllCheckbox widget.
  List<dynamic>? result;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Custom Action - selectCheckboxDiscountSIngle] action in Checkbox widget.
  List<dynamic>? result3;
  // Stores action output result for [Custom Action - selectCheckboxDiscountSIngle] action in Checkbox widget.
  List<dynamic>? result1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
