import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerRecord extends FirestoreRecord {
  CustomerRecord._(
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

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  bool hasContact() => _contact != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "altContact" field.
  String? _altContact;
  String get altContact => _altContact ?? '';
  bool hasAltContact() => _altContact != null;

  // "birthdayDate" field.
  String? _birthdayDate;
  String get birthdayDate => _birthdayDate ?? '';
  bool hasBirthdayDate() => _birthdayDate != null;

  // "anniversaryDate" field.
  String? _anniversaryDate;
  String get anniversaryDate => _anniversaryDate ?? '';
  bool hasAnniversaryDate() => _anniversaryDate != null;

  // "allowedCredit" field.
  bool? _allowedCredit;
  bool get allowedCredit => _allowedCredit ?? false;
  bool hasAllowedCredit() => _allowedCredit != null;

  // "balance" field.
  int? _balance;
  int get balance => _balance ?? 0;
  bool hasBalance() => _balance != null;

  // "creditLimit" field.
  int? _creditLimit;
  int get creditLimit => _creditLimit ?? 0;
  bool hasCreditLimit() => _creditLimit != null;

  // "dayLimit" field.
  int? _dayLimit;
  int get dayLimit => _dayLimit ?? 0;
  bool hasDayLimit() => _dayLimit != null;

  // "extra" field.
  String? _extra;
  String get extra => _extra ?? '';
  bool hasExtra() => _extra != null;

  // "gstNo" field.
  String? _gstNo;
  String get gstNo => _gstNo ?? '';
  bool hasGstNo() => _gstNo != null;

  // "otherDate1" field.
  String? _otherDate1;
  String get otherDate1 => _otherDate1 ?? '';
  bool hasOtherDate1() => _otherDate1 != null;

  // "selected" field.
  bool? _selected;
  bool get selected => _selected ?? false;
  bool hasSelected() => _selected != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _contact = snapshotData['contact'] as String?;
    _email = snapshotData['email'] as String?;
    _address = snapshotData['address'] as String?;
    _altContact = snapshotData['altContact'] as String?;
    _birthdayDate = snapshotData['birthdayDate'] as String?;
    _anniversaryDate = snapshotData['anniversaryDate'] as String?;
    _allowedCredit = snapshotData['allowedCredit'] as bool?;
    _balance = castToType<int>(snapshotData['balance']);
    _creditLimit = castToType<int>(snapshotData['creditLimit']);
    _dayLimit = castToType<int>(snapshotData['dayLimit']);
    _extra = snapshotData['extra'] as String?;
    _gstNo = snapshotData['gstNo'] as String?;
    _otherDate1 = snapshotData['otherDate1'] as String?;
    _selected = snapshotData['selected'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('CUSTOMER')
          : FirebaseFirestore.instance.collectionGroup('CUSTOMER');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('CUSTOMER').doc(id);

  static Stream<CustomerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerRecord.fromSnapshot(s));

  static Future<CustomerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CustomerRecord.fromSnapshot(s));

  static CustomerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerRecordData({
  String? id,
  String? name,
  String? contact,
  String? email,
  String? address,
  String? altContact,
  String? birthdayDate,
  String? anniversaryDate,
  bool? allowedCredit,
  int? balance,
  int? creditLimit,
  int? dayLimit,
  String? extra,
  String? gstNo,
  String? otherDate1,
  bool? selected,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'contact': contact,
      'email': email,
      'address': address,
      'altContact': altContact,
      'birthdayDate': birthdayDate,
      'anniversaryDate': anniversaryDate,
      'allowedCredit': allowedCredit,
      'balance': balance,
      'creditLimit': creditLimit,
      'dayLimit': dayLimit,
      'extra': extra,
      'gstNo': gstNo,
      'otherDate1': otherDate1,
      'selected': selected,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerRecordDocumentEquality implements Equality<CustomerRecord> {
  const CustomerRecordDocumentEquality();

  @override
  bool equals(CustomerRecord? e1, CustomerRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.contact == e2?.contact &&
        e1?.email == e2?.email &&
        e1?.address == e2?.address &&
        e1?.altContact == e2?.altContact &&
        e1?.birthdayDate == e2?.birthdayDate &&
        e1?.anniversaryDate == e2?.anniversaryDate &&
        e1?.allowedCredit == e2?.allowedCredit &&
        e1?.balance == e2?.balance &&
        e1?.creditLimit == e2?.creditLimit &&
        e1?.dayLimit == e2?.dayLimit &&
        e1?.extra == e2?.extra &&
        e1?.gstNo == e2?.gstNo &&
        e1?.otherDate1 == e2?.otherDate1 &&
        e1?.selected == e2?.selected;
  }

  @override
  int hash(CustomerRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.contact,
        e?.email,
        e?.address,
        e?.altContact,
        e?.birthdayDate,
        e?.anniversaryDate,
        e?.allowedCredit,
        e?.balance,
        e?.creditLimit,
        e?.dayLimit,
        e?.extra,
        e?.gstNo,
        e?.otherDate1,
        e?.selected
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomerRecord;
}
