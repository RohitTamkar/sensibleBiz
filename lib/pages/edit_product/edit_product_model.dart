import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_product_widget.dart' show EditProductWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditProductModel extends FlutterFlowModel<EditProductWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Read Document] action in EditProduct widget.
  CategoryRecord? catResultM;
  // Stores action output result for [Firestore Query - Query a collection] action in EditProduct widget.
  UserProfileRecord? docMobile;
  // Stores action output result for [Firestore Query - Query a collection] action in EditProduct widget.
  ProductRecord? productDocument;
  // State field(s) for TextFieldCodeM widget.
  FocusNode? textFieldCodeMFocusNode;
  TextEditingController? textFieldCodeMTextController;
  String? Function(BuildContext, String?)?
      textFieldCodeMTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for productNameM widget.
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

  // State field(s) for TextFieldSellingPriceM widget.
  FocusNode? textFieldSellingPriceMFocusNode;
  TextEditingController? textFieldSellingPriceMTextController;
  String? Function(BuildContext, String?)?
      textFieldSellingPriceMTextControllerValidator;
  String? _textFieldSellingPriceMTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldMRPPriceM widget.
  FocusNode? textFieldMRPPriceMFocusNode;
  TextEditingController? textFieldMRPPriceMTextController;
  String? Function(BuildContext, String?)?
      textFieldMRPPriceMTextControllerValidator;
  // State field(s) for TextFieldPurchasePriceM widget.
  FocusNode? textFieldPurchasePriceMFocusNode;
  TextEditingController? textFieldPurchasePriceMTextController;
  String? Function(BuildContext, String?)?
      textFieldPurchasePriceMTextControllerValidator;
  // State field(s) for CatDropDownM widget.
  String? catDropDownMValue;
  FormFieldController<String>? catDropDownMValueController;
  // State field(s) for TextFieldRegionalNameM widget.
  FocusNode? textFieldRegionalNameMFocusNode;
  TextEditingController? textFieldRegionalNameMTextController;
  String? Function(BuildContext, String?)?
      textFieldRegionalNameMTextControllerValidator;
  // State field(s) for TextFieldRecorderLevelM widget.
  FocusNode? textFieldRecorderLevelMFocusNode;
  TextEditingController? textFieldRecorderLevelMTextController;
  String? Function(BuildContext, String?)?
      textFieldRecorderLevelMTextControllerValidator;
  // State field(s) for TextFieldDiscountPerM widget.
  FocusNode? textFieldDiscountPerMFocusNode1;
  TextEditingController? textFieldDiscountPerMTextController1;
  String? Function(BuildContext, String?)?
      textFieldDiscountPerMTextController1Validator;
  // State field(s) for TextFieldDiscountPerM widget.
  FocusNode? textFieldDiscountPerMFocusNode2;
  TextEditingController? textFieldDiscountPerMTextController2;
  String? Function(BuildContext, String?)?
      textFieldDiscountPerMTextController2Validator;
  // State field(s) for WightCheckboM widget.
  bool? wightCheckboMValue;
  // State field(s) for StockCheckboxM widget.
  bool? stockCheckboxMValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for TaxDropDownM widget.
  String? taxDropDownMValue;
  FormFieldController<String>? taxDropDownMValueController;
  // State field(s) for UnitDropDownM widget.
  String? unitDropDownMValue;
  FormFieldController<String>? unitDropDownMValueController;
  // State field(s) for TextFieldShortNameM widget.
  FocusNode? textFieldShortNameMFocusNode;
  TextEditingController? textFieldShortNameMTextController;
  String? Function(BuildContext, String?)?
      textFieldShortNameMTextControllerValidator;
  // State field(s) for TextFieldCurrentStockM widget.
  FocusNode? textFieldCurrentStockMFocusNode;
  TextEditingController? textFieldCurrentStockMTextController;
  String? Function(BuildContext, String?)?
      textFieldCurrentStockMTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ExpandableM widget.
  late ExpandableController expandableMExpandableController;

  // State field(s) for TextFieldBarcodeM widget.
  FocusNode? textFieldBarcodeMFocusNode;
  TextEditingController? textFieldBarcodeMTextController;
  String? Function(BuildContext, String?)?
      textFieldBarcodeMTextControllerValidator;
  // State field(s) for TextFieldHsnCodeM widget.
  FocusNode? textFieldHsnCodeMFocusNode;
  TextEditingController? textFieldHsnCodeMTextController;
  String? Function(BuildContext, String?)?
      textFieldHsnCodeMTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoryRecord? category2;
  // Stores action output result for [Custom Action - getUnitTypes] action in Button widget.
  int? unitIdM;
  // Stores action output result for [Custom Action - getTaxIdCopy] action in Button widget.
  int? taxIdM;
  // State field(s) for TextFieldCodeW widget.
  FocusNode? textFieldCodeWFocusNode;
  TextEditingController? textFieldCodeWTextController;
  String? Function(BuildContext, String?)?
      textFieldCodeWTextControllerValidator;
  // State field(s) for Checkbox2 widget.
  bool? checkbox2Value;
  // State field(s) for productNameW widget.
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

  // State field(s) for TextFieldSellingPriceW widget.
  FocusNode? textFieldSellingPriceWFocusNode;
  TextEditingController? textFieldSellingPriceWTextController;
  String? Function(BuildContext, String?)?
      textFieldSellingPriceWTextControllerValidator;
  String? _textFieldSellingPriceWTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for TextFieldMRPPriceW widget.
  FocusNode? textFieldMRPPriceWFocusNode;
  TextEditingController? textFieldMRPPriceWTextController;
  String? Function(BuildContext, String?)?
      textFieldMRPPriceWTextControllerValidator;
  // State field(s) for TextFieldPurchasePriceW widget.
  FocusNode? textFieldPurchasePriceWFocusNode;
  TextEditingController? textFieldPurchasePriceWTextController;
  String? Function(BuildContext, String?)?
      textFieldPurchasePriceWTextControllerValidator;
  // State field(s) for TextFieldCurrentStockW widget.
  FocusNode? textFieldCurrentStockWFocusNode;
  TextEditingController? textFieldCurrentStockWTextController;
  String? Function(BuildContext, String?)?
      textFieldCurrentStockWTextControllerValidator;
  // State field(s) for CatDropDownW widget.
  String? catDropDownWValue;
  FormFieldController<String>? catDropDownWValueController;
  // State field(s) for TextFieldRegionalNameW widget.
  FocusNode? textFieldRegionalNameWFocusNode;
  TextEditingController? textFieldRegionalNameWTextController;
  String? Function(BuildContext, String?)?
      textFieldRegionalNameWTextControllerValidator;
  // State field(s) for TextFieldRecorderLevelW widget.
  FocusNode? textFieldRecorderLevelWFocusNode;
  TextEditingController? textFieldRecorderLevelWTextController;
  String? Function(BuildContext, String?)?
      textFieldRecorderLevelWTextControllerValidator;
  // State field(s) for TextFieldDiscountPerW widget.
  FocusNode? textFieldDiscountPerWFocusNode1;
  TextEditingController? textFieldDiscountPerWTextController1;
  String? Function(BuildContext, String?)?
      textFieldDiscountPerWTextController1Validator;
  // State field(s) for TextFieldDiscountPerW widget.
  FocusNode? textFieldDiscountPerWFocusNode2;
  TextEditingController? textFieldDiscountPerWTextController2;
  String? Function(BuildContext, String?)?
      textFieldDiscountPerWTextController2Validator;
  // State field(s) for WightCheckboWN widget.
  bool? wightCheckboWNValue;
  // State field(s) for StockCheckboxWN widget.
  bool? stockCheckboxWNValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for TaxDropDownTaxW widget.
  String? taxDropDownTaxWValue;
  FormFieldController<String>? taxDropDownTaxWValueController;
  // State field(s) for UnitDropDownW widget.
  String? unitDropDownWValue;
  FormFieldController<String>? unitDropDownWValueController;
  // State field(s) for ServiceDropDown widget.
  String? serviceDropDownValue;
  FormFieldController<String>? serviceDropDownValueController;
  // State field(s) for TextFieldShortNameW widget.
  FocusNode? textFieldShortNameWFocusNode;
  TextEditingController? textFieldShortNameWTextController;
  String? Function(BuildContext, String?)?
      textFieldShortNameWTextControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for TextFieldBarcodeW widget.
  FocusNode? textFieldBarcodeWFocusNode;
  TextEditingController? textFieldBarcodeWTextController;
  String? Function(BuildContext, String?)?
      textFieldBarcodeWTextControllerValidator;
  // Stores action output result for [Custom Action - barcodeRandomGeneratedNew] action in Button widget.
  String? barcodeScan3;
  // State field(s) for TextFieldHsnW widget.
  FocusNode? textFieldHsnWFocusNode;
  TextEditingController? textFieldHsnWTextController;
  String? Function(BuildContext, String?)? textFieldHsnWTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CategoryRecord? category5;
  // Stores action output result for [Custom Action - getUnitTypes] action in Button widget.
  int? unitId1W;
  // Stores action output result for [Custom Action - getTaxIdCopy] action in Button widget.
  int? taxId1W;

  @override
  void initState(BuildContext context) {
    productNameMTextControllerValidator = _productNameMTextControllerValidator;
    textFieldSellingPriceMTextControllerValidator =
        _textFieldSellingPriceMTextControllerValidator;
    productNameWTextControllerValidator = _productNameWTextControllerValidator;
    textFieldSellingPriceWTextControllerValidator =
        _textFieldSellingPriceWTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldCodeMFocusNode?.dispose();
    textFieldCodeMTextController?.dispose();

    productNameMFocusNode?.dispose();
    productNameMTextController?.dispose();

    textFieldSellingPriceMFocusNode?.dispose();
    textFieldSellingPriceMTextController?.dispose();

    textFieldMRPPriceMFocusNode?.dispose();
    textFieldMRPPriceMTextController?.dispose();

    textFieldPurchasePriceMFocusNode?.dispose();
    textFieldPurchasePriceMTextController?.dispose();

    textFieldRegionalNameMFocusNode?.dispose();
    textFieldRegionalNameMTextController?.dispose();

    textFieldRecorderLevelMFocusNode?.dispose();
    textFieldRecorderLevelMTextController?.dispose();

    textFieldDiscountPerMFocusNode1?.dispose();
    textFieldDiscountPerMTextController1?.dispose();

    textFieldDiscountPerMFocusNode2?.dispose();
    textFieldDiscountPerMTextController2?.dispose();

    expandableExpandableController1.dispose();
    textFieldShortNameMFocusNode?.dispose();
    textFieldShortNameMTextController?.dispose();

    textFieldCurrentStockMFocusNode?.dispose();
    textFieldCurrentStockMTextController?.dispose();

    expandableMExpandableController.dispose();
    textFieldBarcodeMFocusNode?.dispose();
    textFieldBarcodeMTextController?.dispose();

    textFieldHsnCodeMFocusNode?.dispose();
    textFieldHsnCodeMTextController?.dispose();

    textFieldCodeWFocusNode?.dispose();
    textFieldCodeWTextController?.dispose();

    productNameWFocusNode?.dispose();
    productNameWTextController?.dispose();

    textFieldSellingPriceWFocusNode?.dispose();
    textFieldSellingPriceWTextController?.dispose();

    textFieldMRPPriceWFocusNode?.dispose();
    textFieldMRPPriceWTextController?.dispose();

    textFieldPurchasePriceWFocusNode?.dispose();
    textFieldPurchasePriceWTextController?.dispose();

    textFieldCurrentStockWFocusNode?.dispose();
    textFieldCurrentStockWTextController?.dispose();

    textFieldRegionalNameWFocusNode?.dispose();
    textFieldRegionalNameWTextController?.dispose();

    textFieldRecorderLevelWFocusNode?.dispose();
    textFieldRecorderLevelWTextController?.dispose();

    textFieldDiscountPerWFocusNode1?.dispose();
    textFieldDiscountPerWTextController1?.dispose();

    textFieldDiscountPerWFocusNode2?.dispose();
    textFieldDiscountPerWTextController2?.dispose();

    expandableExpandableController2.dispose();
    textFieldShortNameWFocusNode?.dispose();
    textFieldShortNameWTextController?.dispose();

    expandableExpandableController3.dispose();
    textFieldBarcodeWFocusNode?.dispose();
    textFieldBarcodeWTextController?.dispose();

    textFieldHsnWFocusNode?.dispose();
    textFieldHsnWTextController?.dispose();
  }
}
