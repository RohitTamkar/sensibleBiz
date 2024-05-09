import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDeletionRecord extends FirestoreRecord {
  UserDeletionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "isDelete" field.
  bool? _isDelete;
  bool get isDelete => _isDelete ?? false;
  bool hasIsDelete() => _isDelete != null;

  // "dateOfInitiate" field.
  int? _dateOfInitiate;
  int get dateOfInitiate => _dateOfInitiate ?? 0;
  bool hasDateOfInitiate() => _dateOfInitiate != null;

  // "dateOfDeletion" field.
  int? _dateOfDeletion;
  int get dateOfDeletion => _dateOfDeletion ?? 0;
  bool hasDateOfDeletion() => _dateOfDeletion != null;

  void _initializeFields() {
    _userId = snapshotData['userId'] as String?;
    _isDelete = snapshotData['isDelete'] as bool?;
    _dateOfInitiate = castToType<int>(snapshotData['dateOfInitiate']);
    _dateOfDeletion = castToType<int>(snapshotData['dateOfDeletion']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('USER_DELETION');

  static Stream<UserDeletionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDeletionRecord.fromSnapshot(s));

  static Future<UserDeletionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDeletionRecord.fromSnapshot(s));

  static UserDeletionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDeletionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDeletionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDeletionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDeletionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDeletionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserDeletionRecordData({
  String? userId,
  bool? isDelete,
  int? dateOfInitiate,
  int? dateOfDeletion,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userId': userId,
      'isDelete': isDelete,
      'dateOfInitiate': dateOfInitiate,
      'dateOfDeletion': dateOfDeletion,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDeletionRecordDocumentEquality
    implements Equality<UserDeletionRecord> {
  const UserDeletionRecordDocumentEquality();

  @override
  bool equals(UserDeletionRecord? e1, UserDeletionRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.isDelete == e2?.isDelete &&
        e1?.dateOfInitiate == e2?.dateOfInitiate &&
        e1?.dateOfDeletion == e2?.dateOfDeletion;
  }

  @override
  int hash(UserDeletionRecord? e) => const ListEquality()
      .hash([e?.userId, e?.isDelete, e?.dateOfInitiate, e?.dateOfDeletion]);

  @override
  bool isValidKey(Object? o) => o is UserDeletionRecord;
}
