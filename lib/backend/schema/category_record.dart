import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryRecord extends FirestoreRecord {
  CategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "categoryNo" field.
  int? _categoryNo;
  int get categoryNo => _categoryNo ?? 0;
  bool hasCategoryNo() => _categoryNo != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "onlineSynced" field.
  bool? _onlineSynced;
  bool get onlineSynced => _onlineSynced ?? false;
  bool hasOnlineSynced() => _onlineSynced != null;

  // "regionalName" field.
  String? _regionalName;
  String get regionalName => _regionalName ?? '';
  bool hasRegionalName() => _regionalName != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  bool hasType() => _type != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _categoryNo = castToType<int>(snapshotData['categoryNo']);
    _name = snapshotData['name'] as String?;
    _onlineSynced = snapshotData['onlineSynced'] as bool?;
    _regionalName = snapshotData['regionalName'] as String?;
    _type = castToType<int>(snapshotData['type']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('CATEGORY')
          : FirebaseFirestore.instance.collectionGroup('CATEGORY');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('CATEGORY').doc(id);

  static Stream<CategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryRecord.fromSnapshot(s));

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryRecord.fromSnapshot(s));

  static CategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryRecordData({
  String? id,
  int? categoryNo,
  String? name,
  bool? onlineSynced,
  String? regionalName,
  int? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'categoryNo': categoryNo,
      'name': name,
      'onlineSynced': onlineSynced,
      'regionalName': regionalName,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryRecordDocumentEquality implements Equality<CategoryRecord> {
  const CategoryRecordDocumentEquality();

  @override
  bool equals(CategoryRecord? e1, CategoryRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.categoryNo == e2?.categoryNo &&
        e1?.name == e2?.name &&
        e1?.onlineSynced == e2?.onlineSynced &&
        e1?.regionalName == e2?.regionalName &&
        e1?.type == e2?.type;
  }

  @override
  int hash(CategoryRecord? e) => const ListEquality().hash([
        e?.id,
        e?.categoryNo,
        e?.name,
        e?.onlineSynced,
        e?.regionalName,
        e?.type
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoryRecord;
}
