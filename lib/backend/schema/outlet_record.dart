import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OutletRecord extends FirestoreRecord {
  OutletRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "branch" field.
  String? _branch;
  String get branch => _branch ?? '';
  bool hasBranch() => _branch != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "fssaiNo" field.
  String? _fssaiNo;
  String get fssaiNo => _fssaiNo ?? '';
  bool hasFssaiNo() => _fssaiNo != null;

  // "multiCounter" field.
  bool? _multiCounter;
  bool get multiCounter => _multiCounter ?? false;
  bool hasMultiCounter() => _multiCounter != null;

  // "multiShift" field.
  bool? _multiShift;
  bool get multiShift => _multiShift ?? false;
  bool hasMultiShift() => _multiShift != null;

  // "renewalDate" field.
  int? _renewalDate;
  int get renewalDate => _renewalDate ?? 0;
  bool hasRenewalDate() => _renewalDate != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "subscriptionView" field.
  bool? _subscriptionView;
  bool get subscriptionView => _subscriptionView ?? false;
  bool hasSubscriptionView() => _subscriptionView != null;

  // "eraseOutlet" field.
  bool? _eraseOutlet;
  bool get eraseOutlet => _eraseOutlet ?? false;
  bool hasEraseOutlet() => _eraseOutlet != null;

  // "isDemo" field.
  bool? _isDemo;
  bool get isDemo => _isDemo ?? false;
  bool hasIsDemo() => _isDemo != null;

  // "businessId" field.
  String? _businessId;
  String get businessId => _businessId ?? '';
  bool hasBusinessId() => _businessId != null;

  // "demo" field.
  bool? _demo;
  bool get demo => _demo ?? false;
  bool hasDemo() => _demo != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _active = snapshotData['active'] as bool?;
    _branch = snapshotData['branch'] as String?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _fssaiNo = snapshotData['fssaiNo'] as String?;
    _multiCounter = snapshotData['multiCounter'] as bool?;
    _multiShift = snapshotData['multiShift'] as bool?;
    _renewalDate = castToType<int>(snapshotData['renewalDate']);
    _userId = snapshotData['userId'] as String?;
    _subscriptionView = snapshotData['subscriptionView'] as bool?;
    _eraseOutlet = snapshotData['eraseOutlet'] as bool?;
    _isDemo = snapshotData['isDemo'] as bool?;
    _businessId = snapshotData['businessId'] as String?;
    _demo = snapshotData['demo'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('OUTLET');

  static Stream<OutletRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OutletRecord.fromSnapshot(s));

  static Future<OutletRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OutletRecord.fromSnapshot(s));

  static OutletRecord fromSnapshot(DocumentSnapshot snapshot) => OutletRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OutletRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OutletRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OutletRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OutletRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOutletRecordData({
  String? id,
  String? name,
  bool? active,
  String? branch,
  int? createdDate,
  String? fssaiNo,
  bool? multiCounter,
  bool? multiShift,
  int? renewalDate,
  String? userId,
  bool? subscriptionView,
  bool? eraseOutlet,
  bool? isDemo,
  String? businessId,
  bool? demo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'active': active,
      'branch': branch,
      'createdDate': createdDate,
      'fssaiNo': fssaiNo,
      'multiCounter': multiCounter,
      'multiShift': multiShift,
      'renewalDate': renewalDate,
      'userId': userId,
      'subscriptionView': subscriptionView,
      'eraseOutlet': eraseOutlet,
      'isDemo': isDemo,
      'businessId': businessId,
      'demo': demo,
    }.withoutNulls,
  );

  return firestoreData;
}

class OutletRecordDocumentEquality implements Equality<OutletRecord> {
  const OutletRecordDocumentEquality();

  @override
  bool equals(OutletRecord? e1, OutletRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.active == e2?.active &&
        e1?.branch == e2?.branch &&
        e1?.createdDate == e2?.createdDate &&
        e1?.fssaiNo == e2?.fssaiNo &&
        e1?.multiCounter == e2?.multiCounter &&
        e1?.multiShift == e2?.multiShift &&
        e1?.renewalDate == e2?.renewalDate &&
        e1?.userId == e2?.userId &&
        e1?.subscriptionView == e2?.subscriptionView &&
        e1?.eraseOutlet == e2?.eraseOutlet &&
        e1?.isDemo == e2?.isDemo &&
        e1?.businessId == e2?.businessId &&
        e1?.demo == e2?.demo;
  }

  @override
  int hash(OutletRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.active,
        e?.branch,
        e?.createdDate,
        e?.fssaiNo,
        e?.multiCounter,
        e?.multiShift,
        e?.renewalDate,
        e?.userId,
        e?.subscriptionView,
        e?.eraseOutlet,
        e?.isDemo,
        e?.businessId,
        e?.demo
      ]);

  @override
  bool isValidKey(Object? o) => o is OutletRecord;
}
