import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'tax_settings_widget.dart' show TaxSettingsWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class TaxSettingsModel extends FlutterFlowModel<TaxSettingsWidget> {
  ///  Local state fields for this page.

  ProductRecord? listprd;

  bool updateStatus = false;

  bool selectAllBoolean = false;

  bool waitUpload = false;

  bool all = false;

  String idString = '';

  String selectedId = '';

  int? startLoop = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in taxSettings widget.
  List<ProductRecord>? products1;
  // Stores action output result for [Custom Action - docsToJsonforTax] action in taxSettings widget.
  List<dynamic>? jsonbyCat;
  // Stores action output result for [Firestore Query - Query a collection] action in taxSettings widget.
  List<ProductRecord>? products6;
  // Stores action output result for [Custom Action - docsToJsonforTax] action in taxSettings widget.
  List<dynamic>? json1;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - getTaxIdCopy] action in DropDown widget.
  int? taxIndexOutput;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductRecord>? products12;
  // Stores action output result for [Custom Action - docsToJsonforTax] action in Button widget.
  List<dynamic>? json12;
  // Stores action output result for [Firestore Query - Query a collection] action in ContainerButton widget.
  List<ProductRecord>? productscat;
  // Stores action output result for [Custom Action - docsToJsonforTax] action in ContainerButton widget.
  List<dynamic>? jsonbyCat1;
  // State field(s) for SelectAllCheckbox widget.
  bool? selectAllCheckboxValue;
  // Stores action output result for [Custom Action - selectCheckboxTaxAll] action in SelectAllCheckbox widget.
  List<dynamic>? result2;
  // Stores action output result for [Custom Action - selectCheckboxTaxAll] action in SelectAllCheckbox widget.
  List<dynamic>? result;
  // State field(s) for Checkbox widget.
  Map<dynamic, bool> checkboxValueMap = {};
  List<dynamic> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Custom Action - selectCheckboxTaxSIngle] action in Checkbox widget.
  List<dynamic>? result1;
  // Stores action output result for [Custom Action - selectCheckboxTaxSIngle] action in Checkbox widget.
  List<dynamic>? result3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
