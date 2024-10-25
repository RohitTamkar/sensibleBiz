import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UpiConfigurationQrcodeRecord extends FirestoreRecord {
  UpiConfigurationQrcodeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "payName" field.
  String? _payName;
  String get payName => _payName ?? '';
  bool hasPayName() => _payName != null;

  // "upiId" field.
  String? _upiId;
  String get upiId => _upiId ?? '';
  bool hasUpiId() => _upiId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _payName = snapshotData['payName'] as String?;
    _upiId = snapshotData['upiId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('UPI_CONFIGURATION_QRCODE')
          : FirebaseFirestore.instance
              .collectionGroup('UPI_CONFIGURATION_QRCODE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('UPI_CONFIGURATION_QRCODE').doc(id);

  static Stream<UpiConfigurationQrcodeRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => UpiConfigurationQrcodeRecord.fromSnapshot(s));

  static Future<UpiConfigurationQrcodeRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UpiConfigurationQrcodeRecord.fromSnapshot(s));

  static UpiConfigurationQrcodeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UpiConfigurationQrcodeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UpiConfigurationQrcodeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UpiConfigurationQrcodeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UpiConfigurationQrcodeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UpiConfigurationQrcodeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUpiConfigurationQrcodeRecordData({
  String? id,
  String? payName,
  String? upiId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'payName': payName,
      'upiId': upiId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UpiConfigurationQrcodeRecordDocumentEquality
    implements Equality<UpiConfigurationQrcodeRecord> {
  const UpiConfigurationQrcodeRecordDocumentEquality();

  @override
  bool equals(
      UpiConfigurationQrcodeRecord? e1, UpiConfigurationQrcodeRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.payName == e2?.payName &&
        e1?.upiId == e2?.upiId;
  }

  @override
  int hash(UpiConfigurationQrcodeRecord? e) =>
      const ListEquality().hash([e?.id, e?.payName, e?.upiId]);

  @override
  bool isValidKey(Object? o) => o is UpiConfigurationQrcodeRecord;
}
