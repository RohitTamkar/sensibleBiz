import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/no_data/no_data_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'stock_report_widget.dart' show StockReportWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StockReportModel extends FlutterFlowModel<StockReportWidget> {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
