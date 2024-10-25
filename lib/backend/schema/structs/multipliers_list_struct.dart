// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MultipliersListStruct extends FFFirebaseStruct {
  MultipliersListStruct({
    String? outletId,
    double? multiplier,
    String? id,
    String? outletName,
    double? sPrice,
    double? mrp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _outletId = outletId,
        _multiplier = multiplier,
        _id = id,
        _outletName = outletName,
        _sPrice = sPrice,
        _mrp = mrp,
        super(firestoreUtilData);

  // "outletId" field.
  String? _outletId;
  String get outletId => _outletId ?? '';
  set outletId(String? val) => _outletId = val;

  bool hasOutletId() => _outletId != null;

  // "multiplier" field.
  double? _multiplier;
  double get multiplier => _multiplier ?? 0.0;
  set multiplier(double? val) => _multiplier = val;

  void incrementMultiplier(double amount) => multiplier = multiplier + amount;

  bool hasMultiplier() => _multiplier != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "outletName" field.
  String? _outletName;
  String get outletName => _outletName ?? '';
  set outletName(String? val) => _outletName = val;

  bool hasOutletName() => _outletName != null;

  // "sPrice" field.
  double? _sPrice;
  double get sPrice => _sPrice ?? 0.0;
  set sPrice(double? val) => _sPrice = val;

  void incrementSPrice(double amount) => sPrice = sPrice + amount;

  bool hasSPrice() => _sPrice != null;

  // "mrp" field.
  double? _mrp;
  double get mrp => _mrp ?? 0.0;
  set mrp(double? val) => _mrp = val;

  void incrementMrp(double amount) => mrp = mrp + amount;

  bool hasMrp() => _mrp != null;

  static MultipliersListStruct fromMap(Map<String, dynamic> data) =>
      MultipliersListStruct(
        outletId: data['outletId'] as String?,
        multiplier: castToType<double>(data['multiplier']),
        id: data['id'] as String?,
        outletName: data['outletName'] as String?,
        sPrice: castToType<double>(data['sPrice']),
        mrp: castToType<double>(data['mrp']),
      );

  static MultipliersListStruct? maybeFromMap(dynamic data) => data is Map
      ? MultipliersListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'outletId': _outletId,
        'multiplier': _multiplier,
        'id': _id,
        'outletName': _outletName,
        'sPrice': _sPrice,
        'mrp': _mrp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'outletId': serializeParam(
          _outletId,
          ParamType.String,
        ),
        'multiplier': serializeParam(
          _multiplier,
          ParamType.double,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'outletName': serializeParam(
          _outletName,
          ParamType.String,
        ),
        'sPrice': serializeParam(
          _sPrice,
          ParamType.double,
        ),
        'mrp': serializeParam(
          _mrp,
          ParamType.double,
        ),
      }.withoutNulls;

  static MultipliersListStruct fromSerializableMap(Map<String, dynamic> data) =>
      MultipliersListStruct(
        outletId: deserializeParam(
          data['outletId'],
          ParamType.String,
          false,
        ),
        multiplier: deserializeParam(
          data['multiplier'],
          ParamType.double,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        outletName: deserializeParam(
          data['outletName'],
          ParamType.String,
          false,
        ),
        sPrice: deserializeParam(
          data['sPrice'],
          ParamType.double,
          false,
        ),
        mrp: deserializeParam(
          data['mrp'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'MultipliersListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MultipliersListStruct &&
        outletId == other.outletId &&
        multiplier == other.multiplier &&
        id == other.id &&
        outletName == other.outletName &&
        sPrice == other.sPrice &&
        mrp == other.mrp;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([outletId, multiplier, id, outletName, sPrice, mrp]);
}

MultipliersListStruct createMultipliersListStruct({
  String? outletId,
  double? multiplier,
  String? id,
  String? outletName,
  double? sPrice,
  double? mrp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MultipliersListStruct(
      outletId: outletId,
      multiplier: multiplier,
      id: id,
      outletName: outletName,
      sPrice: sPrice,
      mrp: mrp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MultipliersListStruct? updateMultipliersListStruct(
  MultipliersListStruct? multipliersList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    multipliersList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMultipliersListStructData(
  Map<String, dynamic> firestoreData,
  MultipliersListStruct? multipliersList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (multipliersList == null) {
    return;
  }
  if (multipliersList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && multipliersList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final multipliersListData =
      getMultipliersListFirestoreData(multipliersList, forFieldValue);
  final nestedData =
      multipliersListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = multipliersList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMultipliersListFirestoreData(
  MultipliersListStruct? multipliersList, [
  bool forFieldValue = false,
]) {
  if (multipliersList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(multipliersList.toMap());

  // Add any Firestore field values
  multipliersList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMultipliersListListFirestoreData(
  List<MultipliersListStruct>? multipliersLists,
) =>
    multipliersLists
        ?.map((e) => getMultipliersListFirestoreData(e, true))
        .toList() ??
    [];
