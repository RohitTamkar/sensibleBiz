// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserListStruct extends FFFirebaseStruct {
  UserListStruct({
    bool? barcode,
    bool? editBill,
    bool? goodsReceived,
    bool? productAdd,
    bool? reports,
    bool? settings,
    bool? shiftReport,
    bool? stockOut,
    bool? payment,
    bool? kOTModify,
    bool? bizAppScanQR,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _barcode = barcode,
        _editBill = editBill,
        _goodsReceived = goodsReceived,
        _productAdd = productAdd,
        _reports = reports,
        _settings = settings,
        _shiftReport = shiftReport,
        _stockOut = stockOut,
        _payment = payment,
        _kOTModify = kOTModify,
        _bizAppScanQR = bizAppScanQR,
        super(firestoreUtilData);

  // "Barcode" field.
  bool? _barcode;
  bool get barcode => _barcode ?? false;
  set barcode(bool? val) => _barcode = val;

  bool hasBarcode() => _barcode != null;

  // "EditBill" field.
  bool? _editBill;
  bool get editBill => _editBill ?? false;
  set editBill(bool? val) => _editBill = val;

  bool hasEditBill() => _editBill != null;

  // "GoodsReceived" field.
  bool? _goodsReceived;
  bool get goodsReceived => _goodsReceived ?? false;
  set goodsReceived(bool? val) => _goodsReceived = val;

  bool hasGoodsReceived() => _goodsReceived != null;

  // "ProductAdd" field.
  bool? _productAdd;
  bool get productAdd => _productAdd ?? false;
  set productAdd(bool? val) => _productAdd = val;

  bool hasProductAdd() => _productAdd != null;

  // "Reports" field.
  bool? _reports;
  bool get reports => _reports ?? false;
  set reports(bool? val) => _reports = val;

  bool hasReports() => _reports != null;

  // "Settings" field.
  bool? _settings;
  bool get settings => _settings ?? false;
  set settings(bool? val) => _settings = val;

  bool hasSettings() => _settings != null;

  // "ShiftReport" field.
  bool? _shiftReport;
  bool get shiftReport => _shiftReport ?? false;
  set shiftReport(bool? val) => _shiftReport = val;

  bool hasShiftReport() => _shiftReport != null;

  // "StockOut" field.
  bool? _stockOut;
  bool get stockOut => _stockOut ?? false;
  set stockOut(bool? val) => _stockOut = val;

  bool hasStockOut() => _stockOut != null;

  // "payment" field.
  bool? _payment;
  bool get payment => _payment ?? false;
  set payment(bool? val) => _payment = val;

  bool hasPayment() => _payment != null;

  // "KOTModify" field.
  bool? _kOTModify;
  bool get kOTModify => _kOTModify ?? false;
  set kOTModify(bool? val) => _kOTModify = val;

  bool hasKOTModify() => _kOTModify != null;

  // "bizAppScanQR" field.
  bool? _bizAppScanQR;
  bool get bizAppScanQR => _bizAppScanQR ?? false;
  set bizAppScanQR(bool? val) => _bizAppScanQR = val;

  bool hasBizAppScanQR() => _bizAppScanQR != null;

  static UserListStruct fromMap(Map<String, dynamic> data) => UserListStruct(
        barcode: data['Barcode'] as bool?,
        editBill: data['EditBill'] as bool?,
        goodsReceived: data['GoodsReceived'] as bool?,
        productAdd: data['ProductAdd'] as bool?,
        reports: data['Reports'] as bool?,
        settings: data['Settings'] as bool?,
        shiftReport: data['ShiftReport'] as bool?,
        stockOut: data['StockOut'] as bool?,
        payment: data['payment'] as bool?,
        kOTModify: data['KOTModify'] as bool?,
        bizAppScanQR: data['bizAppScanQR'] as bool?,
      );

  static UserListStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Barcode': _barcode,
        'EditBill': _editBill,
        'GoodsReceived': _goodsReceived,
        'ProductAdd': _productAdd,
        'Reports': _reports,
        'Settings': _settings,
        'ShiftReport': _shiftReport,
        'StockOut': _stockOut,
        'payment': _payment,
        'KOTModify': _kOTModify,
        'bizAppScanQR': _bizAppScanQR,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Barcode': serializeParam(
          _barcode,
          ParamType.bool,
        ),
        'EditBill': serializeParam(
          _editBill,
          ParamType.bool,
        ),
        'GoodsReceived': serializeParam(
          _goodsReceived,
          ParamType.bool,
        ),
        'ProductAdd': serializeParam(
          _productAdd,
          ParamType.bool,
        ),
        'Reports': serializeParam(
          _reports,
          ParamType.bool,
        ),
        'Settings': serializeParam(
          _settings,
          ParamType.bool,
        ),
        'ShiftReport': serializeParam(
          _shiftReport,
          ParamType.bool,
        ),
        'StockOut': serializeParam(
          _stockOut,
          ParamType.bool,
        ),
        'payment': serializeParam(
          _payment,
          ParamType.bool,
        ),
        'KOTModify': serializeParam(
          _kOTModify,
          ParamType.bool,
        ),
        'bizAppScanQR': serializeParam(
          _bizAppScanQR,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserListStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserListStruct(
        barcode: deserializeParam(
          data['Barcode'],
          ParamType.bool,
          false,
        ),
        editBill: deserializeParam(
          data['EditBill'],
          ParamType.bool,
          false,
        ),
        goodsReceived: deserializeParam(
          data['GoodsReceived'],
          ParamType.bool,
          false,
        ),
        productAdd: deserializeParam(
          data['ProductAdd'],
          ParamType.bool,
          false,
        ),
        reports: deserializeParam(
          data['Reports'],
          ParamType.bool,
          false,
        ),
        settings: deserializeParam(
          data['Settings'],
          ParamType.bool,
          false,
        ),
        shiftReport: deserializeParam(
          data['ShiftReport'],
          ParamType.bool,
          false,
        ),
        stockOut: deserializeParam(
          data['StockOut'],
          ParamType.bool,
          false,
        ),
        payment: deserializeParam(
          data['payment'],
          ParamType.bool,
          false,
        ),
        kOTModify: deserializeParam(
          data['KOTModify'],
          ParamType.bool,
          false,
        ),
        bizAppScanQR: deserializeParam(
          data['bizAppScanQR'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserListStruct &&
        barcode == other.barcode &&
        editBill == other.editBill &&
        goodsReceived == other.goodsReceived &&
        productAdd == other.productAdd &&
        reports == other.reports &&
        settings == other.settings &&
        shiftReport == other.shiftReport &&
        stockOut == other.stockOut &&
        payment == other.payment &&
        kOTModify == other.kOTModify &&
        bizAppScanQR == other.bizAppScanQR;
  }

  @override
  int get hashCode => const ListEquality().hash([
        barcode,
        editBill,
        goodsReceived,
        productAdd,
        reports,
        settings,
        shiftReport,
        stockOut,
        payment,
        kOTModify,
        bizAppScanQR
      ]);
}

UserListStruct createUserListStruct({
  bool? barcode,
  bool? editBill,
  bool? goodsReceived,
  bool? productAdd,
  bool? reports,
  bool? settings,
  bool? shiftReport,
  bool? stockOut,
  bool? payment,
  bool? kOTModify,
  bool? bizAppScanQR,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserListStruct(
      barcode: barcode,
      editBill: editBill,
      goodsReceived: goodsReceived,
      productAdd: productAdd,
      reports: reports,
      settings: settings,
      shiftReport: shiftReport,
      stockOut: stockOut,
      payment: payment,
      kOTModify: kOTModify,
      bizAppScanQR: bizAppScanQR,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserListStruct? updateUserListStruct(
  UserListStruct? userList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserListStructData(
  Map<String, dynamic> firestoreData,
  UserListStruct? userList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userList == null) {
    return;
  }
  if (userList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userListData = getUserListFirestoreData(userList, forFieldValue);
  final nestedData = userListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserListFirestoreData(
  UserListStruct? userList, [
  bool forFieldValue = false,
]) {
  if (userList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userList.toMap());

  // Add any Firestore field values
  userList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListListFirestoreData(
  List<UserListStruct>? userLists,
) =>
    userLists?.map((e) => getUserListFirestoreData(e, true)).toList() ?? [];
