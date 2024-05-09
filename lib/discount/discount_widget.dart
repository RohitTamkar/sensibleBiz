import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
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
import 'discount_model.dart';
export 'discount_model.dart';

class DiscountWidget extends StatefulWidget {
  const DiscountWidget({super.key});

  @override
  State<DiscountWidget> createState() => _DiscountWidgetState();
}

class _DiscountWidgetState extends State<DiscountWidget> {
  late DiscountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DiscountModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().prdJsonList = [];
      });
      setState(() {
        FFAppState().taxIndexSTate = 0;
      });
      _model.products = await queryProductRecordOnce(
        parent: FFAppState().outletRef,
        queryBuilder: (productRecord) => productRecord.orderBy('code'),
      );
      _model.json = await actions.updateDiscountToJson(
        _model.products!.toList(),
      );
      setState(() {
        FFAppState().prdJsonList = _model.json!.toList().cast<dynamic>();
      });
      setState(() {
        _model.all = true;
        _model.updateStatus = false;
      });
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
                                  setState(() {
                                    FFAppState().showMenuProduct = false;
                                  });
                                  if (_model.updateStatus == false) {
                                    context.safePop();
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('Warning'),
                                            content: Text(
                                                'Values not updated,Please click on update button or cancel'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  }
                                },
                              ),
                              Flexible(
                                child: AutoSizeText(
                                  'Discount Settings',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineMediumFamily),
                                      ),
                                ),
                              ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 45.0,
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
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
                  flex: 29,
                  child: Container(
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
                      padding: EdgeInsets.all(15.0),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.046,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            setState(() {
                                              _model.selectedId = '';
                                              _model.selectAllBoolean = false;
                                              _model.all = true;
                                            });
                                            setState(() {
                                              FFAppState().prdJsonList = [];
                                            });
                                            _model.products2 =
                                                await queryProductRecordOnce(
                                              parent: FFAppState().outletRef,
                                              queryBuilder: (productRecord) =>
                                                  productRecord.orderBy('code'),
                                            );
                                            _model.json2 = await actions
                                                .updateDiscountToJson(
                                              _model.products2!.toList(),
                                            );
                                            setState(() {
                                              FFAppState().prdJsonList = _model
                                                  .json2!
                                                  .toList()
                                                  .cast<dynamic>();
                                            });

                                            setState(() {});
                                          },
                                          text: 'All',
                                          options: FFButtonOptions(
                                            height: double.infinity,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: _model.all == true
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .secondary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: _model.all == true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .accent4
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .lineColor,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: StreamBuilder<
                                              List<CategoryRecord>>(
                                            stream: queryCategoryRecord(
                                              parent: FFAppState().outletRef,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .warning,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<CategoryRecord>
                                                  listViewCategoryRecordList =
                                                  snapshot.data!;
                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    listViewCategoryRecordList
                                                        .length,
                                                itemBuilder:
                                                    (context, listViewIndex) {
                                                  final listViewCategoryRecord =
                                                      listViewCategoryRecordList[
                                                          listViewIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                3.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        setState(() {
                                                          FFAppState()
                                                              .prdJsonList = [];
                                                        });
                                                        setState(() {
                                                          _model.all = false;
                                                          _model.selectedId = functions
                                                              .getReferenceCategory(
                                                                  FFAppState()
                                                                      .outletRef!,
                                                                  listViewCategoryRecord
                                                                      .reference);
                                                        });
                                                        _model.products1 =
                                                            await queryProductRecordOnce(
                                                          parent: FFAppState()
                                                              .outletRef,
                                                          queryBuilder:
                                                              (productRecord) =>
                                                                  productRecord
                                                                      .where(
                                                            'category',
                                                            isEqualTo: _model
                                                                .selectedId,
                                                          ),
                                                        );
                                                        _model.jsonbyCat =
                                                            await actions
                                                                .updateDiscountToJson(
                                                          _model.products1!
                                                              .toList(),
                                                        );
                                                        setState(() {
                                                          FFAppState()
                                                                  .prdJsonList =
                                                              _model.jsonbyCat!
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                        });

                                                        setState(() {});
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: valueOrDefault<
                                                              Color>(
                                                            _model.selectedId ==
                                                                    functions.getReferenceCategory(
                                                                        FFAppState()
                                                                            .outletRef!,
                                                                        listViewCategoryRecord
                                                                            .reference)
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10.0),
                                                            child: Text(
                                                              listViewCategoryRecord
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: _model.selectedId == functions.getReferenceCategory(FFAppState().outletRef!, listViewCategoryRecord.reference)
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .secondaryBackground
                                                                        : FlutterFlowTheme.of(context)
                                                                            .lineColor,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 10.0, 8.0, 10.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        setState(() {
                                          _model.discValue = int.parse(
                                              _model.textController.text);
                                        });
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Enter Discount Value.....',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    keyboardType: TextInputType.number,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]'))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: Text(
                                                    'Select All',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor1,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(5.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Sr. no',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 6,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Product Name',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        'Discount',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    5.0,
                                                                    0.0),
                                                        child: Theme(
                                                          data: ThemeData(
                                                            checkboxTheme:
                                                                CheckboxThemeData(
                                                              visualDensity:
                                                                  VisualDensity
                                                                      .compact,
                                                              materialTapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                ),
                                                              ),
                                                            ),
                                                            unselectedWidgetColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                          ),
                                                          child: Checkbox(
                                                            value: _model
                                                                    .selectAllCheckboxValue ??=
                                                                false,
                                                            onChanged: (_model
                                                                        .waitUpload ==
                                                                    true)
                                                                ? null
                                                                : (newValue) async {
                                                                    setState(() =>
                                                                        _model.selectAllCheckboxValue =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      if (_model.textController.text !=
                                                                              null &&
                                                                          _model.textController.text !=
                                                                              '') {
                                                                        setState(
                                                                            () {
                                                                          _model.updateStatus =
                                                                              true;
                                                                        });
                                                                        _model.result =
                                                                            await actions.updateAddDiscountAction(
                                                                          'ALL',
                                                                          false,
                                                                          FFAppState()
                                                                              .prdJsonList
                                                                              .toList(),
                                                                          int.parse(_model
                                                                              .textController
                                                                              .text),
                                                                        );
                                                                        setState(
                                                                            () {
                                                                          FFAppState().prdJsonList = _model
                                                                              .result!
                                                                              .toList()
                                                                              .cast<dynamic>();
                                                                        });
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                              child: AlertDialog(
                                                                                title: Text('Warning'),
                                                                                content: Text('Please select tax value'),
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
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    } else {
                                                                      if (_model.textController.text !=
                                                                              null &&
                                                                          _model.textController.text !=
                                                                              '') {
                                                                        setState(
                                                                            () {
                                                                          _model.updateStatus =
                                                                              true;
                                                                        });
                                                                        _model.result2 =
                                                                            await actions.updateAddDiscountAction(
                                                                          'NONE',
                                                                          true,
                                                                          FFAppState()
                                                                              .prdJsonList
                                                                              .toList(),
                                                                          int.parse(_model
                                                                              .textController
                                                                              .text),
                                                                        );
                                                                        setState(
                                                                            () {
                                                                          FFAppState().prdJsonList = _model
                                                                              .result2!
                                                                              .toList()
                                                                              .cast<dynamic>();
                                                                        });
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                              child: AlertDialog(
                                                                                title: Text('Warning'),
                                                                                content: Text('Please select tax value'),
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
                                                                      }

                                                                      setState(
                                                                          () {});
                                                                    }
                                                                  },
                                                            side: BorderSide(
                                                              width: 2,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .info,
                                                            checkColor: (_model
                                                                        .waitUpload ==
                                                                    true)
                                                                ? null
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.79,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final taxProdList1 =
                                                          FFAppState()
                                                              .prdJsonList
                                                              .toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            taxProdList1.length,
                                                        itemBuilder: (context,
                                                            taxProdList1Index) {
                                                          final taxProdList1Item =
                                                              taxProdList1[
                                                                  taxProdList1Index];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        5.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            taxProdList1Item,
                                                                            r'''$.code''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 6,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            taxProdList1Item,
                                                                            r'''$.name''',
                                                                          ).toString(),
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            7.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            taxProdList1Item,
                                                                            r'''$.discount''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                color: getJsonField(
                                                                                  taxProdList1Item,
                                                                                  r'''$.isChanged''',
                                                                                )
                                                                                    ? FlutterFlowTheme.of(context).info
                                                                                    : FlutterFlowTheme.of(context).primaryText,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                      child:
                                                                          Theme(
                                                                        data:
                                                                            ThemeData(
                                                                          checkboxTheme:
                                                                              CheckboxThemeData(
                                                                            visualDensity:
                                                                                VisualDensity.compact,
                                                                            materialTapTargetSize:
                                                                                MaterialTapTargetSize.shrinkWrap,
                                                                            shape:
                                                                                RoundedRectangleBorder(
                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          unselectedWidgetColor:
                                                                              FlutterFlowTheme.of(context).lineColor,
                                                                        ),
                                                                        child:
                                                                            Checkbox(
                                                                          value: _model.checkboxValueMap[taxProdList1Item] ??=
                                                                              getJsonField(
                                                                            taxProdList1Item,
                                                                            r'''$.cb''',
                                                                          ),
                                                                          onChanged: (_model.waitUpload == true)
                                                                              ? null
                                                                              : (newValue) async {
                                                                                  setState(() => _model.checkboxValueMap[taxProdList1Item] = newValue!);
                                                                                  if (newValue!) {
                                                                                    if (_model.textController.text != null && _model.textController.text != '') {
                                                                                      setState(() {
                                                                                        _model.updateStatus = true;
                                                                                      });
                                                                                      _model.result1 = await actions.selectCheckboxDiscountSIngle(
                                                                                        true,
                                                                                        FFAppState().prdJsonList.toList(),
                                                                                        int.parse(_model.textController.text),
                                                                                        taxProdList1Item,
                                                                                      );
                                                                                      setState(() {
                                                                                        FFAppState().prdJsonList = _model.result1!.toList().cast<dynamic>();
                                                                                      });
                                                                                    } else {
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              title: Text('Please Enter Discount value'),
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
                                                                                    }

                                                                                    setState(() {});
                                                                                  } else {
                                                                                    setState(() {
                                                                                      _model.updateStatus = true;
                                                                                    });
                                                                                    _model.result3 = await actions.selectCheckboxDiscountSIngle(
                                                                                      false,
                                                                                      FFAppState().prdJsonList.toList(),
                                                                                      _model.discValue,
                                                                                      taxProdList1Item,
                                                                                    );
                                                                                    setState(() {
                                                                                      FFAppState().prdJsonList = _model.result3!.toList().cast<dynamic>();
                                                                                    });

                                                                                    setState(() {});
                                                                                  }
                                                                                },
                                                                          side:
                                                                              BorderSide(
                                                                            width:
                                                                                2,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lineColor,
                                                                          ),
                                                                          activeColor:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          checkColor: (_model.waitUpload == true)
                                                                              ? null
                                                                              : FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: double.infinity,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        setState(() {
                                                          FFAppState()
                                                              .productListSTockableUpdate = [];
                                                        });
                                                        context.safePop();
                                                      },
                                                      text: 'Cancel',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (_model.discValue !=
                                                            null) {
                                                          setState(() {
                                                            _model.startLoop =
                                                                0;
                                                            _model.waitUpload =
                                                                true;
                                                          });
                                                          while (_model
                                                                  .startLoop! <
                                                              FFAppState()
                                                                  .prdJsonList
                                                                  .length) {
                                                            await functions
                                                                .updateProductStkorWt(
                                                                    FFAppState()
                                                                            .prdJsonList[
                                                                        _model
                                                                            .startLoop!])
                                                                .update(
                                                                    createProductRecordData(
                                                                  discount:
                                                                      getJsonField(
                                                                    FFAppState()
                                                                            .prdJsonList[
                                                                        _model
                                                                            .startLoop!],
                                                                    r'''$.discount''',
                                                                  ),
                                                                ));
                                                            setState(() {
                                                              _model.startLoop =
                                                                  _model.startLoop! +
                                                                      1;
                                                            });
                                                          }
                                                          setState(() {
                                                            _model.updateStatus =
                                                                false;
                                                            _model.waitUpload =
                                                                false;
                                                          });
                                                          setState(() {
                                                            _model.waitUpload =
                                                                false;
                                                          });
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(
                                                                      'Success'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );

                                                          context.pushNamed(
                                                              'Discount');
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(
                                                                      'Please enter discount value'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                          setState(() {
                                                            _model.updateStatus =
                                                                false;
                                                          });

                                                          context.pushNamed(
                                                              'Discount');

                                                          return;
                                                        }
                                                      },
                                                      text: 'Update',
                                                      options: FFButtonOptions(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.5,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        hoverColor:
                                                            Color(0xFF5A9BFB),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (_model.waitUpload == true)
              Opacity(
                opacity: 0.4,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
              ),
            if ((_model.waitUpload == true) && (isWeb == false))
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  child: custom_widgets.LoadingCustomWidget(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: MediaQuery.sizeOf(context).height * 0.2,
                  ),
                ),
              ),
            if ((_model.waitUpload == true) && (isWeb == true))
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  child: custom_widgets.LoadingCustomWidget(
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    height: MediaQuery.sizeOf(context).height * 0.4,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
