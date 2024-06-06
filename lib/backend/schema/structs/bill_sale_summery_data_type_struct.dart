// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BillSaleSummeryDataTypeStruct extends FFFirebaseStruct {
  BillSaleSummeryDataTypeStruct({
    String? billNo,
    int? finalTotal,
    String? id,
    String? serialNo,
    String? userId,
    int? checkInTime,
    int? checkOutTime,
    String? dayId,
    int? createdDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _billNo = billNo,
        _finalTotal = finalTotal,
        _id = id,
        _serialNo = serialNo,
        _userId = userId,
        _checkInTime = checkInTime,
        _checkOutTime = checkOutTime,
        _dayId = dayId,
        _createdDate = createdDate,
        super(firestoreUtilData);

  // "billNo" field.
  String? _billNo;
  String get billNo => _billNo ?? '';
  set billNo(String? val) => _billNo = val;
  bool hasBillNo() => _billNo != null;

  // "finalTotal" field.
  int? _finalTotal;
  int get finalTotal => _finalTotal ?? 0;
  set finalTotal(int? val) => _finalTotal = val;
  void incrementFinalTotal(int amount) => _finalTotal = finalTotal + amount;
  bool hasFinalTotal() => _finalTotal != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "serialNo" field.
  String? _serialNo;
  String get serialNo => _serialNo ?? '';
  set serialNo(String? val) => _serialNo = val;
  bool hasSerialNo() => _serialNo != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;
  bool hasUserId() => _userId != null;

  // "checkInTime" field.
  int? _checkInTime;
  int get checkInTime => _checkInTime ?? 0;
  set checkInTime(int? val) => _checkInTime = val;
  void incrementCheckInTime(int amount) => _checkInTime = checkInTime + amount;
  bool hasCheckInTime() => _checkInTime != null;

  // "checkOutTime" field.
  int? _checkOutTime;
  int get checkOutTime => _checkOutTime ?? 0;
  set checkOutTime(int? val) => _checkOutTime = val;
  void incrementCheckOutTime(int amount) =>
      _checkOutTime = checkOutTime + amount;
  bool hasCheckOutTime() => _checkOutTime != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  set dayId(String? val) => _dayId = val;
  bool hasDayId() => _dayId != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  set createdDate(int? val) => _createdDate = val;
  void incrementCreatedDate(int amount) => _createdDate = createdDate + amount;
  bool hasCreatedDate() => _createdDate != null;

  static BillSaleSummeryDataTypeStruct fromMap(Map<String, dynamic> data) =>
      BillSaleSummeryDataTypeStruct(
        billNo: data['billNo'] as String?,
        finalTotal: castToType<int>(data['finalTotal']),
        id: data['id'] as String?,
        serialNo: data['serialNo'] as String?,
        userId: data['userId'] as String?,
        checkInTime: castToType<int>(data['checkInTime']),
        checkOutTime: castToType<int>(data['checkOutTime']),
        dayId: data['dayId'] as String?,
        createdDate: castToType<int>(data['createdDate']),
      );

  static BillSaleSummeryDataTypeStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? BillSaleSummeryDataTypeStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'billNo': _billNo,
        'finalTotal': _finalTotal,
        'id': _id,
        'serialNo': _serialNo,
        'userId': _userId,
        'checkInTime': _checkInTime,
        'checkOutTime': _checkOutTime,
        'dayId': _dayId,
        'createdDate': _createdDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'billNo': serializeParam(
          _billNo,
          ParamType.String,
        ),
        'finalTotal': serializeParam(
          _finalTotal,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'serialNo': serializeParam(
          _serialNo,
          ParamType.String,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'checkInTime': serializeParam(
          _checkInTime,
          ParamType.int,
        ),
        'checkOutTime': serializeParam(
          _checkOutTime,
          ParamType.int,
        ),
        'dayId': serializeParam(
          _dayId,
          ParamType.String,
        ),
        'createdDate': serializeParam(
          _createdDate,
          ParamType.int,
        ),
      }.withoutNulls;

  static BillSaleSummeryDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BillSaleSummeryDataTypeStruct(
        billNo: deserializeParam(
          data['billNo'],
          ParamType.String,
          false,
        ),
        finalTotal: deserializeParam(
          data['finalTotal'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        serialNo: deserializeParam(
          data['serialNo'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        checkInTime: deserializeParam(
          data['checkInTime'],
          ParamType.int,
          false,
        ),
        checkOutTime: deserializeParam(
          data['checkOutTime'],
          ParamType.int,
          false,
        ),
        dayId: deserializeParam(
          data['dayId'],
          ParamType.String,
          false,
        ),
        createdDate: deserializeParam(
          data['createdDate'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BillSaleSummeryDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BillSaleSummeryDataTypeStruct &&
        billNo == other.billNo &&
        finalTotal == other.finalTotal &&
        id == other.id &&
        serialNo == other.serialNo &&
        userId == other.userId &&
        checkInTime == other.checkInTime &&
        checkOutTime == other.checkOutTime &&
        dayId == other.dayId &&
        createdDate == other.createdDate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        billNo,
        finalTotal,
        id,
        serialNo,
        userId,
        checkInTime,
        checkOutTime,
        dayId,
        createdDate
      ]);
}

BillSaleSummeryDataTypeStruct createBillSaleSummeryDataTypeStruct({
  String? billNo,
  int? finalTotal,
  String? id,
  String? serialNo,
  String? userId,
  int? checkInTime,
  int? checkOutTime,
  String? dayId,
  int? createdDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BillSaleSummeryDataTypeStruct(
      billNo: billNo,
      finalTotal: finalTotal,
      id: id,
      serialNo: serialNo,
      userId: userId,
      checkInTime: checkInTime,
      checkOutTime: checkOutTime,
      dayId: dayId,
      createdDate: createdDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BillSaleSummeryDataTypeStruct? updateBillSaleSummeryDataTypeStruct(
  BillSaleSummeryDataTypeStruct? billSaleSummeryDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    billSaleSummeryDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBillSaleSummeryDataTypeStructData(
  Map<String, dynamic> firestoreData,
  BillSaleSummeryDataTypeStruct? billSaleSummeryDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (billSaleSummeryDataType == null) {
    return;
  }
  if (billSaleSummeryDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      billSaleSummeryDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final billSaleSummeryDataTypeData = getBillSaleSummeryDataTypeFirestoreData(
      billSaleSummeryDataType, forFieldValue);
  final nestedData =
      billSaleSummeryDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      billSaleSummeryDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBillSaleSummeryDataTypeFirestoreData(
  BillSaleSummeryDataTypeStruct? billSaleSummeryDataType, [
  bool forFieldValue = false,
]) {
  if (billSaleSummeryDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(billSaleSummeryDataType.toMap());

  // Add any Firestore field values
  billSaleSummeryDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBillSaleSummeryDataTypeListFirestoreData(
  List<BillSaleSummeryDataTypeStruct>? billSaleSummeryDataTypes,
) =>
    billSaleSummeryDataTypes
        ?.map((e) => getBillSaleSummeryDataTypeFirestoreData(e, true))
        .toList() ??
    [];
