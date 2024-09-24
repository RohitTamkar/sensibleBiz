import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'total_comp_model.dart';
export 'total_comp_model.dart';

class TotalCompWidget extends StatefulWidget {
  const TotalCompWidget({super.key});

  @override
  State<TotalCompWidget> createState() => _TotalCompWidgetState();
}

class _TotalCompWidgetState extends State<TotalCompWidget> {
  late TotalCompModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TotalCompModel());

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

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
      child: Text(
        valueOrDefault<String>(
          functions
              .getTotalOnQtyAndPrice(
                  FFAppState().priceCompState, FFAppState().qtyCompState)
              .toString(),
          '0',
        ),
        style: FlutterFlowTheme.of(context).bodySmall.override(
              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
            ),
      ),
    );
  }
}
