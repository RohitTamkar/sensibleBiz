import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'employee_all_page_widget.dart' show EmployeeAllPageWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EmployeeAllPageModel extends FlutterFlowModel<EmployeeAllPageWidget> {
  ///  Local state fields for this page.

  List<ProductRecord> prdList = [];
  void addToPrdList(ProductRecord item) => prdList.add(item);
  void removeFromPrdList(ProductRecord item) => prdList.remove(item);
  void removeAtIndexFromPrdList(int index) => prdList.removeAt(index);
  void insertAtIndexInPrdList(int index, ProductRecord item) =>
      prdList.insert(index, item);
  void updatePrdListAtIndex(int index, Function(ProductRecord) updateFn) =>
      prdList[index] = updateFn(prdList[index]);

  List<dynamic> prdJson = [];
  void addToPrdJson(dynamic item) => prdJson.add(item);
  void removeFromPrdJson(dynamic item) => prdJson.remove(item);
  void removeAtIndexFromPrdJson(int index) => prdJson.removeAt(index);
  void insertAtIndexInPrdJson(int index, dynamic item) =>
      prdJson.insert(index, item);
  void updatePrdJsonAtIndex(int index, Function(dynamic) updateFn) =>
      prdJson[index] = updateFn(prdJson[index]);

  int? startLoop = 0;

  bool waitLoader = false;

  int count1 = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
