import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/excel_listpremises_widget.dart';
import '/components/excel_view_widget.dart';
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
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'excel_sheetpremises_model.dart';
export 'excel_sheetpremises_model.dart';

class ExcelSheetpremisesWidget extends StatefulWidget {
  const ExcelSheetpremisesWidget({super.key});

  @override
  State<ExcelSheetpremisesWidget> createState() =>
      _ExcelSheetpremisesWidgetState();
}

class _ExcelSheetpremisesWidgetState extends State<ExcelSheetpremisesWidget> {
  late ExcelSheetpremisesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExcelSheetpremisesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().startLoop = 0;
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
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
                              20.0, 0.0, 20.0, 5.0),
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
                                  context.safePop();
                                },
                              ),
                              AutoSizeText(
                                'Excel Sheet',
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
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    FFAppState().startLoop = 0;
                                    FFAppState().endLoop =
                                        FFAppState().readProductlist.length;
                                    FFAppState().loopExcelDouble = 0.0;
                                  });
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text('Alert'),
                                                  content: Text(
                                                      'Are you Sure to Want Upload?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    while (FFAppState().startLoop <
                                        FFAppState().endLoop) {
                                      _model.categoryid =
                                          await queryCategoryRecordOnce(
                                        parent: FFAppState().outletRef,
                                        queryBuilder: (categoryRecord) =>
                                            categoryRecord.where(
                                          'categoryNo',
                                          isEqualTo: FFAppState()
                                              .readProductlist[
                                                  FFAppState().startLoop]
                                              .categoryNo,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _model.unitId =
                                          await actions.getUnitTypes(
                                        FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .unitType,
                                      );
                                      _model.taxID = await actions.getTaxId(
                                        FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .taxIndex,
                                      );
                                      _model.weightable =
                                          await actions.getweightable(
                                        FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .weightable,
                                      );

                                      var productRecordReference =
                                          ProductRecord.createDoc(
                                              FFAppState().outletRef!);
                                      await productRecordReference
                                          .set(createProductRecordData(
                                        active: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .active,
                                        barcode: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .barcode,
                                        category:
                                            _model.categoryid?.reference.id,
                                        cess: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .cess,
                                        code: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .code,
                                        costPrice: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .costPrice,
                                        dateTme: getCurrentTimestamp,
                                        discount: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .discount,
                                        keyCount: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .keyCount,
                                        kitchenId: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .kitchenId,
                                        mrpPrice: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .mrpPrice,
                                        name: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .name,
                                        onlinePrice: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .onlinePrice,
                                        onlineSynced: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .onlineSynced,
                                        price: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .price,
                                        priceTable: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .priceTable,
                                        recipeId: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .recipeId,
                                        regionalName: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .regionalName,
                                        reorderLevel: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .reorderLevel,
                                        selected: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .selected,
                                        shortName: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .shortName,
                                        stockable: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .stockable,
                                        taxIndex: _model.taxID,
                                        type: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .type,
                                        unitId: _model.unitId,
                                        weighable: _model.weightable,
                                        currentStock: FFAppState()
                                            .readProductlist[
                                                FFAppState().startLoop]
                                            .currentStock,
                                      ));
                                      _model.createdDocumentProduct =
                                          ProductRecord.getDocumentFromData(
                                              createProductRecordData(
                                                active: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .active,
                                                barcode: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .barcode,
                                                category: _model
                                                    .categoryid?.reference.id,
                                                cess: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .cess,
                                                code: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .code,
                                                costPrice: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .costPrice,
                                                dateTme: getCurrentTimestamp,
                                                discount: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .discount,
                                                keyCount: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .keyCount,
                                                kitchenId: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .kitchenId,
                                                mrpPrice: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .mrpPrice,
                                                name: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .name,
                                                onlinePrice: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .onlinePrice,
                                                onlineSynced: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .onlineSynced,
                                                price: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .price,
                                                priceTable: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .priceTable,
                                                recipeId: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .recipeId,
                                                regionalName: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .regionalName,
                                                reorderLevel: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .reorderLevel,
                                                selected: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .selected,
                                                shortName: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .shortName,
                                                stockable: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .stockable,
                                                taxIndex: _model.taxID,
                                                type: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .type,
                                                unitId: _model.unitId,
                                                weighable: _model.weightable,
                                                currentStock: FFAppState()
                                                    .readProductlist[
                                                        FFAppState().startLoop]
                                                    .currentStock,
                                              ),
                                              productRecordReference);

                                      await _model
                                          .createdDocumentProduct!.reference
                                          .update(createProductRecordData(
                                        id: _model.createdDocumentProduct
                                            ?.reference.id,
                                      ));
                                      setState(() {
                                        FFAppState().startLoop =
                                            FFAppState().startLoop + 1;
                                      });
                                      setState(() {
                                        FFAppState().loopExcelDouble =
                                            FFAppState().loopExcelDouble + 1.0;
                                      });
                                    }
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('Alert'),
                                            content: Text(
                                                'Product Uploded Successfully !'),
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
                                  } else {
                                    context.safePop();
                                  }

                                  context.safePop();

                                  setState(() {});
                                },
                                text: 'Upload',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).secondary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
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
                              Text(
                                valueOrDefault<String>(
                                  FFAppState()
                                      .readProductlist
                                      .length
                                      .toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
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
                  phone: false,
                  tablet: false,
                ))
                  Expanded(
                    flex: 31,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Product Name',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Regional Name',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Default Price',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Price 1 ',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'MRP Price',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Short Name',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Purchase Price',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Category Name',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Category No.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Tax',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Barcode',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Unit Type',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Stock',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Search code',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor3,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Price Table',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Builder(
                                builder: (context) {
                                  final readListdata =
                                      FFAppState().readProductlist.toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: readListdata.length,
                                    itemBuilder: (context, readListdataIndex) {
                                      final readListdataItem =
                                          readListdata[readListdataIndex];
                                      return Container(
                                        width: double.infinity,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: ExcelListpremisesWidget(
                                          key: Key(
                                              'Keygt0_${readListdataIndex}_of_${readListdata.length}'),
                                          prdname: readListdataItem.name,
                                          regionalName:
                                              readListdataItem.regionalName,
                                          defaultPrice:
                                              readListdataItem.defaultPrice,
                                          price1: readListdataItem.price,
                                          mrpPrice: readListdataItem.mrpPrice,
                                          purchasePrice:
                                              readListdataItem.costPrice,
                                          categoryname:
                                              readListdataItem.category,
                                          catehoryNo:
                                              readListdataItem.categoryNo,
                                          tax: readListdataItem.taxIndex,
                                          barcode: readListdataItem.barcode,
                                          unittype: readListdataItem.unitType,
                                          stock: readListdataItem.currentStock,
                                          weightable:
                                              readListdataItem.weightable,
                                          searchcode: readListdataItem.code,
                                          shortName: readListdataItem.shortName,
                                          priceTable:
                                              readListdataItem.priceTable,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Expanded(
                    flex: 25,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Builder(
                          builder: (context) {
                            final readListdataM =
                                FFAppState().readProductlist.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: readListdataM.length,
                              itemBuilder: (context, readListdataMIndex) {
                                final readListdataMItem =
                                    readListdataM[readListdataMIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Container(
                                    width: 100.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(
                                            1.0,
                                            2.0,
                                          ),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: ExcelViewWidget(
                                      key: Key(
                                          'Key39t_${readListdataMIndex}_of_${readListdataM.length}'),
                                      parameter1: readListdataMItem.name,
                                      parameter2:
                                          readListdataMItem.regionalName,
                                      parameter3: readListdataMItem.price,
                                      parameter4: readListdataMItem.mrpPrice,
                                      parameter5: readListdataMItem.costPrice,
                                      parameter6: readListdataMItem.category,
                                      parameter7: readListdataMItem.categoryNo,
                                      parameter8: readListdataMItem.taxIndex,
                                      parameter9: readListdataMItem.barcode,
                                      parameter10: readListdataMItem.unitType,
                                      parameter11:
                                          readListdataMItem.currentStock,
                                      parameter12: readListdataMItem.weightable,
                                      parameter13: readListdataMItem.code,
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
              ],
            ),
            if (FFAppState().startLoop > 0)
              Opacity(
                opacity: 0.9,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).accent3,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Please Wait........',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          if (FFAppState().startLoop > 0)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: CircularPercentIndicator(
                                percent: functions.gerProgressValue(
                                    FFAppState().startLoop,
                                    FFAppState().countExcel),
                                radius: 160.0,
                                lineWidth: 15.0,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor:
                                    FlutterFlowTheme.of(context).primary,
                                backgroundColor:
                                    FlutterFlowTheme.of(context).accent4,
                                center: Text(
                                  FFAppState().startLoop.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmallFamily),
                                      ),
                                ),
                              ),
                            ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              FFAppState().countExcel.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
