import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicePointRecord extends FirestoreRecord {
  ServicePointRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "footer" field.
  String? _footer;
  String get footer => _footer ?? '';
  bool hasFooter() => _footer != null;

  // "header" field.
  String? _header;
  String get header => _header ?? '';
  bool hasHeader() => _header != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "paperSize" field.
  int? _paperSize;
  int get paperSize => _paperSize ?? 0;
  bool hasPaperSize() => _paperSize != null;

  // "port" field.
  int? _port;
  int get port => _port ?? 0;
  bool hasPort() => _port != null;

  // "printerIpAddress" field.
  String? _printerIpAddress;
  String get printerIpAddress => _printerIpAddress ?? '';
  bool hasPrinterIpAddress() => _printerIpAddress != null;

  // "printerType" field.
  int? _printerType;
  int get printerType => _printerType ?? 0;
  bool hasPrinterType() => _printerType != null;

  // "subHeader" field.
  String? _subHeader;
  String get subHeader => _subHeader ?? '';
  bool hasSubHeader() => _subHeader != null;

  // "usbPath" field.
  String? _usbPath;
  String get usbPath => _usbPath ?? '';
  bool hasUsbPath() => _usbPath != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _footer = snapshotData['footer'] as String?;
    _header = snapshotData['header'] as String?;
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _paperSize = castToType<int>(snapshotData['paperSize']);
    _port = castToType<int>(snapshotData['port']);
    _printerIpAddress = snapshotData['printerIpAddress'] as String?;
    _printerType = castToType<int>(snapshotData['printerType']);
    _subHeader = snapshotData['subHeader'] as String?;
    _usbPath = snapshotData['usbPath'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SERVICE_POINT')
          : FirebaseFirestore.instance.collectionGroup('SERVICE_POINT');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SERVICE_POINT').doc(id);

  static Stream<ServicePointRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicePointRecord.fromSnapshot(s));

  static Future<ServicePointRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicePointRecord.fromSnapshot(s));

  static ServicePointRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicePointRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicePointRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicePointRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicePointRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicePointRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicePointRecordData({
  String? footer,
  String? header,
  String? id,
  String? name,
  int? paperSize,
  int? port,
  String? printerIpAddress,
  int? printerType,
  String? subHeader,
  String? usbPath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'footer': footer,
      'header': header,
      'id': id,
      'name': name,
      'paperSize': paperSize,
      'port': port,
      'printerIpAddress': printerIpAddress,
      'printerType': printerType,
      'subHeader': subHeader,
      'usbPath': usbPath,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicePointRecordDocumentEquality
    implements Equality<ServicePointRecord> {
  const ServicePointRecordDocumentEquality();

  @override
  bool equals(ServicePointRecord? e1, ServicePointRecord? e2) {
    return e1?.footer == e2?.footer &&
        e1?.header == e2?.header &&
        e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.paperSize == e2?.paperSize &&
        e1?.port == e2?.port &&
        e1?.printerIpAddress == e2?.printerIpAddress &&
        e1?.printerType == e2?.printerType &&
        e1?.subHeader == e2?.subHeader &&
        e1?.usbPath == e2?.usbPath;
  }

  @override
  int hash(ServicePointRecord? e) => const ListEquality().hash([
        e?.footer,
        e?.header,
        e?.id,
        e?.name,
        e?.paperSize,
        e?.port,
        e?.printerIpAddress,
        e?.printerType,
        e?.subHeader,
        e?.usbPath
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicePointRecord;
}
