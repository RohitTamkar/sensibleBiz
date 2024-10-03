import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'multipal_price_comp_widget.dart' show MultipalPriceCompWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MultipalPriceCompModel extends FlutterFlowModel<MultipalPriceCompWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for SellingPriceW widget.
  FocusNode? sellingPriceWFocusNode;
  TextEditingController? sellingPriceWTextController;
  String? Function(BuildContext, String?)? sellingPriceWTextControllerValidator;
  // State field(s) for MRPPriceW widget.
  FocusNode? mRPPriceWFocusNode;
  TextEditingController? mRPPriceWTextController;
  String? Function(BuildContext, String?)? mRPPriceWTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sellingPriceWFocusNode?.dispose();
    sellingPriceWTextController?.dispose();

    mRPPriceWFocusNode?.dispose();
    mRPPriceWTextController?.dispose();
  }
}
