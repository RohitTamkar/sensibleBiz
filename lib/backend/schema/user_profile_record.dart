import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProfileRecord extends FirestoreRecord {
  UserProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "outletId" field.
  String? _outletId;
  String get outletId => _outletId ?? '';
  bool hasOutletId() => _outletId != null;

  // "outlets" field.
  List<String>? _outlets;
  List<String> get outlets => _outlets ?? const [];
  bool hasOutlets() => _outlets != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "loggedIn" field.
  bool? _loggedIn;
  bool get loggedIn => _loggedIn ?? false;
  bool hasLoggedIn() => _loggedIn != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  bool hasDeviceId() => _deviceId != null;

  // "renewalDate" field.
  int? _renewalDate;
  int get renewalDate => _renewalDate ?? 0;
  bool hasRenewalDate() => _renewalDate != null;

  // "roll" field.
  String? _roll;
  String get roll => _roll ?? '';
  bool hasRoll() => _roll != null;

  // "quickPin" field.
  String? _quickPin;
  String get quickPin => _quickPin ?? '';
  bool hasQuickPin() => _quickPin != null;

  // "accessToMulticounter" field.
  bool? _accessToMulticounter;
  bool get accessToMulticounter => _accessToMulticounter ?? false;
  bool hasAccessToMulticounter() => _accessToMulticounter != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "businessId" field.
  String? _businessId;
  String get businessId => _businessId ?? '';
  bool hasBusinessId() => _businessId != null;

  // "outletList" field.
  String? _outletList;
  String get outletList => _outletList ?? '';
  bool hasOutletList() => _outletList != null;

  // "userAccess" field.
  UserListStruct? _userAccess;
  UserListStruct get userAccess => _userAccess ?? UserListStruct();
  bool hasUserAccess() => _userAccess != null;

  // "userSettings" field.
  String? _userSettings;
  String get userSettings => _userSettings ?? '';
  bool hasUserSettings() => _userSettings != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _name = snapshotData['name'] as String?;
    _outletId = snapshotData['outletId'] as String?;
    _outlets = getDataList(snapshotData['outlets']);
    _email = snapshotData['email'] as String?;
    _loggedIn = snapshotData['loggedIn'] as bool?;
    _active = snapshotData['active'] as bool?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _deviceId = snapshotData['deviceId'] as String?;
    _renewalDate = castToType<int>(snapshotData['renewalDate']);
    _roll = snapshotData['roll'] as String?;
    _quickPin = snapshotData['quickPin'] as String?;
    _accessToMulticounter = snapshotData['accessToMulticounter'] as bool?;
    _address = snapshotData['address'] as String?;
    _businessId = snapshotData['businessId'] as String?;
    _outletList = snapshotData['outletList'] as String?;
    _userAccess = UserListStruct.maybeFromMap(snapshotData['userAccess']);
    _userSettings = snapshotData['userSettings'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('USER_PROFILE');

  static Stream<UserProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserProfileRecord.fromSnapshot(s));

  static Future<UserProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserProfileRecord.fromSnapshot(s));

  static UserProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserProfileRecordData({
  String? id,
  String? mobile,
  String? name,
  String? outletId,
  String? email,
  bool? loggedIn,
  bool? active,
  int? createdDate,
  String? deviceId,
  int? renewalDate,
  String? roll,
  String? quickPin,
  bool? accessToMulticounter,
  String? address,
  String? businessId,
  String? outletList,
  UserListStruct? userAccess,
  String? userSettings,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'mobile': mobile,
      'name': name,
      'outletId': outletId,
      'email': email,
      'loggedIn': loggedIn,
      'active': active,
      'createdDate': createdDate,
      'deviceId': deviceId,
      'renewalDate': renewalDate,
      'roll': roll,
      'quickPin': quickPin,
      'accessToMulticounter': accessToMulticounter,
      'address': address,
      'businessId': businessId,
      'outletList': outletList,
      'userAccess': UserListStruct().toMap(),
      'userSettings': userSettings,
    }.withoutNulls,
  );

  // Handle nested data for "userAccess" field.
  addUserListStructData(firestoreData, userAccess, 'userAccess');

  return firestoreData;
}

class UserProfileRecordDocumentEquality implements Equality<UserProfileRecord> {
  const UserProfileRecordDocumentEquality();

  @override
  bool equals(UserProfileRecord? e1, UserProfileRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.mobile == e2?.mobile &&
        e1?.name == e2?.name &&
        e1?.outletId == e2?.outletId &&
        listEquality.equals(e1?.outlets, e2?.outlets) &&
        e1?.email == e2?.email &&
        e1?.loggedIn == e2?.loggedIn &&
        e1?.active == e2?.active &&
        e1?.createdDate == e2?.createdDate &&
        e1?.deviceId == e2?.deviceId &&
        e1?.renewalDate == e2?.renewalDate &&
        e1?.roll == e2?.roll &&
        e1?.quickPin == e2?.quickPin &&
        e1?.accessToMulticounter == e2?.accessToMulticounter &&
        e1?.address == e2?.address &&
        e1?.businessId == e2?.businessId &&
        e1?.outletList == e2?.outletList &&
        e1?.userAccess == e2?.userAccess &&
        e1?.userSettings == e2?.userSettings;
  }

  @override
  int hash(UserProfileRecord? e) => const ListEquality().hash([
        e?.id,
        e?.mobile,
        e?.name,
        e?.outletId,
        e?.outlets,
        e?.email,
        e?.loggedIn,
        e?.active,
        e?.createdDate,
        e?.deviceId,
        e?.renewalDate,
        e?.roll,
        e?.quickPin,
        e?.accessToMulticounter,
        e?.address,
        e?.businessId,
        e?.outletList,
        e?.userAccess,
        e?.userSettings
      ]);

  @override
  bool isValidKey(Object? o) => o is UserProfileRecord;
}
