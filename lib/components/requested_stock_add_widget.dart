import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'requested_stock_add_model.dart';
export 'requested_stock_add_model.dart';

class RequestedStockAddWidget extends StatefulWidget {
  const RequestedStockAddWidget({
    super.key,
    this.parameter1,
    this.parameter2,
  });

  final dynamic parameter1;
  final dynamic parameter2;

  @override
  State<RequestedStockAddWidget> createState() =>
      _RequestedStockAddWidgetState();
}

class _RequestedStockAddWidgetState extends State<RequestedStockAddWidget> {
  late RequestedStockAddModel _model;

  bool textFieldFocusListenerRegistered = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestedStockAddModel());

    _model.textController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.parameter1?.toString(),
      '0',
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Autocomplete<String>(
      initialValue: TextEditingValue(
          text: valueOrDefault<String>(
        widget!.parameter1?.toString(),
        '0',
      )),
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return <String>[].where((option) {
          final lowercaseOption = option.toLowerCase();
          return lowercaseOption.contains(textEditingValue.text.toLowerCase());
        });
      },
      optionsViewBuilder: (context, onSelected, options) {
        return AutocompleteOptionsList(
          textFieldKey: _model.textFieldKey,
          textController: _model.textController!,
          options: options.toList(),
          onSelected: onSelected,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
          textHighlightStyle: TextStyle(),
          elevation: 4.0,
          optionBackgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          optionHighlightColor:
              FlutterFlowTheme.of(context).secondaryBackground,
          maxHeight: 200.0,
        );
      },
      onSelected: (String selection) {
        safeSetState(() => _model.textFieldSelectedOption = selection);
        FocusScope.of(context).unfocus();
      },
      fieldViewBuilder: (
        context,
        textEditingController,
        focusNode,
        onEditingComplete,
      ) {
        _model.textFieldFocusNode = focusNode;
        if (!textFieldFocusListenerRegistered) {
          textFieldFocusListenerRegistered = true;
          _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
        }
        _model.textController = textEditingController;
        return TextFormField(
          key: _model.textFieldKey,
          controller: textEditingController,
          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController',
            Duration(milliseconds: 2000),
            () async {
              _model.result = await actions.incrementStockNew(
                widget!.parameter2!,
                valueOrDefault<int>(
                  FFAppState().selBill,
                  0,
                ),
                double.tryParse(_model.textController.text),
              );
              FFAppState().productCart =
                  _model.result!.toList().cast<dynamic>();
              safeSetState(() {});

              safeSetState(() {});
            },
          ),
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            isDense: false,
            labelStyle: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).bodyMediumFamily),
                ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).customColor3,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).info,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: FlutterFlowTheme.of(context).error,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
              ),
          textAlign: TextAlign.center,
          validator: _model.textControllerValidator.asValidator(context),
        );
      },
    );
  }
}
