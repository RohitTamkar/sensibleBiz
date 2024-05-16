import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillSaleSummaryRecord extends FirestoreRecord {
  BillSaleSummaryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "billNo" field.
  String? _billNo;
  String get billNo => _billNo ?? '';
  bool hasBillNo() => _billNo != null;

  // "finalTotal" field.
  int? _finalTotal;
  int get finalTotal => _finalTotal ?? 0;
  bool hasFinalTotal() => _finalTotal != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "serialNo" field.
  String? _serialNo;
  String get serialNo => _serialNo ?? '';
  bool hasSerialNo() => _serialNo != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "checkInTime" field.
  int? _checkInTime;
  int get checkInTime => _checkInTime ?? 0;
  bool hasCheckInTime() => _checkInTime != null;

  // "checkOutTime" field.
  int? _checkOutTime;
  int get checkOutTime => _checkOutTime ?? 0;
  bool hasCheckOutTime() => _checkOutTime != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _billNo = snapshotData['billNo'] as String?;
    _finalTotal = castToType<int>(snapshotData['finalTotal']);
    _id = snapshotData['id'] as String?;
    _serialNo = snapshotData['serialNo'] as String?;
    _userId = snapshotData['userId'] as String?;
    _checkInTime = castToType<int>(snapshotData['checkInTime']);
    _checkOutTime = castToType<int>(snapshotData['checkOutTime']);
    _dayId = snapshotData['dayId'] as String?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('BILL_SALE_SUMMARY')
          : FirebaseFirestore.instance.collectionGroup('BILL_SALE_SUMMARY');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('BILL_SALE_SUMMARY').doc(id);

  static Stream<BillSaleSummaryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BillSaleSummaryRecord.fromSnapshot(s));

  static Future<BillSaleSummaryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BillSaleSummaryRecord.fromSnapshot(s));

  static BillSaleSummaryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BillSaleSummaryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BillSaleSummaryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BillSaleSummaryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BillSaleSummaryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BillSaleSummaryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBillSaleSummaryRecordData({
  String? billNo,
  int? finalTotal,
  String? id,
  String? serialNo,
  String? userId,
  int? checkInTime,
  int? checkOutTime,
  String? dayId,
  int? createdDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'billNo': billNo,
      'finalTotal': finalTotal,
      'id': id,
      'serialNo': serialNo,
      'userId': userId,
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'dayId': dayId,
      'createdDate': createdDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class BillSaleSummaryRecordDocumentEquality
    implements Equality<BillSaleSummaryRecord> {
  const BillSaleSummaryRecordDocumentEquality();

  @override
  bool equals(BillSaleSummaryRecord? e1, BillSaleSummaryRecord? e2) {
    return e1?.billNo == e2?.billNo &&
        e1?.finalTotal == e2?.finalTotal &&
        e1?.id == e2?.id &&
        e1?.serialNo == e2?.serialNo &&
        e1?.userId == e2?.userId &&
        e1?.checkInTime == e2?.checkInTime &&
        e1?.checkOutTime == e2?.checkOutTime &&
        e1?.dayId == e2?.dayId &&
        e1?.createdDate == e2?.createdDate;
  }

  @override
  int hash(BillSaleSummaryRecord? e) => const ListEquality().hash([
        e?.billNo,
        e?.finalTotal,
        e?.id,
        e?.serialNo,
        e?.userId,
        e?.checkInTime,
        e?.checkOutTime,
        e?.dayId,
        e?.createdDate
      ]);

  @override
  bool isValidKey(Object? o) => o is BillSaleSummaryRecord;
}
