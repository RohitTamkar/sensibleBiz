import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/no_data/no_data_widget.dart';
import '/components/requested_stock_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'stock_update_transfer_widget.dart' show StockUpdateTransferWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class StockUpdateTransferModel
    extends FlutterFlowModel<StockUpdateTransferWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in StockUpdateTransfer widget.
  UserProfileRecord? user;
  // State field(s) for DropDownNew widget.
  String? dropDownNewValue;
  FormFieldController<String>? dropDownNewValueController;
  // Stores action output result for [Custom Action - selectedProductList] action in DropDownNew widget.
  dynamic? resCopy;
  // Stores action output result for [Custom Action - checkDuplicatCartItem] action in DropDownNew widget.
  List<dynamic>? addResult;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - decrementStock] action in IconButton widget.
  dynamic? res2Copy;
  // Stores action output result for [Custom Action - incrementStock] action in IconButton widget.
  List<dynamic>? res1Copy;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<StockLogRecord>? issueDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<StockLogRecord>? issueDoctranfer;
  // Stores action output result for [Custom Action - addToCart] action in Button widget.
  dynamic? cartREsult;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ProductRecord? prdfromaddupdatestock;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
