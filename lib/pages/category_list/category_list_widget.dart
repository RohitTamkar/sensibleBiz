import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/no_data/no_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'category_list_model.dart';
export 'category_list_model.dart';

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({
    super.key,
    this.outletId,
    this.outletDetails,
  });

  final DocumentReference? outletId;
  final OutletRecord? outletDetails;

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  late CategoryListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        body: StreamBuilder<List<CategoryRecord>>(
          stream: queryCategoryRecord(
            parent: FFAppState().outletRef,
            queryBuilder: (categoryRecord) =>
                categoryRecord.orderBy('categoryNo'),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitFadingCircle(
                    color: FlutterFlowTheme.of(context).warning,
                    size: 50.0,
                  ),
                ),
              );
            }
            List<CategoryRecord> containerCategoryRecordList = snapshot.data!;

            return Container(
              decoration: BoxDecoration(),
              child: Column(
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

                                      FFAppState().expDay = functions
                                          .setExpiryTime(getCurrentTimestamp);
                                      safeSetState(() {});
                                    } else {
                                      context.pushNamed('MastersPage');

                                      return;
                                    }
                                  },
                                ),
                                AutoSizeText(
                                  'Category List',
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
                  if (responsiveVisibility(
                    context: context,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    Expanded(
                      flex: 29,
                      child: Container(
                        width: double.infinity,
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
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Builder(
                                    builder: (context) {
                                      final catListM =
                                          containerCategoryRecordList.toList();
                                      if (catListM.isEmpty) {
                                        return Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: NoDataWidget(),
                                        );
                                      }

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: catListM.length,
                                        itemBuilder: (context, catListMIndex) {
                                          final catListMItem =
                                              catListM[catListMIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.075,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.065,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.065,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    catListMItem
                                                                        .categoryNo
                                                                        .toString(),
                                                                    '1',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.001,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.05,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.6,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.065,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            15.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  catListMItem
                                                                      .name,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons.mode_edit,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 20.0,
                                                            ),
                                                            showLoadingIndicator:
                                                                true,
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                'EditCategory',
                                                                queryParameters:
                                                                    {
                                                                  'catDoc':
                                                                      serializeParam(
                                                                    catListMItem,
                                                                    ParamType
                                                                        .Document,
                                                                  ),
                                                                }.withoutNulls,
                                                                extra: <String,
                                                                    dynamic>{
                                                                  'catDoc':
                                                                      catListMItem,
                                                                },
                                                              );
                                                            },
                                                          ),
                                                          Flexible(
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .delete_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  var _shouldSetState =
                                                                      false;
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  title: Text('Confirmation'),
                                                                                  content: Text('Are you  Sure You Want To Delete This Category'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Confirm'),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    _model.res =
                                                                        await queryProductRecordOnce(
                                                                      parent: FFAppState()
                                                                          .outletRef,
                                                                      queryBuilder:
                                                                          (productRecord) =>
                                                                              productRecord.where(
                                                                        'category',
                                                                        isEqualTo:
                                                                            catListMItem.id,
                                                                      ),
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                  } else {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  if (_model
                                                                          .res!
                                                                          .length >=
                                                                      0) {
                                                                    await catListMItem
                                                                        .reference
                                                                        .delete();
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            title:
                                                                                Text('Alert'),
                                                                            content:
                                                                                Text('Category In Use Could Not Delete'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed('AddCategoryPage');
                                },
                                text: '+',
                                options: FFButtonOptions(
                                  width: 250.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontSize: 42.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    Expanded(
                      flex: 29,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Builder(
                                    builder: (context) {
                                      final catListW =
                                          containerCategoryRecordList.toList();
                                      if (catListW.isEmpty) {
                                        return Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: NoDataWidget(),
                                        );
                                      }

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: catListW.length,
                                        itemBuilder: (context, catListWIndex) {
                                          final catListWItem =
                                              catListW[catListWIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 10.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.075,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.065,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.065,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    catListWItem
                                                                        .categoryNo
                                                                        .toString(),
                                                                    '1',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.001,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.05,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 18,
                                                            child: Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.6,
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.065,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                child:
                                                                    AutoSizeText(
                                                                  catListWItem
                                                                      .name,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  30.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons.mode_edit,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 20.0,
                                                              ),
                                                              showLoadingIndicator:
                                                                  true,
                                                              onPressed:
                                                                  () async {
                                                                context
                                                                    .pushNamed(
                                                                  'EditCategory',
                                                                  queryParameters:
                                                                      {
                                                                    'catDoc':
                                                                        serializeParam(
                                                                      catListWItem,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                    'categoryDocW':
                                                                        serializeParam(
                                                                      catListWItem,
                                                                      ParamType
                                                                          .Document,
                                                                    ),
                                                                  }.withoutNulls,
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    'catDoc':
                                                                        catListWItem,
                                                                    'categoryDocW':
                                                                        catListWItem,
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              width: 100.0,
                                                              height: 50.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .delete_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  var _shouldSetState =
                                                                      false;
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return WebViewAware(
                                                                                child: AlertDialog(
                                                                                  title: Text('Confirmation'),
                                                                                  content: Text('Are you  Sure You Want To Delete This Category'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Confirm'),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    _model.res1 =
                                                                        await queryProductRecordOnce(
                                                                      parent: FFAppState()
                                                                          .outletRef,
                                                                      queryBuilder:
                                                                          (productRecord) =>
                                                                              productRecord.where(
                                                                        'category',
                                                                        isEqualTo:
                                                                            catListWItem.id,
                                                                      ),
                                                                    );
                                                                    _shouldSetState =
                                                                        true;
                                                                  } else {
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  if (_model
                                                                          .res1!
                                                                          .length >=
                                                                      0) {
                                                                    await catListWItem
                                                                        .reference
                                                                        .delete();
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            title:
                                                                                Text('Alert'),
                                                                            content:
                                                                                Text('Category In Use Could Not Delete'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Ok'),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                    if (_shouldSetState)
                                                                      safeSetState(
                                                                          () {});
                                                                    return;
                                                                  }

                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    'AddCategoryPage',
                                    queryParameters: {
                                      'codeLen': serializeParam(
                                        FFAppState().catCodeLength,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                text: '+',
                                options: FFButtonOptions(
                                  width: 250.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontSize: 42.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
