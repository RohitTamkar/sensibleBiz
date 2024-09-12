import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductRecord extends FirestoreRecord {
  ProductRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  bool hasBarcode() => _barcode != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "cess" field.
  double? _cess;
  double get cess => _cess ?? 0.0;
  bool hasCess() => _cess != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "costPrice" field.
  double? _costPrice;
  double get costPrice => _costPrice ?? 0.0;
  bool hasCostPrice() => _costPrice != null;

  // "dateTme" field.
  DateTime? _dateTme;
  DateTime? get dateTme => _dateTme;
  bool hasDateTme() => _dateTme != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  bool hasDiscount() => _discount != null;

  // "keyCount" field.
  int? _keyCount;
  int get keyCount => _keyCount ?? 0;
  bool hasKeyCount() => _keyCount != null;

  // "kitchenId" field.
  String? _kitchenId;
  String get kitchenId => _kitchenId ?? '';
  bool hasKitchenId() => _kitchenId != null;

  // "mrpPrice" field.
  double? _mrpPrice;
  double get mrpPrice => _mrpPrice ?? 0.0;
  bool hasMrpPrice() => _mrpPrice != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "onlinePrice" field.
  double? _onlinePrice;
  double get onlinePrice => _onlinePrice ?? 0.0;
  bool hasOnlinePrice() => _onlinePrice != null;

  // "onlineSynced" field.
  bool? _onlineSynced;
  bool get onlineSynced => _onlineSynced ?? false;
  bool hasOnlineSynced() => _onlineSynced != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "priceTable" field.
  String? _priceTable;
  String get priceTable => _priceTable ?? '';
  bool hasPriceTable() => _priceTable != null;

  // "recipeId" field.
  String? _recipeId;
  String get recipeId => _recipeId ?? '';
  bool hasRecipeId() => _recipeId != null;

  // "regionalName" field.
  String? _regionalName;
  String get regionalName => _regionalName ?? '';
  bool hasRegionalName() => _regionalName != null;

  // "reorderLevel" field.
  int? _reorderLevel;
  int get reorderLevel => _reorderLevel ?? 0;
  bool hasReorderLevel() => _reorderLevel != null;

  // "selected" field.
  bool? _selected;
  bool get selected => _selected ?? false;
  bool hasSelected() => _selected != null;

  // "shortName" field.
  String? _shortName;
  String get shortName => _shortName ?? '';
  bool hasShortName() => _shortName != null;

  // "stockable" field.
  bool? _stockable;
  bool get stockable => _stockable ?? false;
  bool hasStockable() => _stockable != null;

  // "taxIndex" field.
  int? _taxIndex;
  int get taxIndex => _taxIndex ?? 0;
  bool hasTaxIndex() => _taxIndex != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  // "unitId" field.
  int? _unitId;
  int get unitId => _unitId ?? 0;
  bool hasUnitId() => _unitId != null;

  // "weighable" field.
  bool? _weighable;
  bool get weighable => _weighable ?? false;
  bool hasWeighable() => _weighable != null;

  // "currentStock" field.
  double? _currentStock;
  double get currentStock => _currentStock ?? 0.0;
  bool hasCurrentStock() => _currentStock != null;

  // "hsnCode" field.
  String? _hsnCode;
  String get hsnCode => _hsnCode ?? '';
  bool hasHsnCode() => _hsnCode != null;

  // "discountAmount" field.
  double? _discountAmount;
  double get discountAmount => _discountAmount ?? 0.0;
  bool hasDiscountAmount() => _discountAmount != null;

  // "dayType" field.
  String? _dayType;
  String get dayType => _dayType ?? '';
  bool hasDayType() => _dayType != null;

  // "wholeSaleAmount" field.
  double? _wholeSaleAmount;
  double get wholeSaleAmount => _wholeSaleAmount ?? 0.0;
  bool hasWholeSaleAmount() => _wholeSaleAmount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _active = snapshotData['active'] as bool?;
    _barcode = snapshotData['barcode'] as String?;
    _category = snapshotData['category'] as String?;
    _cess = castToType<double>(snapshotData['cess']);
    _code = castToType<int>(snapshotData['code']);
    _costPrice = castToType<double>(snapshotData['costPrice']);
    _dateTme = snapshotData['dateTme'] as DateTime?;
    _discount = castToType<double>(snapshotData['discount']);
    _keyCount = castToType<int>(snapshotData['keyCount']);
    _kitchenId = snapshotData['kitchenId'] as String?;
    _mrpPrice = castToType<double>(snapshotData['mrpPrice']);
    _name = snapshotData['name'] as String?;
    _onlinePrice = castToType<double>(snapshotData['onlinePrice']);
    _onlineSynced = snapshotData['onlineSynced'] as bool?;
    _price = castToType<double>(snapshotData['price']);
    _priceTable = snapshotData['priceTable'] as String?;
    _recipeId = snapshotData['recipeId'] as String?;
    _regionalName = snapshotData['regionalName'] as String?;
    _reorderLevel = castToType<int>(snapshotData['reorderLevel']);
    _selected = snapshotData['selected'] as bool?;
    _shortName = snapshotData['shortName'] as String?;
    _stockable = snapshotData['stockable'] as bool?;
    _taxIndex = castToType<int>(snapshotData['taxIndex']);
    _type = castToType<int>(snapshotData['type']);
    _unitId = castToType<int>(snapshotData['unitId']);
    _weighable = snapshotData['weighable'] as bool?;
    _currentStock = castToType<double>(snapshotData['currentStock']);
    _hsnCode = snapshotData['hsnCode'] as String?;
    _discountAmount = castToType<double>(snapshotData['discountAmount']);
    _dayType = snapshotData['dayType'] as String?;
    _wholeSaleAmount = castToType<double>(snapshotData['wholeSaleAmount']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PRODUCT')
          : FirebaseFirestore.instance.collectionGroup('PRODUCT');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PRODUCT').doc(id);

  static Stream<ProductRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductRecord.fromSnapshot(s));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductRecord.fromSnapshot(s));

  static ProductRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductRecordData({
  String? id,
  bool? active,
  String? barcode,
  String? category,
  double? cess,
  int? code,
  double? costPrice,
  DateTime? dateTme,
  double? discount,
  int? keyCount,
  String? kitchenId,
  double? mrpPrice,
  String? name,
  double? onlinePrice,
  bool? onlineSynced,
  double? price,
  String? priceTable,
  String? recipeId,
  String? regionalName,
  int? reorderLevel,
  bool? selected,
  String? shortName,
  bool? stockable,
  int? taxIndex,
  int? type,
  int? unitId,
  bool? weighable,
  double? currentStock,
  String? hsnCode,
  double? discountAmount,
  String? dayType,
  double? wholeSaleAmount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'active': active,
      'barcode': barcode,
      'category': category,
      'cess': cess,
      'code': code,
      'costPrice': costPrice,
      'dateTme': dateTme,
      'discount': discount,
      'keyCount': keyCount,
      'kitchenId': kitchenId,
      'mrpPrice': mrpPrice,
      'name': name,
      'onlinePrice': onlinePrice,
      'onlineSynced': onlineSynced,
      'price': price,
      'priceTable': priceTable,
      'recipeId': recipeId,
      'regionalName': regionalName,
      'reorderLevel': reorderLevel,
      'selected': selected,
      'shortName': shortName,
      'stockable': stockable,
      'taxIndex': taxIndex,
      'type': type,
      'unitId': unitId,
      'weighable': weighable,
      'currentStock': currentStock,
      'hsnCode': hsnCode,
      'discountAmount': discountAmount,
      'dayType': dayType,
      'wholeSaleAmount': wholeSaleAmount,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductRecordDocumentEquality implements Equality<ProductRecord> {
  const ProductRecordDocumentEquality();

  @override
  bool equals(ProductRecord? e1, ProductRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.active == e2?.active &&
        e1?.barcode == e2?.barcode &&
        e1?.category == e2?.category &&
        e1?.cess == e2?.cess &&
        e1?.code == e2?.code &&
        e1?.costPrice == e2?.costPrice &&
        e1?.dateTme == e2?.dateTme &&
        e1?.discount == e2?.discount &&
        e1?.keyCount == e2?.keyCount &&
        e1?.kitchenId == e2?.kitchenId &&
        e1?.mrpPrice == e2?.mrpPrice &&
        e1?.name == e2?.name &&
        e1?.onlinePrice == e2?.onlinePrice &&
        e1?.onlineSynced == e2?.onlineSynced &&
        e1?.price == e2?.price &&
        e1?.priceTable == e2?.priceTable &&
        e1?.recipeId == e2?.recipeId &&
        e1?.regionalName == e2?.regionalName &&
        e1?.reorderLevel == e2?.reorderLevel &&
        e1?.selected == e2?.selected &&
        e1?.shortName == e2?.shortName &&
        e1?.stockable == e2?.stockable &&
        e1?.taxIndex == e2?.taxIndex &&
        e1?.type == e2?.type &&
        e1?.unitId == e2?.unitId &&
        e1?.weighable == e2?.weighable &&
        e1?.currentStock == e2?.currentStock &&
        e1?.hsnCode == e2?.hsnCode &&
        e1?.discountAmount == e2?.discountAmount &&
        e1?.dayType == e2?.dayType &&
        e1?.wholeSaleAmount == e2?.wholeSaleAmount;
  }

  @override
  int hash(ProductRecord? e) => const ListEquality().hash([
        e?.id,
        e?.active,
        e?.barcode,
        e?.category,
        e?.cess,
        e?.code,
        e?.costPrice,
        e?.dateTme,
        e?.discount,
        e?.keyCount,
        e?.kitchenId,
        e?.mrpPrice,
        e?.name,
        e?.onlinePrice,
        e?.onlineSynced,
        e?.price,
        e?.priceTable,
        e?.recipeId,
        e?.regionalName,
        e?.reorderLevel,
        e?.selected,
        e?.shortName,
        e?.stockable,
        e?.taxIndex,
        e?.type,
        e?.unitId,
        e?.weighable,
        e?.currentStock,
        e?.hsnCode,
        e?.discountAmount,
        e?.dayType,
        e?.wholeSaleAmount
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductRecord;
}
