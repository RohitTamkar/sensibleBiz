import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'excel_list_model.dart';
export 'excel_list_model.dart';

class ExcelListWidget extends StatefulWidget {
  const ExcelListWidget({
    super.key,
    this.prdname,
    this.regionalName,
    this.defaultPrice,
    this.price1,
    this.mrpPrice,
    this.purchasePrice,
    this.categoryname,
    this.catehoryNo,
    this.tax,
    this.barcode,
    this.unittype,
    this.stock,
    this.weightable,
    this.searchcode,
    this.shortName,
    String? dayType,
  }) : this.dayType = dayType ?? '0';

  final String? prdname;
  final String? regionalName;
  final double? defaultPrice;
  final double? price1;
  final double? mrpPrice;
  final double? purchasePrice;
  final String? categoryname;
  final int? catehoryNo;
  final int? tax;
  final String? barcode;
  final String? unittype;
  final double? stock;
  final String? weightable;
  final int? searchcode;
  final String? shortName;
  final String dayType;

  @override
  State<ExcelListWidget> createState() => _ExcelListWidgetState();
}

class _ExcelListWidgetState extends State<ExcelListWidget> {
  late ExcelListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExcelListModel());

    _model.textController1 ??= TextEditingController(text: widget.prdname);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: widget.regionalName);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??=
        TextEditingController(text: widget.defaultPrice?.toString());
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??=
        TextEditingController(text: widget.price1?.toString());
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??=
        TextEditingController(text: widget.mrpPrice?.toString());
    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textController6 ??= TextEditingController(text: widget.shortName);
    _model.textFieldFocusNode6 ??= FocusNode();

    _model.textController7 ??=
        TextEditingController(text: widget.purchasePrice?.toString());
    _model.textFieldFocusNode7 ??= FocusNode();

    _model.textController8 ??= TextEditingController(text: widget.categoryname);
    _model.textFieldFocusNode8 ??= FocusNode();

    _model.textController9 ??=
        TextEditingController(text: widget.catehoryNo?.toString());
    _model.textFieldFocusNode9 ??= FocusNode();

    _model.textController10 ??=
        TextEditingController(text: widget.tax?.toString());
    _model.textFieldFocusNode10 ??= FocusNode();

    _model.textController11 ??= TextEditingController(text: widget.barcode);
    _model.textFieldFocusNode11 ??= FocusNode();

    _model.textController12 ??= TextEditingController(text: widget.unittype);
    _model.textFieldFocusNode12 ??= FocusNode();

    _model.textController13 ??=
        TextEditingController(text: widget.stock?.toString());
    _model.textFieldFocusNode13 ??= FocusNode();

    _model.textController14 ??= TextEditingController(text: widget.weightable);
    _model.textFieldFocusNode14 ??= FocusNode();

    _model.textController15 ??=
        TextEditingController(text: widget.searchcode?.toString());
    _model.textFieldFocusNode15 ??= FocusNode();

    _model.textController16 ??= TextEditingController(text: widget.dayType);
    _model.textFieldFocusNode16 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextFormField(
            controller: _model.textController1,
            focusNode: _model.textFieldFocusNode1,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Product Name',
              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).labelMediumFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            validator: _model.textController1Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController2,
            focusNode: _model.textFieldFocusNode2,
            autofocus: false,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Regional Name',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: GoogleFonts.getFont(
              'Noto Sans Devanagari',
              fontSize: 14.0,
            ),
            validator: _model.textController2Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController3,
            focusNode: _model.textFieldFocusNode3,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Default Price',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController3Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController4,
            focusNode: _model.textFieldFocusNode4,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Price 1',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController4Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController5,
            focusNode: _model.textFieldFocusNode5,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'MRP Price',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController5Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController6,
            focusNode: _model.textFieldFocusNode6,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Purchase Price',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController6Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController7,
            focusNode: _model.textFieldFocusNode7,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Purchase Price',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController7Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController8,
            focusNode: _model.textFieldFocusNode8,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Category Name',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            validator: _model.textController8Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController9,
            focusNode: _model.textFieldFocusNode9,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Category No.',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController9Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController10,
            focusNode: _model.textFieldFocusNode10,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Tax',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController10Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController11,
            focusNode: _model.textFieldFocusNode11,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Barcode',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController11Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController12,
            focusNode: _model.textFieldFocusNode12,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Unit Type',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController12Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController13,
            focusNode: _model.textFieldFocusNode13,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Stock',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController13Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController14,
            focusNode: _model.textFieldFocusNode14,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Weightable',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.start,
            validator: _model.textController14Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController15,
            focusNode: _model.textFieldFocusNode15,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Search Code',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController15Validator.asValidator(context),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: _model.textController16,
            focusNode: _model.textFieldFocusNode16,
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'Search Code',
              hintStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).bodyLargeFamily),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).customColor3,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).info,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(0.0),
              ),
            ),
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).labelMediumFamily),
                ),
            textAlign: TextAlign.end,
            validator: _model.textController16Validator.asValidator(context),
          ),
        ),
      ],
    );
  }
}
