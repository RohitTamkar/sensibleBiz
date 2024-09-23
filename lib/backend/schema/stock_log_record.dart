import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StockLogRecord extends FirestoreRecord {
  StockLogRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "monthId" field.
  String? _monthId;
  String get monthId => _monthId ?? '';
  bool hasMonthId() => _monthId != null;

  // "modifiedBy" field.
  String? _modifiedBy;
  String get modifiedBy => _modifiedBy ?? '';
  bool hasModifiedBy() => _modifiedBy != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "modifiedDate" field.
  DateTime? _modifiedDate;
  DateTime? get modifiedDate => _modifiedDate;
  bool hasModifiedDate() => _modifiedDate != null;

  // "productListMap" field.
  List<ProductListStruct>? _productListMap;
  List<ProductListStruct> get productListMap => _productListMap ?? const [];
  bool hasProductListMap() => _productListMap != null;

  // "createdDateInMill" field.
  int? _createdDateInMill;
  int get createdDateInMill => _createdDateInMill ?? 0;
  bool hasCreatedDateInMill() => _createdDateInMill != null;

  // "modifiedDateInMill" field.
  int? _modifiedDateInMill;
  int get modifiedDateInMill => _modifiedDateInMill ?? 0;
  bool hasModifiedDateInMill() => _modifiedDateInMill != null;

  // "stockList" field.
  CartListStruct? _stockList;
  CartListStruct get stockList => _stockList ?? CartListStruct();
  bool hasStockList() => _stockList != null;

  // "createdById" field.
  DocumentReference? _createdById;
  DocumentReference? get createdById => _createdById;
  bool hasCreatedById() => _createdById != null;

  // "modifiedById" field.
  DocumentReference? _modifiedById;
  DocumentReference? get modifiedById => _modifiedById;
  bool hasModifiedById() => _modifiedById != null;

  // "requestedId" field.
  String? _requestedId;
  String get requestedId => _requestedId ?? '';
  bool hasRequestedId() => _requestedId != null;

  // "reqStock" field.
  double? _reqStock;
  double get reqStock => _reqStock ?? 0.0;
  bool hasReqStock() => _reqStock != null;

  // "stockType" field.
  String? _stockType;
  String get stockType => _stockType ?? '';
  bool hasStockType() => _stockType != null;

  // "reqCount" field.
  int? _reqCount;
  int get reqCount => _reqCount ?? 0;
  bool hasReqCount() => _reqCount != null;

  // "toOutletId" field.
  String? _toOutletId;
  String get toOutletId => _toOutletId ?? '';
  bool hasToOutletId() => _toOutletId != null;

  // "fromOutletId" field.
  String? _fromOutletId;
  String get fromOutletId => _fromOutletId ?? '';
  bool hasFromOutletId() => _fromOutletId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
    _status = snapshotData['status'] as String?;
    _dayId = snapshotData['dayId'] as String?;
    _monthId = snapshotData['monthId'] as String?;
    _modifiedBy = snapshotData['modifiedBy'] as String?;
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _modifiedDate = snapshotData['modifiedDate'] as DateTime?;
    _productListMap = getStructList(
      snapshotData['productListMap'],
      ProductListStruct.fromMap,
    );
    _createdDateInMill = castToType<int>(snapshotData['createdDateInMill']);
    _modifiedDateInMill = castToType<int>(snapshotData['modifiedDateInMill']);
    _stockList = CartListStruct.maybeFromMap(snapshotData['stockList']);
    _createdById = snapshotData['createdById'] as DocumentReference?;
    _modifiedById = snapshotData['modifiedById'] as DocumentReference?;
    _requestedId = snapshotData['requestedId'] as String?;
    _reqStock = castToType<double>(snapshotData['reqStock']);
    _stockType = snapshotData['stockType'] as String?;
    _reqCount = castToType<int>(snapshotData['reqCount']);
    _toOutletId = snapshotData['toOutletId'] as String?;
    _fromOutletId = snapshotData['fromOutletId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('STOCK_LOG')
          : FirebaseFirestore.instance.collectionGroup('STOCK_LOG');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('STOCK_LOG').doc(id);

  static Stream<StockLogRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StockLogRecord.fromSnapshot(s));

  static Future<StockLogRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StockLogRecord.fromSnapshot(s));

  static StockLogRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StockLogRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StockLogRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StockLogRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StockLogRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StockLogRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStockLogRecordData({
  String? id,
  String? createdBy,
  String? status,
  String? dayId,
  String? monthId,
  String? modifiedBy,
  DateTime? createdDate,
  DateTime? modifiedDate,
  int? createdDateInMill,
  int? modifiedDateInMill,
  CartListStruct? stockList,
  DocumentReference? createdById,
  DocumentReference? modifiedById,
  String? requestedId,
  double? reqStock,
  String? stockType,
  int? reqCount,
  String? toOutletId,
  String? fromOutletId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'createdBy': createdBy,
      'status': status,
      'dayId': dayId,
      'monthId': monthId,
      'modifiedBy': modifiedBy,
      'createdDate': createdDate,
      'modifiedDate': modifiedDate,
      'createdDateInMill': createdDateInMill,
      'modifiedDateInMill': modifiedDateInMill,
      'stockList': CartListStruct().toMap(),
      'createdById': createdById,
      'modifiedById': modifiedById,
      'requestedId': requestedId,
      'reqStock': reqStock,
      'stockType': stockType,
      'reqCount': reqCount,
      'toOutletId': toOutletId,
      'fromOutletId': fromOutletId,
    }.withoutNulls,
  );

  // Handle nested data for "stockList" field.
  addCartListStructData(firestoreData, stockList, 'stockList');

  return firestoreData;
}

class StockLogRecordDocumentEquality implements Equality<StockLogRecord> {
  const StockLogRecordDocumentEquality();

  @override
  bool equals(StockLogRecord? e1, StockLogRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.createdBy == e2?.createdBy &&
        e1?.status == e2?.status &&
        e1?.dayId == e2?.dayId &&
        e1?.monthId == e2?.monthId &&
        e1?.modifiedBy == e2?.modifiedBy &&
        e1?.createdDate == e2?.createdDate &&
        e1?.modifiedDate == e2?.modifiedDate &&
        listEquality.equals(e1?.productListMap, e2?.productListMap) &&
        e1?.createdDateInMill == e2?.createdDateInMill &&
        e1?.modifiedDateInMill == e2?.modifiedDateInMill &&
        e1?.stockList == e2?.stockList &&
        e1?.createdById == e2?.createdById &&
        e1?.modifiedById == e2?.modifiedById &&
        e1?.requestedId == e2?.requestedId &&
        e1?.reqStock == e2?.reqStock &&
        e1?.stockType == e2?.stockType &&
        e1?.reqCount == e2?.reqCount &&
        e1?.toOutletId == e2?.toOutletId &&
        e1?.fromOutletId == e2?.fromOutletId;
  }

  @override
  int hash(StockLogRecord? e) => const ListEquality().hash([
        e?.id,
        e?.createdBy,
        e?.status,
        e?.dayId,
        e?.monthId,
        e?.modifiedBy,
        e?.createdDate,
        e?.modifiedDate,
        e?.productListMap,
        e?.createdDateInMill,
        e?.modifiedDateInMill,
        e?.stockList,
        e?.createdById,
        e?.modifiedById,
        e?.requestedId,
        e?.reqStock,
        e?.stockType,
        e?.reqCount,
        e?.toOutletId,
        e?.fromOutletId
      ]);

  @override
  bool isValidKey(Object? o) => o is StockLogRecord;
}
