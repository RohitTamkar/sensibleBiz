import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExpenseHeaderRecord extends FirestoreRecord {
  ExpenseHeaderRecord._(
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

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('EXPENSE_HEADER')
          : FirebaseFirestore.instance.collectionGroup('EXPENSE_HEADER');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('EXPENSE_HEADER').doc(id);

  static Stream<ExpenseHeaderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExpenseHeaderRecord.fromSnapshot(s));

  static Future<ExpenseHeaderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExpenseHeaderRecord.fromSnapshot(s));

  static ExpenseHeaderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExpenseHeaderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExpenseHeaderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExpenseHeaderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExpenseHeaderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExpenseHeaderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExpenseHeaderRecordData({
  String? id,
  String? name,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExpenseHeaderRecordDocumentEquality
    implements Equality<ExpenseHeaderRecord> {
  const ExpenseHeaderRecordDocumentEquality();

  @override
  bool equals(ExpenseHeaderRecord? e1, ExpenseHeaderRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.description == e2?.description;
  }

  @override
  int hash(ExpenseHeaderRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.description]);

  @override
  bool isValidKey(Object? o) => o is ExpenseHeaderRecord;
}
