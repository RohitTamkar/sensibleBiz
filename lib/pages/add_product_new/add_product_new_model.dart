import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/multipal_price_comp_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_product_new_widget.dart' show AddProductNewWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddProductNewModel extends FlutterFlowModel<AddProductNewWidget> {
  ///  Local state fields for this page.

  int? codeCount = 0;

  double? mrpPrice = 0.0;

  double? sellingPrice = 0.0;

  int? startLoop = 0;

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Firestore Query - Query a collection] action in AddProductNew widget.
  List<ProductRecord>? total;
  // Stores action output result for [Firestore Query - Query a collection] action in AddProductNew widget.
  UserProfileRecord? docMobile;
  // Stores action output result for [Firestore Query - Query a collection] action in AddProductNew widget.
  List<OutletRecord>? outletList;
  // Stores action output result for [Firestore Query - Query a collection] action in AddProductNew widget.
  MultipliersRecord? multiList;
  // Stores action output result for [Custom Action - multiCounterStruct] action in AddProductNew widget.
  List<MultipliersListStruct>? list;
  // State field(s) for CodeM widget.
  FocusNode? codeMFocusNode;
  TextEditingController? codeMTextController;
  String? Function(BuildContext, String?)? codeMTextControllerValidator;
  // State field(s) for ProductNameM widget.
  FocusNode? productNameMFocusNode;
  TextEditingController? productNameMTextController;
  String? Function(BuildContext, String?)? productNameMTextControllerValidator;
  String? _productNameMTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for SellingPriceM widget.
  FocusNode? sellingPriceMFocusNode;
  TextEditingController? sellingPriceMTextController;
  String? Function(BuildContext, String?)? sellingPriceMTextControllerValidator;
  String? _sellingPriceMTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for MRPPriceM widget.
  FocusNode? mRPPriceMFocusNode;
  TextEditingController? mRPPriceMTextController;
  String? Function(BuildContext, String?)? mRPPriceMTextControllerValidator;
  // State field(s) for PurchasePriceM widget.
  FocusNode? purchasePriceMFocusNode;
  TextEditingController? purchasePriceMTextController;
  String? Function(BuildContext, String?)?
      purchasePriceMTextControllerValidator;
  // State field(s) for CatDropDownM widget.
  String? catDropDownMValue;
  FormFieldController<String>? catDropDownMValueController;
  // State field(s) for RegionalNameM widget.
  FocusNode? regionalNameMFocusNode;
  TextEditingController? regionalNameMTextController;
  String? Function(BuildContext, String?)? regionalNameMTextControllerValidator;
  // State field(s) for RecorderLevelM widget.
  FocusNode? recorderLevelMFocusNode;
  TextEditingController? recorderLevelMTextController;
  String? Function(BuildContext, String?)?
      recorderLevelMTextControllerValidator;
  // State field(s) for DiscountPerM widget.
  FocusNode? discountPerMFocusNode;
  TextEditingController? discountPerMTextController;
  String? Function(BuildContext, String?)? discountPerMTextControllerValidator;
  // State field(s) for ShortNameM widget.
  FocusNode? shortNameMFocusNode;
  TextEditingController? shortNameMTextController;
  String? Function(BuildContext, String?)? shortNameMTextControllerValidator;
  // State field(s) for CurrentStockM widget.
  FocusNode? currentStockMFocusNode;
  TextEditingController? currentStockMTextController;
  String? Function(BuildContext, String?)? currentStockMTextControllerValidator;
  // State field(s) for BarcodeM widget.
  FocusNode? barcodeMFocusNode;
  TextEditingController? barcodeMTextController;
  String? Function(BuildContext, String?)? barcodeMTextControllerValidator;
  // State field(s) for WightCheckboM widget.
  bool? wightCheckboMValue;
  // State field(s) for StockCheckboxM widget.
  bool? stockCheckboxMValue;
  // State field(s) for UnitTypeM widget.
  String? unitTypeMValue;
  FormFieldController<String>? unitTypeMValueController;
  // State field(s) for TaxM widget.
  String? taxMValue;
  FormFieldController<String>? taxMValueController;
  // State field(s) for ServicePointM widget.
  String? servicePointMValue1;
  FormFieldController<String>? servicePointMValueController1;
  // State field(s) for HsnM widget.
  FocusNode? hsnMFocusNode;
  TextEditingController? hsnMTextController;
  String? Function(BuildContext, String?)? hsnMTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Custom Action - getUnitTypes] action in Button widget.
  int? unitId;
  // Stores action output result for [Custom Action - getTaxIdCopy] action in Button widget.
  int? taxId;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoryRecord? catM;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductRecord? doc;
  // State field(s) for CodeW widget.
  FocusNode? codeWFocusNode;
  TextEditingController? codeWTextController;
  String? Function(BuildContext, String?)? codeWTextControllerValidator;
  // State field(s) for Checkbox1 widget.
  bool? checkbox1Value;
  // State field(s) for ProductNameW widget.
  FocusNode? productNameWFocusNode;
  TextEditingController? productNameWTextController;
  String? Function(BuildContext, String?)? productNameWTextControllerValidator;
  String? _productNameWTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for SellingPriceW widget.
  FocusNode? sellingPriceWFocusNode;
  TextEditingController? sellingPriceWTextController;
  String? Function(BuildContext, String?)? sellingPriceWTextControllerValidator;
  String? _sellingPriceWTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for MRPPriceW widget.
  FocusNode? mRPPriceWFocusNode;
  TextEditingController? mRPPriceWTextController;
  String? Function(BuildContext, String?)? mRPPriceWTextControllerValidator;
  // Stores action output result for [Custom Action - multiCounterStructUpdate] action in MRPPriceW widget.
  List<MultipliersListStruct>? updateList;
  // State field(s) for PurchasePriceW widget.
  FocusNode? purchasePriceWFocusNode;
  TextEditingController? purchasePriceWTextController;
  String? Function(BuildContext, String?)?
      purchasePriceWTextControllerValidator;
  // Models for multipalPriceComp dynamic component.
  late FlutterFlowDynamicModels<MultipalPriceCompModel> multipalPriceCompModels;
  // State field(s) for CatDropDownW widget.
  String? catDropDownWValue;
  FormFieldController<String>? catDropDownWValueController;
  // State field(s) for RegionalNameW widget.
  FocusNode? regionalNameWFocusNode;
  TextEditingController? regionalNameWTextController;
  String? Function(BuildContext, String?)? regionalNameWTextControllerValidator;
  // State field(s) for RecorderLevelW widget.
  FocusNode? recorderLevelWFocusNode;
  TextEditingController? recorderLevelWTextController;
  String? Function(BuildContext, String?)?
      recorderLevelWTextControllerValidator;
  // State field(s) for DiscountPerW widget.
  FocusNode? discountPerWFocusNode;
  TextEditingController? discountPerWTextController;
  String? Function(BuildContext, String?)? discountPerWTextControllerValidator;
  // State field(s) for ShortNameW widget.
  FocusNode? shortNameWFocusNode;
  TextEditingController? shortNameWTextController;
  String? Function(BuildContext, String?)? shortNameWTextControllerValidator;
  // State field(s) for TaxW widget.
  String? taxWValue;
  FormFieldController<String>? taxWValueController;
  // Stores action output result for [Custom Action - multiCounterStructUpdate] action in TaxW widget.
  List<MultipliersListStruct>? updateListCopy;
  // State field(s) for UnitTypeW widget.
  String? unitTypeWValue;
  FormFieldController<String>? unitTypeWValueController;
  // State field(s) for ServicePointM widget.
  String? servicePointMValue2;
  FormFieldController<String>? servicePointMValueController2;
  // State field(s) for HsnW widget.
  FocusNode? hsnWFocusNode;
  TextEditingController? hsnWTextController;
  String? Function(BuildContext, String?)? hsnWTextControllerValidator;
  // State field(s) for BarcodeW widget.
  FocusNode? barcodeWFocusNode;
  TextEditingController? barcodeWTextController;
  String? Function(BuildContext, String?)? barcodeWTextControllerValidator;
  // Stores action output result for [Custom Action - barcodeRandomGeneratedNew] action in Button widget.
  String? barcodeScan2;
  // State field(s) for CurrentStockW widget.
  FocusNode? currentStockWFocusNode;
  TextEditingController? currentStockWTextController;
  String? Function(BuildContext, String?)? currentStockWTextControllerValidator;
  // State field(s) for WightCheckboWN widget.
  bool? wightCheckboWNValue;
  // State field(s) for StockCheckboxWN widget.
  bool? stockCheckboxWNValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UserProfileRecord? userOutlets;
  // Stores action output result for [Custom Action - getUnitTypes] action in Button widget.
  int? unitIdWMul;
  // Stores action output result for [Custom Action - getTaxIdCopy] action in Button widget.
  int? taxIdWMul;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoryRecord? catWMul;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OutletRecord? outlet;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductRecord? docWMul2;
  // Stores action output result for [Custom Action - getUnitTypes] action in Button widget.
  int? unitIdW;
  // Stores action output result for [Custom Action - getTaxIdCopy] action in Button widget.
  int? taxIdW;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoryRecord? catW;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductRecord? docW;

  @override
  void initState(BuildContext context) {
    productNameMTextControllerValidator = _productNameMTextControllerValidator;
    sellingPriceMTextControllerValidator =
        _sellingPriceMTextControllerValidator;
    productNameWTextControllerValidator = _productNameWTextControllerValidator;
    sellingPriceWTextControllerValidator =
        _sellingPriceWTextControllerValidator;
    multipalPriceCompModels =
        FlutterFlowDynamicModels(() => MultipalPriceCompModel());
  }

  @override
  void dispose() {
    codeMFocusNode?.dispose();
    codeMTextController?.dispose();

    productNameMFocusNode?.dispose();
    productNameMTextController?.dispose();

    sellingPriceMFocusNode?.dispose();
    sellingPriceMTextController?.dispose();

    mRPPriceMFocusNode?.dispose();
    mRPPriceMTextController?.dispose();

    purchasePriceMFocusNode?.dispose();
    purchasePriceMTextController?.dispose();

    regionalNameMFocusNode?.dispose();
    regionalNameMTextController?.dispose();

    recorderLevelMFocusNode?.dispose();
    recorderLevelMTextController?.dispose();

    discountPerMFocusNode?.dispose();
    discountPerMTextController?.dispose();

    shortNameMFocusNode?.dispose();
    shortNameMTextController?.dispose();

    currentStockMFocusNode?.dispose();
    currentStockMTextController?.dispose();

    barcodeMFocusNode?.dispose();
    barcodeMTextController?.dispose();

    hsnMFocusNode?.dispose();
    hsnMTextController?.dispose();

    codeWFocusNode?.dispose();
    codeWTextController?.dispose();

    productNameWFocusNode?.dispose();
    productNameWTextController?.dispose();

    sellingPriceWFocusNode?.dispose();
    sellingPriceWTextController?.dispose();

    mRPPriceWFocusNode?.dispose();
    mRPPriceWTextController?.dispose();

    purchasePriceWFocusNode?.dispose();
    purchasePriceWTextController?.dispose();

    multipalPriceCompModels.dispose();
    regionalNameWFocusNode?.dispose();
    regionalNameWTextController?.dispose();

    recorderLevelWFocusNode?.dispose();
    recorderLevelWTextController?.dispose();

    discountPerWFocusNode?.dispose();
    discountPerWTextController?.dispose();

    shortNameWFocusNode?.dispose();
    shortNameWTextController?.dispose();

    hsnWFocusNode?.dispose();
    hsnWTextController?.dispose();

    barcodeWFocusNode?.dispose();
    barcodeWTextController?.dispose();

    currentStockWFocusNode?.dispose();
    currentStockWTextController?.dispose();
  }
}
