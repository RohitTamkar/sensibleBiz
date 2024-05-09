import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DeviceRecord extends FirestoreRecord {
  DeviceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "branch" field.
  String? _branch;
  String get branch => _branch ?? '';
  bool hasBranch() => _branch != null;

  // "createDate" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  bool hasDeviceId() => _deviceId != null;

  // "outletId" field.
  String? _outletId;
  String get outletId => _outletId ?? '';
  bool hasOutletId() => _outletId != null;

  // "outletName" field.
  String? _outletName;
  String get outletName => _outletName ?? '';
  bool hasOutletName() => _outletName != null;

  // "serial" field.
  String? _serial;
  String get serial => _serial ?? '';
  bool hasSerial() => _serial != null;

  // "versionCode" field.
  int? _versionCode;
  int get versionCode => _versionCode ?? 0;
  bool hasVersionCode() => _versionCode != null;

  // "versionName" field.
  String? _versionName;
  String get versionName => _versionName ?? '';
  bool hasVersionName() => _versionName != null;

  // "loggedIn" field.
  bool? _loggedIn;
  bool get loggedIn => _loggedIn ?? false;
  bool hasLoggedIn() => _loggedIn != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "outletRef" field.
  DocumentReference? _outletRef;
  DocumentReference? get outletRef => _outletRef;
  bool hasOutletRef() => _outletRef != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _active = snapshotData['active'] as bool?;
    _branch = snapshotData['branch'] as String?;
    _createDate = snapshotData['createDate'] as DateTime?;
    _deviceId = snapshotData['deviceId'] as String?;
    _outletId = snapshotData['outletId'] as String?;
    _outletName = snapshotData['outletName'] as String?;
    _serial = snapshotData['serial'] as String?;
    _versionCode = castToType<int>(snapshotData['versionCode']);
    _versionName = snapshotData['versionName'] as String?;
    _loggedIn = snapshotData['loggedIn'] as bool?;
    _userId = snapshotData['userId'] as String?;
    _outletRef = snapshotData['outletRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DEVICE');

  static Stream<DeviceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DeviceRecord.fromSnapshot(s));

  static Future<DeviceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DeviceRecord.fromSnapshot(s));

  static DeviceRecord fromSnapshot(DocumentSnapshot snapshot) => DeviceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DeviceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DeviceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DeviceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DeviceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDeviceRecordData({
  String? id,
  bool? active,
  String? branch,
  DateTime? createDate,
  String? deviceId,
  String? outletId,
  String? outletName,
  String? serial,
  int? versionCode,
  String? versionName,
  bool? loggedIn,
  String? userId,
  DocumentReference? outletRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'active': active,
      'branch': branch,
      'createDate': createDate,
      'deviceId': deviceId,
      'outletId': outletId,
      'outletName': outletName,
      'serial': serial,
      'versionCode': versionCode,
      'versionName': versionName,
      'loggedIn': loggedIn,
      'userId': userId,
      'outletRef': outletRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class DeviceRecordDocumentEquality implements Equality<DeviceRecord> {
  const DeviceRecordDocumentEquality();

  @override
  bool equals(DeviceRecord? e1, DeviceRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.active == e2?.active &&
        e1?.branch == e2?.branch &&
        e1?.createDate == e2?.createDate &&
        e1?.deviceId == e2?.deviceId &&
        e1?.outletId == e2?.outletId &&
        e1?.outletName == e2?.outletName &&
        e1?.serial == e2?.serial &&
        e1?.versionCode == e2?.versionCode &&
        e1?.versionName == e2?.versionName &&
        e1?.loggedIn == e2?.loggedIn &&
        e1?.userId == e2?.userId &&
        e1?.outletRef == e2?.outletRef;
  }

  @override
  int hash(DeviceRecord? e) => const ListEquality().hash([
        e?.id,
        e?.active,
        e?.branch,
        e?.createDate,
        e?.deviceId,
        e?.outletId,
        e?.outletName,
        e?.serial,
        e?.versionCode,
        e?.versionName,
        e?.loggedIn,
        e?.userId,
        e?.outletRef
      ]);

  @override
  bool isValidKey(Object? o) => o is DeviceRecord;
}
