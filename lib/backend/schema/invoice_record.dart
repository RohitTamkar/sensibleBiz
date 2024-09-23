import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoiceRecord extends FirestoreRecord {
  InvoiceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "billAmt" field.
  double? _billAmt;
  double get billAmt => _billAmt ?? 0.0;
  bool hasBillAmt() => _billAmt != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "delliveryChrg" field.
  double? _delliveryChrg;
  double get delliveryChrg => _delliveryChrg ?? 0.0;
  bool hasDelliveryChrg() => _delliveryChrg != null;

  // "discountAmt" field.
  double? _discountAmt;
  double get discountAmt => _discountAmt ?? 0.0;
  bool hasDiscountAmt() => _discountAmt != null;

  // "discountPer" field.
  double? _discountPer;
  double get discountPer => _discountPer ?? 0.0;
  bool hasDiscountPer() => _discountPer != null;

  // "finalBillAmt" field.
  double? _finalBillAmt;
  double get finalBillAmt => _finalBillAmt ?? 0.0;
  bool hasFinalBillAmt() => _finalBillAmt != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "invoice" field.
  String? _invoice;
  String get invoice => _invoice ?? '';
  bool hasInvoice() => _invoice != null;

  // "invoiceDate" field.
  DateTime? _invoiceDate;
  DateTime? get invoiceDate => _invoiceDate;
  bool hasInvoiceDate() => _invoiceDate != null;

  // "party" field.
  String? _party;
  String get party => _party ?? '';
  bool hasParty() => _party != null;

  // "paymentMode" field.
  String? _paymentMode;
  String get paymentMode => _paymentMode ?? '';
  bool hasPaymentMode() => _paymentMode != null;

  // "taxAmt" field.
  double? _taxAmt;
  double get taxAmt => _taxAmt ?? 0.0;
  bool hasTaxAmt() => _taxAmt != null;

  // "products" field.
  String? _products;
  String get products => _products ?? '';
  bool hasProducts() => _products != null;

  // "shiftId" field.
  String? _shiftId;
  String get shiftId => _shiftId ?? '';
  bool hasShiftId() => _shiftId != null;

  // "productList" field.
  List<ProductListMapStruct>? _productList;
  List<ProductListMapStruct> get productList => _productList ?? const [];
  bool hasProductList() => _productList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _billAmt = castToType<double>(snapshotData['billAmt']);
    _dayId = snapshotData['dayId'] as String?;
    _delliveryChrg = castToType<double>(snapshotData['delliveryChrg']);
    _discountAmt = castToType<double>(snapshotData['discountAmt']);
    _discountPer = castToType<double>(snapshotData['discountPer']);
    _finalBillAmt = castToType<double>(snapshotData['finalBillAmt']);
    _id = snapshotData['id'] as String?;
    _invoice = snapshotData['invoice'] as String?;
    _invoiceDate = snapshotData['invoiceDate'] as DateTime?;
    _party = snapshotData['party'] as String?;
    _paymentMode = snapshotData['paymentMode'] as String?;
    _taxAmt = castToType<double>(snapshotData['taxAmt']);
    _products = snapshotData['products'] as String?;
    _shiftId = snapshotData['shiftId'] as String?;
    _productList = getStructList(
      snapshotData['productList'],
      ProductListMapStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('INVOICE')
          : FirebaseFirestore.instance.collectionGroup('INVOICE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('INVOICE').doc(id);

  static Stream<InvoiceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoiceRecord.fromSnapshot(s));

  static Future<InvoiceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoiceRecord.fromSnapshot(s));

  static InvoiceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoiceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoiceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoiceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoiceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoiceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoiceRecordData({
  double? billAmt,
  String? dayId,
  double? delliveryChrg,
  double? discountAmt,
  double? discountPer,
  double? finalBillAmt,
  String? id,
  String? invoice,
  DateTime? invoiceDate,
  String? party,
  String? paymentMode,
  double? taxAmt,
  String? products,
  String? shiftId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'billAmt': billAmt,
      'dayId': dayId,
      'delliveryChrg': delliveryChrg,
      'discountAmt': discountAmt,
      'discountPer': discountPer,
      'finalBillAmt': finalBillAmt,
      'id': id,
      'invoice': invoice,
      'invoiceDate': invoiceDate,
      'party': party,
      'paymentMode': paymentMode,
      'taxAmt': taxAmt,
      'products': products,
      'shiftId': shiftId,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoiceRecordDocumentEquality implements Equality<InvoiceRecord> {
  const InvoiceRecordDocumentEquality();

  @override
  bool equals(InvoiceRecord? e1, InvoiceRecord? e2) {
    const listEquality = ListEquality();
    return e1?.billAmt == e2?.billAmt &&
        e1?.dayId == e2?.dayId &&
        e1?.delliveryChrg == e2?.delliveryChrg &&
        e1?.discountAmt == e2?.discountAmt &&
        e1?.discountPer == e2?.discountPer &&
        e1?.finalBillAmt == e2?.finalBillAmt &&
        e1?.id == e2?.id &&
        e1?.invoice == e2?.invoice &&
        e1?.invoiceDate == e2?.invoiceDate &&
        e1?.party == e2?.party &&
        e1?.paymentMode == e2?.paymentMode &&
        e1?.taxAmt == e2?.taxAmt &&
        e1?.products == e2?.products &&
        e1?.shiftId == e2?.shiftId &&
        listEquality.equals(e1?.productList, e2?.productList);
  }

  @override
  int hash(InvoiceRecord? e) => const ListEquality().hash([
        e?.billAmt,
        e?.dayId,
        e?.delliveryChrg,
        e?.discountAmt,
        e?.discountPer,
        e?.finalBillAmt,
        e?.id,
        e?.invoice,
        e?.invoiceDate,
        e?.party,
        e?.paymentMode,
        e?.taxAmt,
        e?.products,
        e?.shiftId,
        e?.productList
      ]);

  @override
  bool isValidKey(Object? o) => o is InvoiceRecord;
}
