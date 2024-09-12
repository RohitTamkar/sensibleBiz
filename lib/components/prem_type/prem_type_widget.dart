import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'prem_type_model.dart';
export 'prem_type_model.dart';

class PremTypeWidget extends StatefulWidget {
  const PremTypeWidget({
    super.key,
    this.keyValJson,
  });

  final dynamic keyValJson;

  @override
  State<PremTypeWidget> createState() => _PremTypeWidgetState();
}

class _PremTypeWidgetState extends State<PremTypeWidget> {
  late PremTypeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PremTypeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Builder(
        builder: (context) {
          final myJson = widget!.keyValJson?.toList() ?? [];

          return Row(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(myJson.length, (myJsonIndex) {
              final myJsonItem = myJson[myJsonIndex];
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, -1.0),
                      child: Text(
                        getJsonField(
                          myJsonItem,
                          r'''$.key''',
                        ).toString(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    decoration: BoxDecoration(),
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
