// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PremDataToTypeStruct extends FFFirebaseStruct {
  PremDataToTypeStruct({
    String? premHead,
    double? premValue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _premHead = premHead,
        _premValue = premValue,
        super(firestoreUtilData);

  // "premHead" field.
  String? _premHead;
  String get premHead => _premHead ?? '';
  set premHead(String? val) => _premHead = val;
  bool hasPremHead() => _premHead != null;

  // "premValue" field.
  double? _premValue;
  double get premValue => _premValue ?? 0.0;
  set premValue(double? val) => _premValue = val;
  void incrementPremValue(double amount) => _premValue = premValue + amount;
  bool hasPremValue() => _premValue != null;

  static PremDataToTypeStruct fromMap(Map<String, dynamic> data) =>
      PremDataToTypeStruct(
        premHead: data['premHead'] as String?,
        premValue: castToType<double>(data['premValue']),
      );

  static PremDataToTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? PremDataToTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'premHead': _premHead,
        'premValue': _premValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'premHead': serializeParam(
          _premHead,
          ParamType.String,
        ),
        'premValue': serializeParam(
          _premValue,
          ParamType.double,
        ),
      }.withoutNulls;

  static PremDataToTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      PremDataToTypeStruct(
        premHead: deserializeParam(
          data['premHead'],
          ParamType.String,
          false,
        ),
        premValue: deserializeParam(
          data['premValue'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PremDataToTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PremDataToTypeStruct &&
        premHead == other.premHead &&
        premValue == other.premValue;
  }

  @override
  int get hashCode => const ListEquality().hash([premHead, premValue]);
}

PremDataToTypeStruct createPremDataToTypeStruct({
  String? premHead,
  double? premValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PremDataToTypeStruct(
      premHead: premHead,
      premValue: premValue,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PremDataToTypeStruct? updatePremDataToTypeStruct(
  PremDataToTypeStruct? premDataToType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    premDataToType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPremDataToTypeStructData(
  Map<String, dynamic> firestoreData,
  PremDataToTypeStruct? premDataToType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (premDataToType == null) {
    return;
  }
  if (premDataToType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && premDataToType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final premDataToTypeData =
      getPremDataToTypeFirestoreData(premDataToType, forFieldValue);
  final nestedData =
      premDataToTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = premDataToType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPremDataToTypeFirestoreData(
  PremDataToTypeStruct? premDataToType, [
  bool forFieldValue = false,
]) {
  if (premDataToType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(premDataToType.toMap());

  // Add any Firestore field values
  premDataToType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPremDataToTypeListFirestoreData(
  List<PremDataToTypeStruct>? premDataToTypes,
) =>
    premDataToTypes
        ?.map((e) => getPremDataToTypeFirestoreData(e, true))
        .toList() ??
    [];
