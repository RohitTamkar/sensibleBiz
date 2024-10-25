import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MultipliersRecord extends FirestoreRecord {
  MultipliersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "outletList" field.
  List<MultipliersListStruct>? _outletList;
  List<MultipliersListStruct> get outletList => _outletList ?? const [];
  bool hasOutletList() => _outletList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _outletList = getStructList(
      snapshotData['outletList'],
      MultipliersListStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('MULTIPLIERS')
          : FirebaseFirestore.instance.collectionGroup('MULTIPLIERS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('MULTIPLIERS').doc(id);

  static Stream<MultipliersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MultipliersRecord.fromSnapshot(s));

  static Future<MultipliersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MultipliersRecord.fromSnapshot(s));

  static MultipliersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MultipliersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MultipliersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MultipliersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MultipliersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MultipliersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMultipliersRecordData({
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class MultipliersRecordDocumentEquality implements Equality<MultipliersRecord> {
  const MultipliersRecordDocumentEquality();

  @override
  bool equals(MultipliersRecord? e1, MultipliersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        listEquality.equals(e1?.outletList, e2?.outletList);
  }

  @override
  int hash(MultipliersRecord? e) =>
      const ListEquality().hash([e?.id, e?.outletList]);

  @override
  bool isValidKey(Object? o) => o is MultipliersRecord;
}
