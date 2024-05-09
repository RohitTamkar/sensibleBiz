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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'stock_weight_combine_page_model.dart';
export 'stock_weight_combine_page_model.dart';

class StockWeightCombinePageWidget extends StatefulWidget {
  const StockWeightCombinePageWidget({super.key});

  @override
  State<StockWeightCombinePageWidget> createState() =>
      _StockWeightCombinePageWidgetState();
}

class _StockWeightCombinePageWidgetState
    extends State<StockWeightCombinePageWidget> {
  late StockWeightCombinePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StockWeightCombinePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.products = await queryProductRecordOnce(
        parent: FFAppState().outletRef,
      );
      _model.json = await actions.docsToJson(
        _model.products!.toList(),
      );
      setState(() {
        FFAppState().prdJsonList = _model.json!.toList().cast<dynamic>();
      });
      setState(() {
        _model.waitLoader = false;
      });
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
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
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
                                    FFAppState().prdJsonList = [];
                                  });
                                  context.safePop();
                                },
                              ),
                              AutoSizeText(
                                'Product List',
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
                                  Icons.more_vert,
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
                  flex: 24,
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
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 30.0, 15.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [],
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Text(
                                      'Stock',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Weight',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Text(
                                      'Select All',
                                      style: FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(2.0),
                                            bottomRight: Radius.circular(2.0),
                                            topLeft: Radius.circular(2.0),
                                            topRight: Radius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context).accent2,
                                    ),
                                    child: Checkbox(
                                      value: _model.stockableCheckboxValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.stockableCheckboxValue =
                                                newValue!);
                                        if (newValue!) {
                                          _model.result =
                                              await actions.selectCheckbox(
                                            'ALL',
                                            'stock',
                                            true,
                                            FFAppState().prdJsonList.toList(),
                                          );
                                          setState(() {
                                            FFAppState().prdJsonList = _model
                                                .result!
                                                .toList()
                                                .cast<dynamic>();
                                          });

                                          setState(() {});
                                        } else {
                                          _model.resultcopy =
                                              await actions.selectCheckbox(
                                            'ALL',
                                            'stock',
                                            false,
                                            FFAppState().prdJsonList.toList(),
                                          );
                                          setState(() {
                                            FFAppState().prdJsonList = _model
                                                .resultcopy!
                                                .toList()
                                                .cast<dynamic>();
                                          });

                                          setState(() {});
                                        }
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(2.0),
                                            bottomRight: Radius.circular(2.0),
                                            topLeft: Radius.circular(2.0),
                                            topRight: Radius.circular(2.0),
                                          ),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context).accent2,
                                    ),
                                    child: Checkbox(
                                      value: _model.weightableCheckboxValue ??=
                                          false,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.weightableCheckboxValue =
                                                newValue!);
                                        if (newValue!) {
                                          _model.result1 =
                                              await actions.selectCheckbox(
                                            'ALL',
                                            'weight',
                                            true,
                                            FFAppState().prdJsonList.toList(),
                                          );
                                          setState(() {
                                            FFAppState().prdJsonList = _model
                                                .result1!
                                                .toList()
                                                .cast<dynamic>();
                                          });

                                          setState(() {});
                                        } else {
                                          _model.result1Copy =
                                              await actions.selectCheckbox(
                                            'ALL',
                                            'weight',
                                            false,
                                            FFAppState().prdJsonList.toList(),
                                          );
                                          setState(() {
                                            FFAppState().prdJsonList = _model
                                                .result1Copy!
                                                .toList()
                                                .cast<dynamic>();
                                          });

                                          setState(() {});
                                        }
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .accent2,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Builder(
                                builder: (context) {
                                  final productList =
                                      FFAppState().prdJsonList.toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: productList.length,
                                    itemBuilder: (context, productListIndex) {
                                      final productListItem =
                                          productList[productListIndex];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      getJsonField(
                                                        productListItem,
                                                        r'''$.name''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
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
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                                  .checkboxValueMap1[
                                                              productListItem] ??=
                                                          getJsonField(
                                                        productListItem,
                                                        r'''$.stockable''',
                                                      ),
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                    .checkboxValueMap1[
                                                                productListItem] =
                                                            newValue!);
                                                        if (newValue!) {
                                                          _model.checkBoxClick =
                                                              await actions
                                                                  .selectCheckboxCopy(
                                                            FFAppState()
                                                                .prdJsonList
                                                                .toList(),
                                                            productListItem,
                                                            true,
                                                            'stock',
                                                          );
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .prdJsonList =
                                                                _model
                                                                    .checkBoxClick!
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                          });

                                                          setState(() {});
                                                        } else {
                                                          _model.checkBoxClickCopy =
                                                              await actions
                                                                  .selectCheckboxCopy(
                                                            FFAppState()
                                                                .prdJsonList
                                                                .toList(),
                                                            productListItem,
                                                            false,
                                                            'stock',
                                                          );
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .prdJsonList =
                                                                _model
                                                                    .checkBoxClickCopy!
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                          });

                                                          setState(() {});
                                                        }
                                                      },
                                                      side: BorderSide(
                                                        width: 2,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
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
                                                                  .circular(
                                                                      4.0),
                                                        ),
                                                      ),
                                                      unselectedWidgetColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                    child: Checkbox(
                                                      value: _model
                                                                  .checkboxValueMap2[
                                                              productListItem] ??=
                                                          getJsonField(
                                                        productListItem,
                                                        r'''$.weightable''',
                                                      ),
                                                      onChanged:
                                                          (newValue) async {
                                                        setState(() => _model
                                                                    .checkboxValueMap2[
                                                                productListItem] =
                                                            newValue!);
                                                        if (newValue!) {
                                                          _model.checkBoxClickCopy2 =
                                                              await actions
                                                                  .selectCheckboxCopy(
                                                            FFAppState()
                                                                .prdJsonList
                                                                .toList(),
                                                            productListItem,
                                                            true,
                                                            'weight',
                                                          );
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .prdJsonList =
                                                                _model
                                                                    .checkBoxClickCopy2!
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                          });

                                                          setState(() {});
                                                        } else {
                                                          _model.checkBoxClick1 =
                                                              await actions
                                                                  .selectCheckboxCopy(
                                                            FFAppState()
                                                                .prdJsonList
                                                                .toList(),
                                                            productListItem,
                                                            false,
                                                            'weight',
                                                          );
                                                          FFAppState()
                                                              .update(() {
                                                            FFAppState()
                                                                    .prdJsonList =
                                                                _model
                                                                    .checkBoxClick1!
                                                                    .toList()
                                                                    .cast<
                                                                        dynamic>();
                                                          });

                                                          setState(() {});
                                                        }
                                                      },
                                                      side: BorderSide(
                                                        width: 2,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                      activeColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .success,
                                                      checkColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor2,
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Flexible(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                  text: 'Cancel',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).info,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    setState(() {
                                      _model.waitLoader = true;
                                    });
                                    setState(() {
                                      _model.startLoop = 0;
                                    });
                                    while (_model.startLoop! <
                                        FFAppState().prdJsonList.length) {
                                      await functions
                                          .updateProductStkorWt(FFAppState()
                                              .prdJsonList[_model.startLoop!])
                                          .update(createProductRecordData(
                                            stockable: getJsonField(
                                              FFAppState().prdJsonList[
                                                  _model.startLoop!],
                                              r'''$.stockable''',
                                            ),
                                            id: getJsonField(
                                              FFAppState().prdJsonList[
                                                  _model.startLoop!],
                                              r'''$.id''',
                                            ).toString(),
                                            weighable: getJsonField(
                                              FFAppState().prdJsonList[
                                                  _model.startLoop!],
                                              r'''$.weightable''',
                                            ),
                                          ));
                                      setState(() {
                                        _model.startLoop =
                                            _model.startLoop! + 1;
                                      });
                                    }
                                    setState(() {
                                      _model.waitLoader = false;
                                    });
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text(
                                                'Product updated Successfully'),
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
                                  },
                                  text: 'Update',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (_model.waitLoader == true)
              Opacity(
                opacity: 0.4,
                child: Container(
                  width: double.infinity,
                  height: 930.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
              ),
            if (_model.waitLoader == true)
              Align(
                alignment: AlignmentDirectional(0.09, 0.01),
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
