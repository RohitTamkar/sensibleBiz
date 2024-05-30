// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductMasterListStruct extends FFFirebaseStruct {
  ProductMasterListStruct({
    String? id,
    bool? active,
    String? category,
    String? barcode,
    double? cess,
    int? code,
    double? costPrice,
    DateTime? dateTime,
    double? discount,
    int? keyCount,
    String? kitchenId,
    double? mrpPrice,
    String? name,
    double? onlinePrice,
    bool? onlineSynced,
    double? price,
    String? priceTable,
    String? recipeId,
    String? regionalName,
    int? reorderLevel,
    bool? selected,
    String? shortName,
    bool? stockable,
    int? taxIndex,
    int? type,
    int? unitId,
    double? currentStock,
    String? unitType,
    int? categoryNo,
    int? batchNo,
    String? hsnCode,
    bool? rooms,
    int? state,
    int? viewType,
    String? weightable,
    double? defaultPrice,
    String? dayType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _active = active,
        _category = category,
        _barcode = barcode,
        _cess = cess,
        _code = code,
        _costPrice = costPrice,
        _dateTime = dateTime,
        _discount = discount,
        _keyCount = keyCount,
        _kitchenId = kitchenId,
        _mrpPrice = mrpPrice,
        _name = name,
        _onlinePrice = onlinePrice,
        _onlineSynced = onlineSynced,
        _price = price,
        _priceTable = priceTable,
        _recipeId = recipeId,
        _regionalName = regionalName,
        _reorderLevel = reorderLevel,
        _selected = selected,
        _shortName = shortName,
        _stockable = stockable,
        _taxIndex = taxIndex,
        _type = type,
        _unitId = unitId,
        _currentStock = currentStock,
        _unitType = unitType,
        _categoryNo = categoryNo,
        _batchNo = batchNo,
        _hsnCode = hsnCode,
        _rooms = rooms,
        _state = state,
        _viewType = viewType,
        _weightable = weightable,
        _defaultPrice = defaultPrice,
        _dayType = dayType,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  set active(bool? val) => _active = val;
  bool hasActive() => _active != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;
  bool hasCategory() => _category != null;

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;
  bool hasBarcode() => _barcode != null;

  // "cess" field.
  double? _cess;
  double get cess => _cess ?? 0.0;
  set cess(double? val) => _cess = val;
  void incrementCess(double amount) => _cess = cess + amount;
  bool hasCess() => _cess != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;
  void incrementCode(int amount) => _code = code + amount;
  bool hasCode() => _code != null;

  // "costPrice" field.
  double? _costPrice;
  double get costPrice => _costPrice ?? 0.0;
  set costPrice(double? val) => _costPrice = val;
  void incrementCostPrice(double amount) => _costPrice = costPrice + amount;
  bool hasCostPrice() => _costPrice != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  set dateTime(DateTime? val) => _dateTime = val;
  bool hasDateTime() => _dateTime != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  set discount(double? val) => _discount = val;
  void incrementDiscount(double amount) => _discount = discount + amount;
  bool hasDiscount() => _discount != null;

  // "keyCount" field.
  int? _keyCount;
  int get keyCount => _keyCount ?? 0;
  set keyCount(int? val) => _keyCount = val;
  void incrementKeyCount(int amount) => _keyCount = keyCount + amount;
  bool hasKeyCount() => _keyCount != null;

  // "kitchenId" field.
  String? _kitchenId;
  String get kitchenId => _kitchenId ?? '';
  set kitchenId(String? val) => _kitchenId = val;
  bool hasKitchenId() => _kitchenId != null;

  // "mrpPrice" field.
  double? _mrpPrice;
  double get mrpPrice => _mrpPrice ?? 0.0;
  set mrpPrice(double? val) => _mrpPrice = val;
  void incrementMrpPrice(double amount) => _mrpPrice = mrpPrice + amount;
  bool hasMrpPrice() => _mrpPrice != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "onlinePrice" field.
  double? _onlinePrice;
  double get onlinePrice => _onlinePrice ?? 0.0;
  set onlinePrice(double? val) => _onlinePrice = val;
  void incrementOnlinePrice(double amount) =>
      _onlinePrice = onlinePrice + amount;
  bool hasOnlinePrice() => _onlinePrice != null;

  // "onlineSynced" field.
  bool? _onlineSynced;
  bool get onlineSynced => _onlineSynced ?? false;
  set onlineSynced(bool? val) => _onlineSynced = val;
  bool hasOnlineSynced() => _onlineSynced != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "priceTable" field.
  String? _priceTable;
  String get priceTable => _priceTable ?? '';
  set priceTable(String? val) => _priceTable = val;
  bool hasPriceTable() => _priceTable != null;

  // "recipeId" field.
  String? _recipeId;
  String get recipeId => _recipeId ?? '';
  set recipeId(String? val) => _recipeId = val;
  bool hasRecipeId() => _recipeId != null;

  // "regionalName" field.
  String? _regionalName;
  String get regionalName => _regionalName ?? '';
  set regionalName(String? val) => _regionalName = val;
  bool hasRegionalName() => _regionalName != null;

  // "reorderLevel" field.
  int? _reorderLevel;
  int get reorderLevel => _reorderLevel ?? 0;
  set reorderLevel(int? val) => _reorderLevel = val;
  void incrementReorderLevel(int amount) =>
      _reorderLevel = reorderLevel + amount;
  bool hasReorderLevel() => _reorderLevel != null;

  // "selected" field.
  bool? _selected;
  bool get selected => _selected ?? false;
  set selected(bool? val) => _selected = val;
  bool hasSelected() => _selected != null;

  // "shortName" field.
  String? _shortName;
  String get shortName => _shortName ?? '';
  set shortName(String? val) => _shortName = val;
  bool hasShortName() => _shortName != null;

  // "stockable" field.
  bool? _stockable;
  bool get stockable => _stockable ?? false;
  set stockable(bool? val) => _stockable = val;
  bool hasStockable() => _stockable != null;

  // "taxIndex" field.
  int? _taxIndex;
  int get taxIndex => _taxIndex ?? 0;
  set taxIndex(int? val) => _taxIndex = val;
  void incrementTaxIndex(int amount) => _taxIndex = taxIndex + amount;
  bool hasTaxIndex() => _taxIndex != null;

  // "type" field.
  int? _type;
  int get type => _type ?? 0;
  set type(int? val) => _type = val;
  void incrementType(int amount) => _type = type + amount;
  bool hasType() => _type != null;

  // "unitId" field.
  int? _unitId;
  int get unitId => _unitId ?? 0;
  set unitId(int? val) => _unitId = val;
  void incrementUnitId(int amount) => _unitId = unitId + amount;
  bool hasUnitId() => _unitId != null;

  // "currentStock" field.
  double? _currentStock;
  double get currentStock => _currentStock ?? 0.0;
  set currentStock(double? val) => _currentStock = val;
  void incrementCurrentStock(double amount) =>
      _currentStock = currentStock + amount;
  bool hasCurrentStock() => _currentStock != null;

  // "unitType" field.
  String? _unitType;
  String get unitType => _unitType ?? '';
  set unitType(String? val) => _unitType = val;
  bool hasUnitType() => _unitType != null;

  // "categoryNo" field.
  int? _categoryNo;
  int get categoryNo => _categoryNo ?? 0;
  set categoryNo(int? val) => _categoryNo = val;
  void incrementCategoryNo(int amount) => _categoryNo = categoryNo + amount;
  bool hasCategoryNo() => _categoryNo != null;

  // "batchNo" field.
  int? _batchNo;
  int get batchNo => _batchNo ?? 0;
  set batchNo(int? val) => _batchNo = val;
  void incrementBatchNo(int amount) => _batchNo = batchNo + amount;
  bool hasBatchNo() => _batchNo != null;

  // "hsnCode" field.
  String? _hsnCode;
  String get hsnCode => _hsnCode ?? '';
  set hsnCode(String? val) => _hsnCode = val;
  bool hasHsnCode() => _hsnCode != null;

  // "rooms" field.
  bool? _rooms;
  bool get rooms => _rooms ?? false;
  set rooms(bool? val) => _rooms = val;
  bool hasRooms() => _rooms != null;

  // "state" field.
  int? _state;
  int get state => _state ?? 0;
  set state(int? val) => _state = val;
  void incrementState(int amount) => _state = state + amount;
  bool hasState() => _state != null;

  // "viewType" field.
  int? _viewType;
  int get viewType => _viewType ?? 0;
  set viewType(int? val) => _viewType = val;
  void incrementViewType(int amount) => _viewType = viewType + amount;
  bool hasViewType() => _viewType != null;

  // "weightable" field.
  String? _weightable;
  String get weightable => _weightable ?? '';
  set weightable(String? val) => _weightable = val;
  bool hasWeightable() => _weightable != null;

  // "defaultPrice" field.
  double? _defaultPrice;
  double get defaultPrice => _defaultPrice ?? 0.0;
  set defaultPrice(double? val) => _defaultPrice = val;
  void incrementDefaultPrice(double amount) =>
      _defaultPrice = defaultPrice + amount;
  bool hasDefaultPrice() => _defaultPrice != null;

  // "dayType" field.
  String? _dayType;
  String get dayType => _dayType ?? '';
  set dayType(String? val) => _dayType = val;
  bool hasDayType() => _dayType != null;

  static ProductMasterListStruct fromMap(Map<String, dynamic> data) =>
      ProductMasterListStruct(
        id: data['id'] as String?,
        active: data['active'] as bool?,
        category: data['category'] as String?,
        barcode: data['barcode'] as String?,
        cess: castToType<double>(data['cess']),
        code: castToType<int>(data['code']),
        costPrice: castToType<double>(data['costPrice']),
        dateTime: data['dateTime'] as DateTime?,
        discount: castToType<double>(data['discount']),
        keyCount: castToType<int>(data['keyCount']),
        kitchenId: data['kitchenId'] as String?,
        mrpPrice: castToType<double>(data['mrpPrice']),
        name: data['name'] as String?,
        onlinePrice: castToType<double>(data['onlinePrice']),
        onlineSynced: data['onlineSynced'] as bool?,
        price: castToType<double>(data['price']),
        priceTable: data['priceTable'] as String?,
        recipeId: data['recipeId'] as String?,
        regionalName: data['regionalName'] as String?,
        reorderLevel: castToType<int>(data['reorderLevel']),
        selected: data['selected'] as bool?,
        shortName: data['shortName'] as String?,
        stockable: data['stockable'] as bool?,
        taxIndex: castToType<int>(data['taxIndex']),
        type: castToType<int>(data['type']),
        unitId: castToType<int>(data['unitId']),
        currentStock: castToType<double>(data['currentStock']),
        unitType: data['unitType'] as String?,
        categoryNo: castToType<int>(data['categoryNo']),
        batchNo: castToType<int>(data['batchNo']),
        hsnCode: data['hsnCode'] as String?,
        rooms: data['rooms'] as bool?,
        state: castToType<int>(data['state']),
        viewType: castToType<int>(data['viewType']),
        weightable: data['weightable'] as String?,
        defaultPrice: castToType<double>(data['defaultPrice']),
        dayType: data['dayType'] as String?,
      );

  static ProductMasterListStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductMasterListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'active': _active,
        'category': _category,
        'barcode': _barcode,
        'cess': _cess,
        'code': _code,
        'costPrice': _costPrice,
        'dateTime': _dateTime,
        'discount': _discount,
        'keyCount': _keyCount,
        'kitchenId': _kitchenId,
        'mrpPrice': _mrpPrice,
        'name': _name,
        'onlinePrice': _onlinePrice,
        'onlineSynced': _onlineSynced,
        'price': _price,
        'priceTable': _priceTable,
        'recipeId': _recipeId,
        'regionalName': _regionalName,
        'reorderLevel': _reorderLevel,
        'selected': _selected,
        'shortName': _shortName,
        'stockable': _stockable,
        'taxIndex': _taxIndex,
        'type': _type,
        'unitId': _unitId,
        'currentStock': _currentStock,
        'unitType': _unitType,
        'categoryNo': _categoryNo,
        'batchNo': _batchNo,
        'hsnCode': _hsnCode,
        'rooms': _rooms,
        'state': _state,
        'viewType': _viewType,
        'weightable': _weightable,
        'defaultPrice': _defaultPrice,
        'dayType': _dayType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'cess': serializeParam(
          _cess,
          ParamType.double,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'costPrice': serializeParam(
          _costPrice,
          ParamType.double,
        ),
        'dateTime': serializeParam(
          _dateTime,
          ParamType.DateTime,
        ),
        'discount': serializeParam(
          _discount,
          ParamType.double,
        ),
        'keyCount': serializeParam(
          _keyCount,
          ParamType.int,
        ),
        'kitchenId': serializeParam(
          _kitchenId,
          ParamType.String,
        ),
        'mrpPrice': serializeParam(
          _mrpPrice,
          ParamType.double,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'onlinePrice': serializeParam(
          _onlinePrice,
          ParamType.double,
        ),
        'onlineSynced': serializeParam(
          _onlineSynced,
          ParamType.bool,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'priceTable': serializeParam(
          _priceTable,
          ParamType.String,
        ),
        'recipeId': serializeParam(
          _recipeId,
          ParamType.String,
        ),
        'regionalName': serializeParam(
          _regionalName,
          ParamType.String,
        ),
        'reorderLevel': serializeParam(
          _reorderLevel,
          ParamType.int,
        ),
        'selected': serializeParam(
          _selected,
          ParamType.bool,
        ),
        'shortName': serializeParam(
          _shortName,
          ParamType.String,
        ),
        'stockable': serializeParam(
          _stockable,
          ParamType.bool,
        ),
        'taxIndex': serializeParam(
          _taxIndex,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.int,
        ),
        'unitId': serializeParam(
          _unitId,
          ParamType.int,
        ),
        'currentStock': serializeParam(
          _currentStock,
          ParamType.double,
        ),
        'unitType': serializeParam(
          _unitType,
          ParamType.String,
        ),
        'categoryNo': serializeParam(
          _categoryNo,
          ParamType.int,
        ),
        'batchNo': serializeParam(
          _batchNo,
          ParamType.int,
        ),
        'hsnCode': serializeParam(
          _hsnCode,
          ParamType.String,
        ),
        'rooms': serializeParam(
          _rooms,
          ParamType.bool,
        ),
        'state': serializeParam(
          _state,
          ParamType.int,
        ),
        'viewType': serializeParam(
          _viewType,
          ParamType.int,
        ),
        'weightable': serializeParam(
          _weightable,
          ParamType.String,
        ),
        'defaultPrice': serializeParam(
          _defaultPrice,
          ParamType.double,
        ),
        'dayType': serializeParam(
          _dayType,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductMasterListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProductMasterListStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        cess: deserializeParam(
          data['cess'],
          ParamType.double,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        costPrice: deserializeParam(
          data['costPrice'],
          ParamType.double,
          false,
        ),
        dateTime: deserializeParam(
          data['dateTime'],
          ParamType.DateTime,
          false,
        ),
        discount: deserializeParam(
          data['discount'],
          ParamType.double,
          false,
        ),
        keyCount: deserializeParam(
          data['keyCount'],
          ParamType.int,
          false,
        ),
        kitchenId: deserializeParam(
          data['kitchenId'],
          ParamType.String,
          false,
        ),
        mrpPrice: deserializeParam(
          data['mrpPrice'],
          ParamType.double,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        onlinePrice: deserializeParam(
          data['onlinePrice'],
          ParamType.double,
          false,
        ),
        onlineSynced: deserializeParam(
          data['onlineSynced'],
          ParamType.bool,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        priceTable: deserializeParam(
          data['priceTable'],
          ParamType.String,
          false,
        ),
        recipeId: deserializeParam(
          data['recipeId'],
          ParamType.String,
          false,
        ),
        regionalName: deserializeParam(
          data['regionalName'],
          ParamType.String,
          false,
        ),
        reorderLevel: deserializeParam(
          data['reorderLevel'],
          ParamType.int,
          false,
        ),
        selected: deserializeParam(
          data['selected'],
          ParamType.bool,
          false,
        ),
        shortName: deserializeParam(
          data['shortName'],
          ParamType.String,
          false,
        ),
        stockable: deserializeParam(
          data['stockable'],
          ParamType.bool,
          false,
        ),
        taxIndex: deserializeParam(
          data['taxIndex'],
          ParamType.int,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.int,
          false,
        ),
        unitId: deserializeParam(
          data['unitId'],
          ParamType.int,
          false,
        ),
        currentStock: deserializeParam(
          data['currentStock'],
          ParamType.double,
          false,
        ),
        unitType: deserializeParam(
          data['unitType'],
          ParamType.String,
          false,
        ),
        categoryNo: deserializeParam(
          data['categoryNo'],
          ParamType.int,
          false,
        ),
        batchNo: deserializeParam(
          data['batchNo'],
          ParamType.int,
          false,
        ),
        hsnCode: deserializeParam(
          data['hsnCode'],
          ParamType.String,
          false,
        ),
        rooms: deserializeParam(
          data['rooms'],
          ParamType.bool,
          false,
        ),
        state: deserializeParam(
          data['state'],
          ParamType.int,
          false,
        ),
        viewType: deserializeParam(
          data['viewType'],
          ParamType.int,
          false,
        ),
        weightable: deserializeParam(
          data['weightable'],
          ParamType.String,
          false,
        ),
        defaultPrice: deserializeParam(
          data['defaultPrice'],
          ParamType.double,
          false,
        ),
        dayType: deserializeParam(
          data['dayType'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProductMasterListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductMasterListStruct &&
        id == other.id &&
        active == other.active &&
        category == other.category &&
        barcode == other.barcode &&
        cess == other.cess &&
        code == other.code &&
        costPrice == other.costPrice &&
        dateTime == other.dateTime &&
        discount == other.discount &&
        keyCount == other.keyCount &&
        kitchenId == other.kitchenId &&
        mrpPrice == other.mrpPrice &&
        name == other.name &&
        onlinePrice == other.onlinePrice &&
        onlineSynced == other.onlineSynced &&
        price == other.price &&
        priceTable == other.priceTable &&
        recipeId == other.recipeId &&
        regionalName == other.regionalName &&
        reorderLevel == other.reorderLevel &&
        selected == other.selected &&
        shortName == other.shortName &&
        stockable == other.stockable &&
        taxIndex == other.taxIndex &&
        type == other.type &&
        unitId == other.unitId &&
        currentStock == other.currentStock &&
        unitType == other.unitType &&
        categoryNo == other.categoryNo &&
        batchNo == other.batchNo &&
        hsnCode == other.hsnCode &&
        rooms == other.rooms &&
        state == other.state &&
        viewType == other.viewType &&
        weightable == other.weightable &&
        defaultPrice == other.defaultPrice &&
        dayType == other.dayType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        active,
        category,
        barcode,
        cess,
        code,
        costPrice,
        dateTime,
        discount,
        keyCount,
        kitchenId,
        mrpPrice,
        name,
        onlinePrice,
        onlineSynced,
        price,
        priceTable,
        recipeId,
        regionalName,
        reorderLevel,
        selected,
        shortName,
        stockable,
        taxIndex,
        type,
        unitId,
        currentStock,
        unitType,
        categoryNo,
        batchNo,
        hsnCode,
        rooms,
        state,
        viewType,
        weightable,
        defaultPrice,
        dayType
      ]);
}

ProductMasterListStruct createProductMasterListStruct({
  String? id,
  bool? active,
  String? category,
  String? barcode,
  double? cess,
  int? code,
  double? costPrice,
  DateTime? dateTime,
  double? discount,
  int? keyCount,
  String? kitchenId,
  double? mrpPrice,
  String? name,
  double? onlinePrice,
  bool? onlineSynced,
  double? price,
  String? priceTable,
  String? recipeId,
  String? regionalName,
  int? reorderLevel,
  bool? selected,
  String? shortName,
  bool? stockable,
  int? taxIndex,
  int? type,
  int? unitId,
  double? currentStock,
  String? unitType,
  int? categoryNo,
  int? batchNo,
  String? hsnCode,
  bool? rooms,
  int? state,
  int? viewType,
  String? weightable,
  double? defaultPrice,
  String? dayType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductMasterListStruct(
      id: id,
      active: active,
      category: category,
      barcode: barcode,
      cess: cess,
      code: code,
      costPrice: costPrice,
      dateTime: dateTime,
      discount: discount,
      keyCount: keyCount,
      kitchenId: kitchenId,
      mrpPrice: mrpPrice,
      name: name,
      onlinePrice: onlinePrice,
      onlineSynced: onlineSynced,
      price: price,
      priceTable: priceTable,
      recipeId: recipeId,
      regionalName: regionalName,
      reorderLevel: reorderLevel,
      selected: selected,
      shortName: shortName,
      stockable: stockable,
      taxIndex: taxIndex,
      type: type,
      unitId: unitId,
      currentStock: currentStock,
      unitType: unitType,
      categoryNo: categoryNo,
      batchNo: batchNo,
      hsnCode: hsnCode,
      rooms: rooms,
      state: state,
      viewType: viewType,
      weightable: weightable,
      defaultPrice: defaultPrice,
      dayType: dayType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductMasterListStruct? updateProductMasterListStruct(
  ProductMasterListStruct? productMasterList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productMasterList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductMasterListStructData(
  Map<String, dynamic> firestoreData,
  ProductMasterListStruct? productMasterList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productMasterList == null) {
    return;
  }
  if (productMasterList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productMasterList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productMasterListData =
      getProductMasterListFirestoreData(productMasterList, forFieldValue);
  final nestedData =
      productMasterListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productMasterList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductMasterListFirestoreData(
  ProductMasterListStruct? productMasterList, [
  bool forFieldValue = false,
]) {
  if (productMasterList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productMasterList.toMap());

  // Add any Firestore field values
  productMasterList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductMasterListListFirestoreData(
  List<ProductMasterListStruct>? productMasterLists,
) =>
    productMasterLists
        ?.map((e) => getProductMasterListFirestoreData(e, true))
        .toList() ??
    [];
