import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftRecord extends FirestoreRecord {
  ShiftRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "shiftNo" field.
  int? _shiftNo;
  int get shiftNo => _shiftNo ?? 0;
  bool hasShiftNo() => _shiftNo != null;

  // "totalSale" field.
  double? _totalSale;
  double get totalSale => _totalSale ?? 0.0;
  bool hasTotalSale() => _totalSale != null;

  // "advanceAmtTotal" field.
  double? _advanceAmtTotal;
  double get advanceAmtTotal => _advanceAmtTotal ?? 0.0;
  bool hasAdvanceAmtTotal() => _advanceAmtTotal != null;

  // "billCount" field.
  int? _billCount;
  int get billCount => _billCount ?? 0;
  bool hasBillCount() => _billCount != null;

  // "cashSale" field.
  double? _cashSale;
  double get cashSale => _cashSale ?? 0.0;
  bool hasCashSale() => _cashSale != null;

  // "creditSale" field.
  double? _creditSale;
  double get creditSale => _creditSale ?? 0.0;
  bool hasCreditSale() => _creditSale != null;

  // "customerReceiveAmtTotal" field.
  double? _customerReceiveAmtTotal;
  double get customerReceiveAmtTotal => _customerReceiveAmtTotal ?? 0.0;
  bool hasCustomerReceiveAmtTotal() => _customerReceiveAmtTotal != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  bool hasDeviceId() => _deviceId != null;

  // "digitalSale" field.
  double? _digitalSale;
  double get digitalSale => _digitalSale ?? 0.0;
  bool hasDigitalSale() => _digitalSale != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  bool hasDiscount() => _discount != null;

  // "endTime" field.
  int? _endTime;
  int get endTime => _endTime ?? 0;
  bool hasEndTime() => _endTime != null;

  // "expensesAmtTotal" field.
  double? _expensesAmtTotal;
  double get expensesAmtTotal => _expensesAmtTotal ?? 0.0;
  bool hasExpensesAmtTotal() => _expensesAmtTotal != null;

  // "extraCharges" field.
  double? _extraCharges;
  double get extraCharges => _extraCharges ?? 0.0;
  bool hasExtraCharges() => _extraCharges != null;

  // "inActive" field.
  bool? _inActive;
  bool get inActive => _inActive ?? false;
  bool hasInActive() => _inActive != null;

  // "lastBillNo" field.
  String? _lastBillNo;
  String get lastBillNo => _lastBillNo ?? '';
  bool hasLastBillNo() => _lastBillNo != null;

  // "lastBillTime" field.
  int? _lastBillTime;
  int get lastBillTime => _lastBillTime ?? 0;
  bool hasLastBillTime() => _lastBillTime != null;

  // "openingAmt" field.
  double? _openingAmt;
  double get openingAmt => _openingAmt ?? 0.0;
  bool hasOpeningAmt() => _openingAmt != null;

  // "receiveAmtTotal" field.
  double? _receiveAmtTotal;
  double get receiveAmtTotal => _receiveAmtTotal ?? 0.0;
  bool hasReceiveAmtTotal() => _receiveAmtTotal != null;

  // "refundAmount" field.
  double? _refundAmount;
  double get refundAmount => _refundAmount ?? 0.0;
  bool hasRefundAmount() => _refundAmount != null;

  // "roundOff" field.
  double? _roundOff;
  double get roundOff => _roundOff ?? 0.0;
  bool hasRoundOff() => _roundOff != null;

  // "startTime" field.
  int? _startTime;
  int get startTime => _startTime ?? 0;
  bool hasStartTime() => _startTime != null;

  // "subTotalBill" field.
  double? _subTotalBill;
  double get subTotalBill => _subTotalBill ?? 0.0;
  bool hasSubTotalBill() => _subTotalBill != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  bool hasTax() => _tax != null;

  // "paymentJson" field.
  String? _paymentJson;
  String get paymentJson => _paymentJson ?? '';
  bool hasPaymentJson() => _paymentJson != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _dayId = snapshotData['dayId'] as String?;
    _shiftNo = castToType<int>(snapshotData['shiftNo']);
    _totalSale = castToType<double>(snapshotData['totalSale']);
    _advanceAmtTotal = castToType<double>(snapshotData['advanceAmtTotal']);
    _billCount = castToType<int>(snapshotData['billCount']);
    _cashSale = castToType<double>(snapshotData['cashSale']);
    _creditSale = castToType<double>(snapshotData['creditSale']);
    _customerReceiveAmtTotal =
        castToType<double>(snapshotData['customerReceiveAmtTotal']);
    _deviceId = snapshotData['deviceId'] as String?;
    _digitalSale = castToType<double>(snapshotData['digitalSale']);
    _discount = castToType<double>(snapshotData['discount']);
    _endTime = castToType<int>(snapshotData['endTime']);
    _expensesAmtTotal = castToType<double>(snapshotData['expensesAmtTotal']);
    _extraCharges = castToType<double>(snapshotData['extraCharges']);
    _inActive = snapshotData['inActive'] as bool?;
    _lastBillNo = snapshotData['lastBillNo'] as String?;
    _lastBillTime = castToType<int>(snapshotData['lastBillTime']);
    _openingAmt = castToType<double>(snapshotData['openingAmt']);
    _receiveAmtTotal = castToType<double>(snapshotData['receiveAmtTotal']);
    _refundAmount = castToType<double>(snapshotData['refundAmount']);
    _roundOff = castToType<double>(snapshotData['roundOff']);
    _startTime = castToType<int>(snapshotData['startTime']);
    _subTotalBill = castToType<double>(snapshotData['subTotalBill']);
    _tax = castToType<double>(snapshotData['tax']);
    _paymentJson = snapshotData['paymentJson'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SHIFT')
          : FirebaseFirestore.instance.collectionGroup('SHIFT');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SHIFT').doc(id);

  static Stream<ShiftRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShiftRecord.fromSnapshot(s));

  static Future<ShiftRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShiftRecord.fromSnapshot(s));

  static ShiftRecord fromSnapshot(DocumentSnapshot snapshot) => ShiftRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShiftRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShiftRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShiftRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShiftRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShiftRecordData({
  String? id,
  String? dayId,
  int? shiftNo,
  double? totalSale,
  double? advanceAmtTotal,
  int? billCount,
  double? cashSale,
  double? creditSale,
  double? customerReceiveAmtTotal,
  String? deviceId,
  double? digitalSale,
  double? discount,
  int? endTime,
  double? expensesAmtTotal,
  double? extraCharges,
  bool? inActive,
  String? lastBillNo,
  int? lastBillTime,
  double? openingAmt,
  double? receiveAmtTotal,
  double? refundAmount,
  double? roundOff,
  int? startTime,
  double? subTotalBill,
  double? tax,
  String? paymentJson,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'dayId': dayId,
      'shiftNo': shiftNo,
      'totalSale': totalSale,
      'advanceAmtTotal': advanceAmtTotal,
      'billCount': billCount,
      'cashSale': cashSale,
      'creditSale': creditSale,
      'customerReceiveAmtTotal': customerReceiveAmtTotal,
      'deviceId': deviceId,
      'digitalSale': digitalSale,
      'discount': discount,
      'endTime': endTime,
      'expensesAmtTotal': expensesAmtTotal,
      'extraCharges': extraCharges,
      'inActive': inActive,
      'lastBillNo': lastBillNo,
      'lastBillTime': lastBillTime,
      'openingAmt': openingAmt,
      'receiveAmtTotal': receiveAmtTotal,
      'refundAmount': refundAmount,
      'roundOff': roundOff,
      'startTime': startTime,
      'subTotalBill': subTotalBill,
      'tax': tax,
      'paymentJson': paymentJson,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShiftRecordDocumentEquality implements Equality<ShiftRecord> {
  const ShiftRecordDocumentEquality();

  @override
  bool equals(ShiftRecord? e1, ShiftRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.dayId == e2?.dayId &&
        e1?.shiftNo == e2?.shiftNo &&
        e1?.totalSale == e2?.totalSale &&
        e1?.advanceAmtTotal == e2?.advanceAmtTotal &&
        e1?.billCount == e2?.billCount &&
        e1?.cashSale == e2?.cashSale &&
        e1?.creditSale == e2?.creditSale &&
        e1?.customerReceiveAmtTotal == e2?.customerReceiveAmtTotal &&
        e1?.deviceId == e2?.deviceId &&
        e1?.digitalSale == e2?.digitalSale &&
        e1?.discount == e2?.discount &&
        e1?.endTime == e2?.endTime &&
        e1?.expensesAmtTotal == e2?.expensesAmtTotal &&
        e1?.extraCharges == e2?.extraCharges &&
        e1?.inActive == e2?.inActive &&
        e1?.lastBillNo == e2?.lastBillNo &&
        e1?.lastBillTime == e2?.lastBillTime &&
        e1?.openingAmt == e2?.openingAmt &&
        e1?.receiveAmtTotal == e2?.receiveAmtTotal &&
        e1?.refundAmount == e2?.refundAmount &&
        e1?.roundOff == e2?.roundOff &&
        e1?.startTime == e2?.startTime &&
        e1?.subTotalBill == e2?.subTotalBill &&
        e1?.tax == e2?.tax &&
        e1?.paymentJson == e2?.paymentJson;
  }

  @override
  int hash(ShiftRecord? e) => const ListEquality().hash([
        e?.id,
        e?.dayId,
        e?.shiftNo,
        e?.totalSale,
        e?.advanceAmtTotal,
        e?.billCount,
        e?.cashSale,
        e?.creditSale,
        e?.customerReceiveAmtTotal,
        e?.deviceId,
        e?.digitalSale,
        e?.discount,
        e?.endTime,
        e?.expensesAmtTotal,
        e?.extraCharges,
        e?.inActive,
        e?.lastBillNo,
        e?.lastBillTime,
        e?.openingAmt,
        e?.receiveAmtTotal,
        e?.refundAmount,
        e?.roundOff,
        e?.startTime,
        e?.subTotalBill,
        e?.tax,
        e?.paymentJson
      ]);

  @override
  bool isValidKey(Object? o) => o is ShiftRecord;
}
