import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeeRecord extends FirestoreRecord {
  EmployeeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "allowadvancepayment" field.
  bool? _allowadvancepayment;
  bool get allowadvancepayment => _allowadvancepayment ?? false;
  bool hasAllowadvancepayment() => _allowadvancepayment != null;

  // "balanceAmt" field.
  String? _balanceAmt;
  String get balanceAmt => _balanceAmt ?? '';
  bool hasBalanceAmt() => _balanceAmt != null;

  // "dateOfJoining" field.
  String? _dateOfJoining;
  String get dateOfJoining => _dateOfJoining ?? '';
  bool hasDateOfJoining() => _dateOfJoining != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "searchCode" field.
  int? _searchCode;
  int get searchCode => _searchCode ?? 0;
  bool hasSearchCode() => _searchCode != null;

  // "shortName" field.
  String? _shortName;
  String get shortName => _shortName ?? '';
  bool hasShortName() => _shortName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _allowadvancepayment = snapshotData['allowadvancepayment'] as bool?;
    _balanceAmt = snapshotData['balanceAmt'] as String?;
    _dateOfJoining = snapshotData['dateOfJoining'] as String?;
    _id = snapshotData['id'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _name = snapshotData['name'] as String?;
    _searchCode = castToType<int>(snapshotData['searchCode']);
    _shortName = snapshotData['shortName'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('EMPLOYEE')
          : FirebaseFirestore.instance.collectionGroup('EMPLOYEE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('EMPLOYEE').doc(id);

  static Stream<EmployeeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmployeeRecord.fromSnapshot(s));

  static Future<EmployeeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmployeeRecord.fromSnapshot(s));

  static EmployeeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmployeeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmployeeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmployeeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmployeeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmployeeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmployeeRecordData({
  bool? allowadvancepayment,
  String? balanceAmt,
  String? dateOfJoining,
  String? id,
  String? mobile,
  String? name,
  int? searchCode,
  String? shortName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'allowadvancepayment': allowadvancepayment,
      'balanceAmt': balanceAmt,
      'dateOfJoining': dateOfJoining,
      'id': id,
      'mobile': mobile,
      'name': name,
      'searchCode': searchCode,
      'shortName': shortName,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmployeeRecordDocumentEquality implements Equality<EmployeeRecord> {
  const EmployeeRecordDocumentEquality();

  @override
  bool equals(EmployeeRecord? e1, EmployeeRecord? e2) {
    return e1?.allowadvancepayment == e2?.allowadvancepayment &&
        e1?.balanceAmt == e2?.balanceAmt &&
        e1?.dateOfJoining == e2?.dateOfJoining &&
        e1?.id == e2?.id &&
        e1?.mobile == e2?.mobile &&
        e1?.name == e2?.name &&
        e1?.searchCode == e2?.searchCode &&
        e1?.shortName == e2?.shortName;
  }

  @override
  int hash(EmployeeRecord? e) => const ListEquality().hash([
        e?.allowadvancepayment,
        e?.balanceAmt,
        e?.dateOfJoining,
        e?.id,
        e?.mobile,
        e?.name,
        e?.searchCode,
        e?.shortName
      ]);

  @override
  bool isValidKey(Object? o) => o is EmployeeRecord;
}
