// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductListStruct extends FFFirebaseStruct {
  ProductListStruct({
    String? name,
    String? id,
    double? requestedStock,
    double? currentStock,
    String? type,
    String? note,
    double? inWardStock,
    String? status,
    double? reqStock,
    int? code,
    DocumentReference? ref,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _id = id,
        _requestedStock = requestedStock,
        _currentStock = currentStock,
        _type = type,
        _note = note,
        _inWardStock = inWardStock,
        _status = status,
        _reqStock = reqStock,
        _code = code,
        _ref = ref,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "requestedStock" field.
  double? _requestedStock;
  double get requestedStock => _requestedStock ?? 0.0;
  set requestedStock(double? val) => _requestedStock = val;

  void incrementRequestedStock(double amount) =>
      requestedStock = requestedStock + amount;

  bool hasRequestedStock() => _requestedStock != null;

  // "currentStock" field.
  double? _currentStock;
  double get currentStock => _currentStock ?? 0.0;
  set currentStock(double? val) => _currentStock = val;

  void incrementCurrentStock(double amount) =>
      currentStock = currentStock + amount;

  bool hasCurrentStock() => _currentStock != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "inWardStock" field.
  double? _inWardStock;
  double get inWardStock => _inWardStock ?? 0.0;
  set inWardStock(double? val) => _inWardStock = val;

  void incrementInWardStock(double amount) =>
      inWardStock = inWardStock + amount;

  bool hasInWardStock() => _inWardStock != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "reqStock" field.
  double? _reqStock;
  double get reqStock => _reqStock ?? 0.0;
  set reqStock(double? val) => _reqStock = val;

  void incrementReqStock(double amount) => reqStock = reqStock + amount;

  bool hasReqStock() => _reqStock != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "ref" field.
  DocumentReference? _ref;
  DocumentReference? get ref => _ref;
  set ref(DocumentReference? val) => _ref = val;

  bool hasRef() => _ref != null;

  static ProductListStruct fromMap(Map<String, dynamic> data) =>
      ProductListStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
        requestedStock: castToType<double>(data['requestedStock']),
        currentStock: castToType<double>(data['currentStock']),
        type: data['type'] as String?,
        note: data['note'] as String?,
        inWardStock: castToType<double>(data['inWardStock']),
        status: data['status'] as String?,
        reqStock: castToType<double>(data['reqStock']),
        code: castToType<int>(data['code']),
        ref: data['ref'] as DocumentReference?,
      );

  static ProductListStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'requestedStock': _requestedStock,
        'currentStock': _currentStock,
        'type': _type,
        'note': _note,
        'inWardStock': _inWardStock,
        'status': _status,
        'reqStock': _reqStock,
        'code': _code,
        'ref': _ref,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'requestedStock': serializeParam(
          _requestedStock,
          ParamType.double,
        ),
        'currentStock': serializeParam(
          _currentStock,
          ParamType.double,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'inWardStock': serializeParam(
          _inWardStock,
          ParamType.double,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'reqStock': serializeParam(
          _reqStock,
          ParamType.double,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'ref': serializeParam(
          _ref,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ProductListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductListStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        requestedStock: deserializeParam(
          data['requestedStock'],
          ParamType.double,
          false,
        ),
        currentStock: deserializeParam(
          data['currentStock'],
          ParamType.double,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        inWardStock: deserializeParam(
          data['inWardStock'],
          ParamType.double,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
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
        ref: deserializeParam(
          data['ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['OUTLET', 'PRODUCT'],
        ),
      );

  @override
  String toString() => 'ProductListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductListStruct &&
        name == other.name &&
        id == other.id &&
        requestedStock == other.requestedStock &&
        currentStock == other.currentStock &&
        type == other.type &&
        note == other.note &&
        inWardStock == other.inWardStock &&
        status == other.status &&
        reqStock == other.reqStock &&
        code == other.code &&
        ref == other.ref;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        id,
        requestedStock,
        currentStock,
        type,
        note,
        inWardStock,
        status,
        reqStock,
        code,
        ref
      ]);
}

ProductListStruct createProductListStruct({
  String? name,
  String? id,
  double? requestedStock,
  double? currentStock,
  String? type,
  String? note,
  double? inWardStock,
  String? status,
  double? reqStock,
  int? code,
  DocumentReference? ref,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductListStruct(
      name: name,
      id: id,
      requestedStock: requestedStock,
      currentStock: currentStock,
      type: type,
      note: note,
      inWardStock: inWardStock,
      status: status,
      reqStock: reqStock,
      code: code,
      ref: ref,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductListStruct? updateProductListStruct(
  ProductListStruct? productList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductListStructData(
  Map<String, dynamic> firestoreData,
  ProductListStruct? productList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productList == null) {
    return;
  }
  if (productList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productListData =
      getProductListFirestoreData(productList, forFieldValue);
  final nestedData =
      productListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductListFirestoreData(
  ProductListStruct? productList, [
  bool forFieldValue = false,
]) {
  if (productList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productList.toMap());

  // Add any Firestore field values
  productList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductListListFirestoreData(
  List<ProductListStruct>? productLists,
) =>
    productLists?.map((e) => getProductListFirestoreData(e, true)).toList() ??
    [];
