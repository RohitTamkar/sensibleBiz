import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PremisesRecord extends FirestoreRecord {
  PremisesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "range" field.
  int? _range;
  int get range => _range ?? 0;
  bool hasRange() => _range != null;

  // "tables" field.
  int? _tables;
  int get tables => _tables ?? 0;
  bool hasTables() => _tables != null;

  // "taxIndex" field.
  int? _taxIndex;
  int get taxIndex => _taxIndex ?? 0;
  bool hasTaxIndex() => _taxIndex != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _code = castToType<int>(snapshotData['code']);
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _range = castToType<int>(snapshotData['range']);
    _tables = castToType<int>(snapshotData['tables']);
    _taxIndex = castToType<int>(snapshotData['taxIndex']);
    _type = snapshotData['type'] as String?;
    _userId = snapshotData['userId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PREMISES')
          : FirebaseFirestore.instance.collectionGroup('PREMISES');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PREMISES').doc(id);

  static Stream<PremisesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PremisesRecord.fromSnapshot(s));

  static Future<PremisesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PremisesRecord.fromSnapshot(s));

  static PremisesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PremisesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PremisesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PremisesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PremisesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PremisesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPremisesRecordData({
  int? code,
  DateTime? createdTime,
  String? id,
  String? name,
  int? range,
  int? tables,
  int? taxIndex,
  String? type,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'createdTime': createdTime,
      'id': id,
      'name': name,
      'range': range,
      'tables': tables,
      'taxIndex': taxIndex,
      'type': type,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class PremisesRecordDocumentEquality implements Equality<PremisesRecord> {
  const PremisesRecordDocumentEquality();

  @override
  bool equals(PremisesRecord? e1, PremisesRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.createdTime == e2?.createdTime &&
        e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.range == e2?.range &&
        e1?.tables == e2?.tables &&
        e1?.taxIndex == e2?.taxIndex &&
        e1?.type == e2?.type &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(PremisesRecord? e) => const ListEquality().hash([
        e?.code,
        e?.createdTime,
        e?.id,
        e?.name,
        e?.range,
        e?.tables,
        e?.taxIndex,
        e?.type,
        e?.userId
      ]);

  @override
  bool isValidKey(Object? o) => o is PremisesRecord;
}
