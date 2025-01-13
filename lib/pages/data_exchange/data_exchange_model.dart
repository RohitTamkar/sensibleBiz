import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/enter_passcode_compo/enter_passcode_compo_widget.dart';
import '/components/loader/loader_widget.dart';
import '/components/transfer_data_compo/transfer_data_compo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'data_exchange_widget.dart' show DataExchangeWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DataExchangeModel extends FlutterFlowModel<DataExchangeWidget> {
  ///  Local state fields for this page.

  DocumentReference? outletId;

  List<CategoryRecord> categories = [];
  void addToCategories(CategoryRecord item) => categories.add(item);
  void removeFromCategories(CategoryRecord item) => categories.remove(item);
  void removeAtIndexFromCategories(int index) => categories.removeAt(index);
  void insertAtIndexInCategories(int index, CategoryRecord item) =>
      categories.insert(index, item);
  void updateCategoriesAtIndex(int index, Function(CategoryRecord) updateFn) =>
      categories[index] = updateFn(categories[index]);

  int? startLoop;

  int jLoop = 0;

  bool wait = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, OutletRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CategoryRecord>? selectedCat;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CategoryRecord>? mainCat;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ProductRecord>? currentPrd;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ProductRecord>? selectedPrd;
  // Stores action output result for [Custom Action - categoryDupActionbyName] action in Container widget.
  bool? res;
  // Stores action output result for [Custom Action - productDupAction] action in Container widget.
  bool? res1;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ProductRecord? createdPrd;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CategoryRecord>? catIdUp;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ProductRecord>? prdLst2;
  // Stores action output result for [Custom Action - mapCatToPrd] action in Container widget.
  String? str;
  // Model for loader component.
  late LoaderModel loaderModel;

  @override
  void initState(BuildContext context) {
    loaderModel = createModel(context, () => LoaderModel());
  }

  @override
  void dispose() {
    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    loaderModel.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, OutletRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, OutletRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, OutletRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryOutletRecordPage(
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
