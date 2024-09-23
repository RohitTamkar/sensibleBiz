// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillSaleItemDTStruct extends FFFirebaseStruct {
  BillSaleItemDTStruct({
    double? price,
    double? quantity,
    double? total,
    String? product,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _price = price,
        _quantity = quantity,
        _total = total,
        _product = product,
        super(firestoreUtilData);

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

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "product" field.
  String? _product;
  String get product => _product ?? '';
  set product(String? val) => _product = val;

  bool hasProduct() => _product != null;

  static BillSaleItemDTStruct fromMap(Map<String, dynamic> data) =>
      BillSaleItemDTStruct(
        price: castToType<double>(data['price']),
        quantity: castToType<double>(data['quantity']),
        total: castToType<double>(data['total']),
        product: data['product'] as String?,
      );

  static BillSaleItemDTStruct? maybeFromMap(dynamic data) => data is Map
      ? BillSaleItemDTStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'price': _price,
        'quantity': _quantity,
        'total': _total,
        'product': _product,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'product': serializeParam(
          _product,
          ParamType.String,
        ),
      }.withoutNulls;

  static BillSaleItemDTStruct fromSerializableMap(Map<String, dynamic> data) =>
      BillSaleItemDTStruct(
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
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        product: deserializeParam(
          data['product'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BillSaleItemDTStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BillSaleItemDTStruct &&
        price == other.price &&
        quantity == other.quantity &&
        total == other.total &&
        product == other.product;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([price, quantity, total, product]);
}

BillSaleItemDTStruct createBillSaleItemDTStruct({
  double? price,
  double? quantity,
  double? total,
  String? product,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BillSaleItemDTStruct(
      price: price,
      quantity: quantity,
      total: total,
      product: product,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BillSaleItemDTStruct? updateBillSaleItemDTStruct(
  BillSaleItemDTStruct? billSaleItemDT, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    billSaleItemDT
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBillSaleItemDTStructData(
  Map<String, dynamic> firestoreData,
  BillSaleItemDTStruct? billSaleItemDT,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (billSaleItemDT == null) {
    return;
  }
  if (billSaleItemDT.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && billSaleItemDT.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final billSaleItemDTData =
      getBillSaleItemDTFirestoreData(billSaleItemDT, forFieldValue);
  final nestedData =
      billSaleItemDTData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = billSaleItemDT.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBillSaleItemDTFirestoreData(
  BillSaleItemDTStruct? billSaleItemDT, [
  bool forFieldValue = false,
]) {
  if (billSaleItemDT == null) {
    return {};
  }
  final firestoreData = mapToFirestore(billSaleItemDT.toMap());

  // Add any Firestore field values
  billSaleItemDT.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBillSaleItemDTListFirestoreData(
  List<BillSaleItemDTStruct>? billSaleItemDTs,
) =>
    billSaleItemDTs
        ?.map((e) => getBillSaleItemDTFirestoreData(e, true))
        .toList() ??
    [];
