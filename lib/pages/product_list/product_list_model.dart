import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/enter_passcode_compo/enter_passcode_compo_widget.dart';
import '/components/loader/loader_widget.dart';
import '/components/no_data/no_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_list_widget.dart' show ProductListWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ProductListModel extends FlutterFlowModel<ProductListWidget> {
  ///  Local state fields for this page.

  List<ProductRecord> getProductDoc = [];
  void addToGetProductDoc(ProductRecord item) => getProductDoc.add(item);
  void removeFromGetProductDoc(ProductRecord item) =>
      getProductDoc.remove(item);
  void removeAtIndexFromGetProductDoc(int index) =>
      getProductDoc.removeAt(index);
  void insertAtIndexInGetProductDoc(int index, ProductRecord item) =>
      getProductDoc.insert(index, item);
  void updateGetProductDocAtIndex(
          int index, Function(ProductRecord) updateFn) =>
      getProductDoc[index] = updateFn(getProductDoc[index]);

  String category = 'all';

  bool all = false;

  String? selectedId;

  List<ProductRecord> storePrd = [];
  void addToStorePrd(ProductRecord item) => storePrd.add(item);
  void removeFromStorePrd(ProductRecord item) => storePrd.remove(item);
  void removeAtIndexFromStorePrd(int index) => storePrd.removeAt(index);
  void insertAtIndexInStorePrd(int index, ProductRecord item) =>
      storePrd.insert(index, item);
  void updateStorePrdAtIndex(int index, Function(ProductRecord) updateFn) =>
      storePrd[index] = updateFn(storePrd[index]);

  bool? regional;

  bool catServPtBool = false;

  bool servicePtBool = false;

  String? catIdServPt;

  List<ProductRecord> prdForServPt = [];
  void addToPrdForServPt(ProductRecord item) => prdForServPt.add(item);
  void removeFromPrdForServPt(ProductRecord item) => prdForServPt.remove(item);
  void removeAtIndexFromPrdForServPt(int index) => prdForServPt.removeAt(index);
  void insertAtIndexInPrdForServPt(int index, ProductRecord item) =>
      prdForServPt.insert(index, item);
  void updatePrdForServPtAtIndex(int index, Function(ProductRecord) updateFn) =>
      prdForServPt[index] = updateFn(prdForServPt[index]);

  bool waitLoader = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ProductList widget.
  List<ProductRecord>? prdList;
  // Stores action output result for [Custom Action - sortProducts] action in ProductList widget.
  List<ProductRecord>? sortedList;
  // Stores action output result for [Firestore Query - Query a collection] action in ProductList widget.
  List<ServicePointRecord>? servicePtQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductRecord>? prdListCopy;
  // Stores action output result for [Custom Action - sortProducts] action in Button widget.
  List<ProductRecord>? sortedListCopy;
  // Stores action output result for [Custom Action - genarateProductCode1] action in Button widget.
  int? productCode;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ProductRecord>? prdListNew;
  // Stores action output result for [Custom Action - sortProducts] action in Button widget.
  List<ProductRecord>? sortedListweb;
  // Stores action output result for [Custom Action - genarateProductCode1] action in Button widget.
  int? productList1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Stores action output result for [Custom Action - sortProducts] action in Row widget.
  List<ProductRecord>? sortedList2;
  // Stores action output result for [Custom Action - sortProducts] action in Row widget.
  List<ProductRecord>? sortedList3;
  // Stores action output result for [Custom Action - sortProducts] action in Row widget.
  List<ProductRecord>? sortedList4;
  // Model for loader component.
  late LoaderModel loaderModel;

  @override
  void initState(BuildContext context) {
    loaderModel = createModel(context, () => LoaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableExpandableController.dispose();
    loaderModel.dispose();
  }
}
