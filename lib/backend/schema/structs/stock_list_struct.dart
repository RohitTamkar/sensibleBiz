// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StockListStruct extends FFFirebaseStruct {
  StockListStruct({
    String? name,
    double? currenStock,
    double? reqStock,
    int? code,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _currenStock = currenStock,
        _reqStock = reqStock,
        _code = code,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "currenStock" field.
  double? _currenStock;
  double get currenStock => _currenStock ?? 0.0;
  set currenStock(double? val) => _currenStock = val;
  void incrementCurrenStock(double amount) =>
      _currenStock = currenStock + amount;
  bool hasCurrenStock() => _currenStock != null;

  // "reqStock" field.
  double? _reqStock;
  double get reqStock => _reqStock ?? 0.0;
  set reqStock(double? val) => _reqStock = val;
  void incrementReqStock(double amount) => _reqStock = reqStock + amount;
  bool hasReqStock() => _reqStock != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;
  void incrementCode(int amount) => _code = code + amount;
  bool hasCode() => _code != null;

  static StockListStruct fromMap(Map<String, dynamic> data) => StockListStruct(
        name: data['name'] as String?,
        currenStock: castToType<double>(data['currenStock']),
        reqStock: castToType<double>(data['reqStock']),
        code: castToType<int>(data['code']),
      );

  static StockListStruct? maybeFromMap(dynamic data) => data is Map
      ? StockListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'currenStock': _currenStock,
        'reqStock': _reqStock,
        'code': _code,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'currenStock': serializeParam(
          _currenStock,
          ParamType.double,
        ),
        'reqStock': serializeParam(
          _reqStock,
          ParamType.double,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
      }.withoutNulls;

  static StockListStruct fromSerializableMap(Map<String, dynamic> data) =>
      StockListStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        currenStock: deserializeParam(
          data['currenStock'],
          ParamType.double,
          false,
        ),
        reqStock: deserializeParam(
          data['reqStock'],
          ParamType.double,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'StockListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StockListStruct &&
        name == other.name &&
        currenStock == other.currenStock &&
        reqStock == other.reqStock &&
        code == other.code;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, currenStock, reqStock, code]);
}

StockListStruct createStockListStruct({
  String? name,
  double? currenStock,
  double? reqStock,
  int? code,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StockListStruct(
      name: name,
      currenStock: currenStock,
      reqStock: reqStock,
      code: code,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StockListStruct? updateStockListStruct(
  StockListStruct? stockList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stockList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStockListStructData(
  Map<String, dynamic> firestoreData,
  StockListStruct? stockList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stockList == null) {
    return;
  }
  if (stockList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stockList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stockListData = getStockListFirestoreData(stockList, forFieldValue);
  final nestedData = stockListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stockList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStockListFirestoreData(
  StockListStruct? stockList, [
  bool forFieldValue = false,
]) {
  if (stockList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stockList.toMap());

  // Add any Firestore field values
  stockList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStockListListFirestoreData(
  List<StockListStruct>? stockLists,
) =>
    stockLists?.map((e) => getStockListFirestoreData(e, true)).toList() ?? [];
