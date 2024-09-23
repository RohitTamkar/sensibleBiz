// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductListMapStruct extends FFFirebaseStruct {
  ProductListMapStruct({
    String? catId,
    String? id,
    bool? isDeletedItem,
    String? name,
    double? price,
    double? quantity,
    double? taxAmt,
    String? taxId,
    double? taxPer,
    double? total,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _catId = catId,
        _id = id,
        _isDeletedItem = isDeletedItem,
        _name = name,
        _price = price,
        _quantity = quantity,
        _taxAmt = taxAmt,
        _taxId = taxId,
        _taxPer = taxPer,
        _total = total,
        super(firestoreUtilData);

  // "catId" field.
  String? _catId;
  String get catId => _catId ?? '';
  set catId(String? val) => _catId = val;

  bool hasCatId() => _catId != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "isDeletedItem" field.
  bool? _isDeletedItem;
  bool get isDeletedItem => _isDeletedItem ?? false;
  set isDeletedItem(bool? val) => _isDeletedItem = val;

  bool hasIsDeletedItem() => _isDeletedItem != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;

  void incrementQuantity(double amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "taxAmt" field.
  double? _taxAmt;
  double get taxAmt => _taxAmt ?? 0.0;
  set taxAmt(double? val) => _taxAmt = val;

  void incrementTaxAmt(double amount) => taxAmt = taxAmt + amount;

  bool hasTaxAmt() => _taxAmt != null;

  // "taxId" field.
  String? _taxId;
  String get taxId => _taxId ?? '';
  set taxId(String? val) => _taxId = val;

  bool hasTaxId() => _taxId != null;

  // "taxPer" field.
  double? _taxPer;
  double get taxPer => _taxPer ?? 0.0;
  set taxPer(double? val) => _taxPer = val;

  void incrementTaxPer(double amount) => taxPer = taxPer + amount;

  bool hasTaxPer() => _taxPer != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static ProductListMapStruct fromMap(Map<String, dynamic> data) =>
      ProductListMapStruct(
        catId: data['catId'] as String?,
        id: data['id'] as String?,
        isDeletedItem: data['isDeletedItem'] as bool?,
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
        quantity: castToType<double>(data['quantity']),
        taxAmt: castToType<double>(data['taxAmt']),
        taxId: data['taxId'] as String?,
        taxPer: castToType<double>(data['taxPer']),
        total: castToType<double>(data['total']),
      );

  static ProductListMapStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductListMapStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'catId': _catId,
        'id': _id,
        'isDeletedItem': _isDeletedItem,
        'name': _name,
        'price': _price,
        'quantity': _quantity,
        'taxAmt': _taxAmt,
        'taxId': _taxId,
        'taxPer': _taxPer,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'catId': serializeParam(
          _catId,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'isDeletedItem': serializeParam(
          _isDeletedItem,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'taxAmt': serializeParam(
          _taxAmt,
          ParamType.double,
        ),
        'taxId': serializeParam(
          _taxId,
          ParamType.String,
        ),
        'taxPer': serializeParam(
          _taxPer,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
      }.withoutNulls;

  static ProductListMapStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductListMapStruct(
        catId: deserializeParam(
          data['catId'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        isDeletedItem: deserializeParam(
          data['isDeletedItem'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.double,
          false,
        ),
        taxAmt: deserializeParam(
          data['taxAmt'],
          ParamType.double,
          false,
        ),
        taxId: deserializeParam(
          data['taxId'],
          ParamType.String,
          false,
        ),
        taxPer: deserializeParam(
          data['taxPer'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'ProductListMapStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductListMapStruct &&
        catId == other.catId &&
        id == other.id &&
        isDeletedItem == other.isDeletedItem &&
        name == other.name &&
        price == other.price &&
        quantity == other.quantity &&
        taxAmt == other.taxAmt &&
        taxId == other.taxId &&
        taxPer == other.taxPer &&
        total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([
        catId,
        id,
        isDeletedItem,
        name,
        price,
        quantity,
        taxAmt,
        taxId,
        taxPer,
        total
      ]);
}

ProductListMapStruct createProductListMapStruct({
  String? catId,
  String? id,
  bool? isDeletedItem,
  String? name,
  double? price,
  double? quantity,
  double? taxAmt,
  String? taxId,
  double? taxPer,
  double? total,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductListMapStruct(
      catId: catId,
      id: id,
      isDeletedItem: isDeletedItem,
      name: name,
      price: price,
      quantity: quantity,
      taxAmt: taxAmt,
      taxId: taxId,
      taxPer: taxPer,
      total: total,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductListMapStruct? updateProductListMapStruct(
  ProductListMapStruct? productListMap, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productListMap
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductListMapStructData(
  Map<String, dynamic> firestoreData,
  ProductListMapStruct? productListMap,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productListMap == null) {
    return;
  }
  if (productListMap.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productListMap.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productListMapData =
      getProductListMapFirestoreData(productListMap, forFieldValue);
  final nestedData =
      productListMapData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productListMap.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductListMapFirestoreData(
  ProductListMapStruct? productListMap, [
  bool forFieldValue = false,
]) {
  if (productListMap == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productListMap.toMap());

  // Add any Firestore field values
  productListMap.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductListMapListFirestoreData(
  List<ProductListMapStruct>? productListMaps,
) =>
    productListMaps
        ?.map((e) => getProductListMapFirestoreData(e, true))
        .toList() ??
    [];
