import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'tax_settings_model.dart';
export 'tax_settings_model.dart';

class TaxSettingsWidget extends StatefulWidget {
  const TaxSettingsWidget({super.key});

  @override
  State<TaxSettingsWidget> createState() => _TaxSettingsWidgetState();
}

class _TaxSettingsWidgetState extends State<TaxSettingsWidget> {
  late TaxSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaxSettingsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().prdJsonList = [];
      safeSetState(() {});
      if (FFAppState().categoryId != null && FFAppState().categoryId != '') {
        _model.selectedId = FFAppState().categoryId;
        safeSetState(() {});
        _model.products1 = await queryProductRecordOnce(
          parent: FFAppState().outletRef,
          queryBuilder: (productRecord) => productRecord.where(
            'category',
            isEqualTo: FFAppState().categoryId,
          ),
        );
        _model.jsonbyCat = await actions.docsToJsonforTax(
          _model.products1!.toList(),
        );
        FFAppState().prdJsonList = _model.jsonbyCat!.toList().cast<dynamic>();
        safeSetState(() {});
      } else {
        _model.products6 = await queryProductRecordOnce(
          parent: FFAppState().outletRef,
          queryBuilder: (productRecord) => productRecord.orderBy('code'),
        );
        _model.json1 = await actions.docsToJsonforTax(
          _model.products6!.toList(),
        );
        FFAppState().prdJsonList = _model.json1!.toList().cast<dynamic>();
        safeSetState(() {});
      }

      if (_model.selectedId != null && _model.selectedId != '') {
        _model.all = false;
        _model.updateStatus = false;
        _model.waitUpload = false;
        safeSetState(() {});
      } else {
        _model.all = true;
        _model.updateStatus = false;
        _model.waitUpload = false;
        safeSetState(() {});
      }
    });

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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
                                  FFAppState().showMenuProduct = false;
                                  safeSetState(() {});
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
                              AutoSizeText(
                                'Tax Settings',
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
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 5.0),
                                  child: FlutterFlowDropDown<String>(
                                    controller:
                                        _model.dropDownValueController ??=
                                            FormFieldController<String>(null),
                                    options: [
                                      'GST0',
                                      'GST2',
                                      'GST3',
                                      'GST5',
                                      'GST12',
                                      'GST18',
                                      'GST28',
                                      'VAT10',
                                      'VAT22'
                                    ],
                                    onChanged: (val) async {
                                      safeSetState(
                                          () => _model.dropDownValue = val);
                                      _model.taxIndexOutput =
                                          await actions.getTaxIdCopy(
                                        _model.dropDownValue,
                                      );
                                      FFAppState().taxIndexSTate =
                                          _model.taxIndexOutput!;
                                      safeSetState(() {});

                                      safeSetState(() {});
                                    },
                                    width: 90.0,
                                    height: 35.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                    hintText: 'TAX',
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        9.0, 4.0, 9.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
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
                                            _model.selectAllBoolean = false;
                                            _model.all = true;
                                            safeSetState(() {});
                                            FFAppState().prdJsonList = [];
                                            FFAppState().categoryId = '';
                                            safeSetState(() {});
                                            _model.products12 =
                                                await queryProductRecordOnce(
                                              parent: FFAppState().outletRef,
                                              queryBuilder: (productRecord) =>
                                                  productRecord.orderBy('code'),
                                            );
                                            _model.json12 =
                                                await actions.docsToJsonforTax(
                                              _model.products12!.toList(),
                                            );
                                            FFAppState().prdJsonList = _model
                                                .json12!
                                                .toList()
                                                .cast<dynamic>();
                                            safeSetState(() {});
                                            _model.all = true;
                                            _model.updateStatus = false;
                                            _model.waitUpload = false;
                                            safeSetState(() {});

                                            safeSetState(() {});
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
                                                        _model.all = false;
                                                        _model.selectedId = functions
                                                            .getReferenceCategory(
                                                                FFAppState()
                                                                    .outletRef!,
                                                                listViewCategoryRecord
                                                                    .reference);
                                                        safeSetState(() {});
                                                        FFAppState()
                                                            .prdJsonList = [];
                                                        FFAppState()
                                                                .categoryId =
                                                            _model.selectedId;
                                                        safeSetState(() {});
                                                        _model.productscat =
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
                                                        _model.jsonbyCat1 =
                                                            await actions
                                                                .docsToJsonforTax(
                                                          _model.productscat!
                                                              .toList(),
                                                        );
                                                        FFAppState()
                                                                .prdJsonList =
                                                            _model.jsonbyCat1!
                                                                .toList()
                                                                .cast<
                                                                    dynamic>();
                                                        safeSetState(() {});

                                                        safeSetState(() {});
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
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Select All',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily),
                                                              ),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
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
                                                                  safeSetState(() =>
                                                                      _model.selectAllCheckboxValue =
                                                                          newValue!);
                                                                  if (newValue!) {
                                                                    if (_model.dropDownValue !=
                                                                            null &&
                                                                        _model.dropDownValue !=
                                                                            '') {
                                                                      _model.updateStatus =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      _model.result =
                                                                          await actions
                                                                              .selectCheckboxTaxAll(
                                                                        'ALL',
                                                                        true,
                                                                        FFAppState()
                                                                            .prdJsonList
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .taxIndexSTate,
                                                                      );
                                                                      FFAppState().prdJsonList = _model
                                                                          .result!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                      safeSetState(
                                                                          () {});
                                                                    } else {
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                AlertDialog(
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

                                                                    safeSetState(
                                                                        () {});
                                                                  } else {
                                                                    _model.result2 =
                                                                        await actions
                                                                            .selectCheckboxTaxAll(
                                                                      'NONE',
                                                                      false,
                                                                      FFAppState()
                                                                          .prdJsonList
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .taxIndexSTate,
                                                                    );
                                                                    FFAppState().prdJsonList = _model
                                                                        .result2!
                                                                        .toList()
                                                                        .cast<
                                                                            dynamic>();
                                                                    safeSetState(
                                                                        () {});

                                                                    safeSetState(
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
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                                                child: Builder(
                                                  builder: (context) {
                                                    final taxProdList1 =
                                                        FFAppState()
                                                            .prdJsonList
                                                            .toList();

                                                    return ListView.builder(
                                                      padding: EdgeInsets.zero,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                          10.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        taxProdList1Item,
                                                                        r'''$.code''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelLarge
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelLargeFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 2,
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          getJsonField(
                                                                            taxProdList1Item,
                                                                            r'''$.name''',
                                                                          ).toString(),
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
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
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
                                                                            r'''$.taxIndexStr''',
                                                                          ).toString(),
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
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
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
                                                                            borderRadius:
                                                                                BorderRadius.circular(4.0),
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
                                                                        onChanged: (_model.waitUpload ==
                                                                                true)
                                                                            ? null
                                                                            : (newValue) async {
                                                                                safeSetState(() => _model.checkboxValueMap[taxProdList1Item] = newValue!);
                                                                                if (newValue!) {
                                                                                  _model.updateStatus = true;
                                                                                  safeSetState(() {});
                                                                                  _model.result1 = await actions.selectCheckboxTaxSIngle(
                                                                                    true,
                                                                                    FFAppState().prdJsonList.toList(),
                                                                                    FFAppState().taxIndexSTate,
                                                                                    taxProdList1Item,
                                                                                  );
                                                                                  FFAppState().prdJsonList = _model.result1!.toList().cast<dynamic>();
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  _model.result3 = await actions.selectCheckboxTaxSIngle(
                                                                                    false,
                                                                                    FFAppState().prdJsonList.toList(),
                                                                                    FFAppState().taxIndexSTate,
                                                                                    taxProdList1Item,
                                                                                  );
                                                                                  FFAppState().prdJsonList = _model.result3!.toList().cast<dynamic>();
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
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
                                                                        checkColor: (_model.waitUpload ==
                                                                                true)
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
                                                        FFAppState()
                                                            .productListSTockableUpdate = [];
                                                        safeSetState(() {});
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
                                                      onPressed:
                                                          (_model.dropDownValue ==
                                                                      null ||
                                                                  _model.dropDownValue ==
                                                                      '')
                                                              ? null
                                                              : () async {
                                                                  if (_model.dropDownValue !=
                                                                          null &&
                                                                      _model.dropDownValue !=
                                                                          '') {
                                                                    _model.startLoop =
                                                                        0;
                                                                    _model.waitUpload =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    while (_model
                                                                            .startLoop! <
                                                                        FFAppState()
                                                                            .prdJsonList
                                                                            .length) {
                                                                      await functions
                                                                          .updateProductStkorWt(FFAppState()
                                                                              .prdJsonList
                                                                              .elementAtOrNull(_model.startLoop!)!)
                                                                          .update(createProductRecordData(
                                                                            taxIndex:
                                                                                getJsonField(
                                                                              FFAppState().prdJsonList.elementAtOrNull(_model.startLoop!),
                                                                              r'''$.taxIndexNum''',
                                                                            ),
                                                                          ));
                                                                      _model.startLoop =
                                                                          _model.startLoop! +
                                                                              1;
                                                                      safeSetState(
                                                                          () {});
                                                                    }
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            title:
                                                                                Text('Done!'),
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
                                                                    _model.updateStatus =
                                                                        false;
                                                                    _model.waitUpload =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});

                                                                    context.pushNamed(
                                                                        'taxSettings');
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
                                                                                Text('Please select tax value'),
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
                                                                    _model.updateStatus =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});

                                                                    context.pushNamed(
                                                                        'taxSettings');

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
            if (_model.waitUpload == true)
              Align(
                alignment: AlignmentDirectional(-0.11, -0.18),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  child: custom_widgets.LoadingCustomWidget(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    height: MediaQuery.sizeOf(context).height * 0.2,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
