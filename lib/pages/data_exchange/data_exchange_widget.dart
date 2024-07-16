import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/enter_passcode_compo/enter_passcode_compo_widget.dart';
import '/components/loader/loader_widget.dart';
import '/components/transfer_data_compo/transfer_data_compo_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
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
import 'data_exchange_model.dart';
export 'data_exchange_model.dart';

class DataExchangeWidget extends StatefulWidget {
  const DataExchangeWidget({super.key});

  @override
  State<DataExchangeWidget> createState() => _DataExchangeWidgetState();
}

class _DataExchangeWidgetState extends State<DataExchangeWidget> {
  late DataExchangeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DataExchangeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.wait = true;
      setState(() {});
      _model.wait = false;
      setState(() {});
      FFAppState().loopExcelDouble = 0.0;
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  Icons.chevron_left,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  if (isWeb) {
                                    context.pushNamed('Dashboard');
                                  } else {
                                    context.pushNamed('Account');

                                    return;
                                  }

                                  if (isWeb) {
                                    FFAppState().expDay = functions
                                        .setExpiryTime(getCurrentTimestamp);
                                    setState(() {});
                                  } else {
                                    return;
                                  }
                                },
                              ),
                              AutoSizeText(
                                'Data Exchange',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily),
                                    ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                borderWidth: 1.0,
                                buttonSize: 45.0,
                                icon: Icon(
                                  Icons.chevron_left,
                                  color: Colors.transparent,
                                  size: 30.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 23,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 0.0),
                          child: StreamBuilder<List<UserProfileRecord>>(
                            stream: queryUserProfileRecord(
                              queryBuilder: (userProfileRecord) =>
                                  userProfileRecord.where(
                                'mobile',
                                isEqualTo: FFAppState().currentMobile != ''
                                    ? FFAppState().currentMobile
                                    : null,
                              ),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingCircle(
                                      color:
                                          FlutterFlowTheme.of(context).warning,
                                      size: 50.0,
                                    ),
                                  ),
                                );
                              }
                              List<UserProfileRecord>
                                  containerUserProfileRecordList =
                                  snapshot.data!;

                              final containerUserProfileRecord =
                                  containerUserProfileRecordList.isNotEmpty
                                      ? containerUserProfileRecordList.first
                                      : null;
                              return Container(
                                width: double.infinity,
                                height: MediaQuery.sizeOf(context).height * 0.8,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: PagedListView<DocumentSnapshot<Object?>?,
                                    OutletRecord>(
                                  pagingController:
                                      _model.setListViewController(
                                    OutletRecord.collection
                                        .whereIn(
                                            'id',
                                            containerUserProfileRecord
                                                        ?.outlets !=
                                                    ''
                                                ? containerUserProfileRecord
                                                    ?.outlets
                                                : null)
                                        .where(
                                          'id',
                                          isNotEqualTo:
                                              FFAppState().outletRef?.id != ''
                                                  ? FFAppState().outletRef?.id
                                                  : null,
                                        ),
                                  ),
                                  padding: EdgeInsets.zero,
                                  reverse: false,
                                  scrollDirection: Axis.vertical,
                                  builderDelegate:
                                      PagedChildBuilderDelegate<OutletRecord>(
                                    // Customize what your widget looks like when it's loading the first page.
                                    firstPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitFadingCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),
                                    // Customize what your widget looks like when it's loading another page.
                                    newPageProgressIndicatorBuilder: (_) =>
                                        Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitFadingCircle(
                                          color: FlutterFlowTheme.of(context)
                                              .warning,
                                          size: 50.0,
                                        ),
                                      ),
                                    ),

                                    itemBuilder: (context, _, listViewIndex) {
                                      final listViewOutletRecord = _model
                                          .listViewPagingController!
                                          .itemList![listViewIndex];
                                      return Builder(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            if (isWeb) {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.6,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.5,
                                                          child:
                                                              EnterPasscodeCompoWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () => _model
                                                                .unfocusNode
                                                                .canRequestFocus
                                                            ? FocusScope.of(
                                                                    context)
                                                                .requestFocus(_model
                                                                    .unfocusNode)
                                                            : FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.4,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.9,
                                                          child:
                                                              EnterPasscodeCompoWidget(),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            }

                                            if (FFAppState().flag) {
                                              if (isWeb) {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.6,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.5,
                                                            child:
                                                                TransferDataCompoWidget(
                                                              selectedOutletName:
                                                                  listViewOutletRecord
                                                                      .name,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () => _model
                                                                  .unfocusNode
                                                                  .canRequestFocus
                                                              ? FocusScope.of(
                                                                      context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode)
                                                              : FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Container(
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.3,
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            child:
                                                                TransferDataCompoWidget(
                                                              selectedOutletName:
                                                                  listViewOutletRecord
                                                                      .name,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then(
                                                    (value) => setState(() {}));
                                              }

                                              if (FFAppState().falg2 == true) {
                                                _model.outletId =
                                                    listViewOutletRecord
                                                        .reference;
                                                _model.startLoop = 0;
                                                setState(() {});
                                                _model.wait = true;
                                                setState(() {});
                                                _model.selectedCat =
                                                    await queryCategoryRecordOnce(
                                                  parent: _model.outletId,
                                                );
                                                _model.mainCat =
                                                    await queryCategoryRecordOnce(
                                                  parent:
                                                      FFAppState().outletRef,
                                                );
                                                _model.currentPrd =
                                                    await queryProductRecordOnce(
                                                  parent:
                                                      FFAppState().outletRef,
                                                );
                                                _model.selectedPrd =
                                                    await queryProductRecordOnce(
                                                  parent: _model.outletId,
                                                );
                                                while (_model.startLoop! <
                                                    _model
                                                        .selectedCat!.length) {
                                                  _model.res = await actions
                                                      .categoryDupActionbyName(
                                                    _model
                                                        .selectedCat?[
                                                            _model.startLoop!]
                                                        ?.name,
                                                    _model.mainCat!.toList(),
                                                  );
                                                  if (_model.res != true) {
                                                    await CategoryRecord
                                                            .createDoc(
                                                                FFAppState()
                                                                    .outletRef!)
                                                        .set(
                                                            createCategoryRecordData(
                                                      id: _model
                                                          .selectedCat?[
                                                              _model.startLoop!]
                                                          ?.reference
                                                          .id,
                                                      categoryNo: _model
                                                          .selectedCat?[
                                                              _model.startLoop!]
                                                          ?.categoryNo,
                                                      name: _model
                                                          .selectedCat?[
                                                              _model.startLoop!]
                                                          ?.name,
                                                      onlineSynced: _model
                                                          .selectedCat?[
                                                              _model.startLoop!]
                                                          ?.onlineSynced,
                                                      regionalName: _model
                                                          .selectedCat?[
                                                              _model.startLoop!]
                                                          ?.regionalName,
                                                      type: _model
                                                          .selectedCat?[
                                                              _model.startLoop!]
                                                          ?.type,
                                                    ));
                                                  }
                                                  _model.startLoop =
                                                      _model.startLoop! + 1;
                                                  setState(() {});
                                                }
                                                _model.startLoop = 0;
                                                setState(() {});
                                                while (_model.startLoop! <
                                                    _model
                                                        .selectedPrd!.length) {
                                                  _model.res1 = await actions
                                                      .productDupAction(
                                                    _model
                                                        .selectedPrd?[
                                                            _model.startLoop!]
                                                        ?.id,
                                                    _model.currentPrd!.toList(),
                                                  );
                                                  if (_model.res1 == true) {
                                                    _model.startLoop =
                                                        _model.startLoop! + 1;
                                                    setState(() {});
                                                  } else {
                                                    var productRecordReference =
                                                        ProductRecord.createDoc(
                                                            FFAppState()
                                                                .outletRef!);
                                                    await productRecordReference
                                                        .set(
                                                            createProductRecordData(
                                                      id: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.id,
                                                      active: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.active,
                                                      barcode: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.barcode,
                                                      category: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.category,
                                                      cess: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.cess,
                                                      code: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.code,
                                                      costPrice: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.costPrice,
                                                      dateTme: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.dateTme,
                                                      discount: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.discount,
                                                      keyCount: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.keyCount,
                                                      kitchenId: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.kitchenId,
                                                      mrpPrice: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.mrpPrice,
                                                      name: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.name,
                                                      onlinePrice: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.onlinePrice,
                                                      onlineSynced: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.onlineSynced,
                                                      price: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.price,
                                                      priceTable: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.priceTable,
                                                      recipeId: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.recipeId,
                                                      regionalName: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.regionalName,
                                                      reorderLevel: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.reorderLevel,
                                                      selected: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.selected,
                                                      shortName: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.shortName,
                                                      stockable: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.stockable,
                                                      taxIndex: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.taxIndex,
                                                      type: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.type,
                                                      unitId: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.unitId,
                                                      weighable: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.weighable,
                                                      currentStock: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.currentStock,
                                                      hsnCode: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.hsnCode,
                                                      discountAmount: _model
                                                          .selectedPrd?[
                                                              _model.startLoop!]
                                                          ?.discountAmount,
                                                    ));
                                                    _model.createdPrd = ProductRecord
                                                        .getDocumentFromData(
                                                            createProductRecordData(
                                                              id: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.id,
                                                              active: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.active,
                                                              barcode: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.barcode,
                                                              category: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.category,
                                                              cess: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.cess,
                                                              code: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.code,
                                                              costPrice: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.costPrice,
                                                              dateTme: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.dateTme,
                                                              discount: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.discount,
                                                              keyCount: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.keyCount,
                                                              kitchenId: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.kitchenId,
                                                              mrpPrice: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.mrpPrice,
                                                              name: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.name,
                                                              onlinePrice: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.onlinePrice,
                                                              onlineSynced: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.onlineSynced,
                                                              price: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.price,
                                                              priceTable: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.priceTable,
                                                              recipeId: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.recipeId,
                                                              regionalName: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.regionalName,
                                                              reorderLevel: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.reorderLevel,
                                                              selected: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.selected,
                                                              shortName: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.shortName,
                                                              stockable: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.stockable,
                                                              taxIndex: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.taxIndex,
                                                              type: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.type,
                                                              unitId: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.unitId,
                                                              weighable: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.weighable,
                                                              currentStock: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.currentStock,
                                                              hsnCode: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.hsnCode,
                                                              discountAmount: _model
                                                                  .selectedPrd?[
                                                                      _model
                                                                          .startLoop!]
                                                                  ?.discountAmount,
                                                            ),
                                                            productRecordReference);
                                                    _model.startLoop =
                                                        _model.startLoop! + 1;
                                                    setState(() {});
                                                  }
                                                }
                                                _model.catIdUp =
                                                    await queryCategoryRecordOnce(
                                                  parent:
                                                      FFAppState().outletRef,
                                                );
                                                _model.prdLst2 =
                                                    await queryProductRecordOnce(
                                                  parent:
                                                      FFAppState().outletRef,
                                                );
                                                _model.startLoop = 0;
                                                setState(() {});
                                                while (_model.startLoop! <
                                                    _model.prdLst2!.length) {
                                                  _model.str =
                                                      await actions.mapCatToPrd(
                                                    _model.prdLst2![
                                                        _model.startLoop!],
                                                    _model.catIdUp!.toList(),
                                                    _model.startLoop!,
                                                  );

                                                  await _model
                                                      .prdLst2![
                                                          _model.startLoop!]
                                                      .reference
                                                      .update(
                                                          createProductRecordData(
                                                    category: _model.str,
                                                  ));
                                                  _model.startLoop =
                                                      _model.startLoop! + 1;
                                                  setState(() {});
                                                }
                                                _model.startLoop = 0;
                                                setState(() {});
                                                while (_model.startLoop! <
                                                    _model.catIdUp!.length) {
                                                  await _model
                                                      .catIdUp![
                                                          _model.startLoop!]
                                                      .reference
                                                      .update(
                                                          createCategoryRecordData(
                                                    id: _model
                                                        .catIdUp?[
                                                            _model.startLoop!]
                                                        ?.reference
                                                        .id,
                                                  ));
                                                  _model.startLoop =
                                                      _model.startLoop! + 1;
                                                  setState(() {});
                                                }
                                                _model.wait = false;
                                                _model.startLoop = 0;
                                                setState(() {});
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return WebViewAware(
                                                      child: AlertDialog(
                                                        title: Text(
                                                            'Data transfer successful'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    alertDialogContext),
                                                            child: Text('Ok'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                              }
                                            }

                                            setState(() {});
                                          },
                                          onLongPress: () async {},
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      listViewOutletRecord.name,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLargeFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Text(
                                                      listViewOutletRecord
                                                          .branch,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderRadius: 20.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 24.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (_model.wait)
              Opacity(
                opacity: 0.3,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
              ),
            if (_model.wait)
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.45,
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.loaderModel,
                    updateCallback: () => setState(() {}),
                    child: LoaderWidget(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
