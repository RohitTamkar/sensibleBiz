import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _loggedInUser = prefs.getStringList('ff_loggedInUser')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _loggedInUser;
    });
    _safeInit(() {
      _currentMobile = prefs.getString('ff_currentMobile') ?? _currentMobile;
    });
    _safeInit(() {
      _outletId = prefs.getString('ff_outletId') ?? _outletId;
    });
    _safeInit(() {
      _outletRef = prefs.getString('ff_outletRef')?.ref ?? _outletRef;
    });
    _safeInit(() {
      _flagForMaster = prefs.getBool('ff_flagForMaster') ?? _flagForMaster;
    });
    _safeInit(() {
      _selectedShift = prefs.getString('ff_selectedShift') ?? _selectedShift;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_shiftDetail')) {
        try {
          _shiftDetail = jsonDecode(prefs.getString('ff_shiftDetail') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _currentUserId = prefs.getString('ff_currentUserId') ?? _currentUserId;
    });
    _safeInit(() {
      _currentUserRef =
          prefs.getString('ff_currentUserRef')?.ref ?? _currentUserRef;
    });
    _safeInit(() {
      _currentUserRole =
          prefs.getString('ff_currentUserRole') ?? _currentUserRole;
    });
    _safeInit(() {
      _outletName = prefs.getString('ff_outletName') ?? _outletName;
    });
    _safeInit(() {
      _deviceRef = prefs.getString('ff_deviceRef')?.ref ?? _deviceRef;
    });
    _safeInit(() {
      _loggedIn = prefs.getBool('ff_loggedIn') ?? _loggedIn;
    });
    _safeInit(() {
      _isShiftSelected =
          prefs.getBool('ff_isShiftSelected') ?? _isShiftSelected;
    });
    _safeInit(() {
      _nullOutlets = prefs.getStringList('ff_nullOutlets') ?? _nullOutlets;
    });
    _safeInit(() {
      _deactivate = prefs.getBool('ff_deactivate') ?? _deactivate;
    });
    _safeInit(() {
      _currentDay = prefs.getString('ff_currentDay') ?? _currentDay;
    });
    _safeInit(() {
      _endDay = prefs.getInt('ff_endDay') ?? _endDay;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_allBillsList')) {
        try {
          _allBillsList = jsonDecode(prefs.getString('ff_allBillsList') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _selBill = prefs.getInt('ff_selBill') ?? _selBill;
    });
    _safeInit(() {
      _shiftCount = prefs.getInt('ff_shiftCount') ?? _shiftCount;
    });
    _safeInit(() {
      _hide = prefs.getBool('ff_hide') ?? _hide;
    });
    _safeInit(() {
      _catCodeLength = prefs.getInt('ff_catCodeLength') ?? _catCodeLength;
    });
    _safeInit(() {
      _qrCodeResult = prefs.getString('ff_qrCodeResult') ?? _qrCodeResult;
    });
    _safeInit(() {
      _aShift = _colorFromIntValue(prefs.getInt('ff_aShift')) ?? _aShift;
    });
    _safeInit(() {
      _bShift = _colorFromIntValue(prefs.getInt('ff_bShift')) ?? _bShift;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_shiftList')) {
        try {
          _shiftList = jsonDecode(prefs.getString('ff_shiftList') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _setCategoryMasterName =
          prefs.getString('ff_setCategoryMasterName') ?? _setCategoryMasterName;
    });
    _safeInit(() {
      _selectCategoryMasterRef =
          prefs.getString('ff_selectCategoryMasterRef')?.ref ??
              _selectCategoryMasterRef;
    });
    _safeInit(() {
      _productCodeLength =
          prefs.getInt('ff_productCodeLength') ?? _productCodeLength;
    });
    _safeInit(() {
      _catcolor = prefs.getString('ff_catcolor') ?? _catcolor;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userAccessList')) {
        try {
          final serializedData = prefs.getString('ff_userAccessList') ?? '{}';
          _userAccessList =
              UserListStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _loggedInUser = [];
  List<dynamic> get loggedInUser => _loggedInUser;
  set loggedInUser(List<dynamic> value) {
    _loggedInUser = value;
    prefs.setStringList(
        'ff_loggedInUser', value.map((x) => jsonEncode(x)).toList());
  }

  void addToLoggedInUser(dynamic value) {
    loggedInUser.add(value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void removeFromLoggedInUser(dynamic value) {
    loggedInUser.remove(value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromLoggedInUser(int index) {
    loggedInUser.removeAt(index);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void updateLoggedInUserAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    loggedInUser[index] = updateFn(_loggedInUser[index]);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInLoggedInUser(int index, dynamic value) {
    loggedInUser.insert(index, value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  String _currentMobile = '';
  String get currentMobile => _currentMobile;
  set currentMobile(String value) {
    _currentMobile = value;
    prefs.setString('ff_currentMobile', value);
  }

  String _outletId = '';
  String get outletId => _outletId;
  set outletId(String value) {
    _outletId = value;
    prefs.setString('ff_outletId', value);
  }

  DocumentReference? _outletRef;
  DocumentReference? get outletRef => _outletRef;
  set outletRef(DocumentReference? value) {
    _outletRef = value;
    value != null
        ? prefs.setString('ff_outletRef', value.path)
        : prefs.remove('ff_outletRef');
  }

  bool _flagForMaster = false;
  bool get flagForMaster => _flagForMaster;
  set flagForMaster(bool value) {
    _flagForMaster = value;
    prefs.setBool('ff_flagForMaster', value);
  }

  String _selectedShift = '';
  String get selectedShift => _selectedShift;
  set selectedShift(String value) {
    _selectedShift = value;
    prefs.setString('ff_selectedShift', value);
  }

  dynamic _shiftDetail;
  dynamic get shiftDetail => _shiftDetail;
  set shiftDetail(dynamic value) {
    _shiftDetail = value;
    prefs.setString('ff_shiftDetail', jsonEncode(value));
  }

  String _currentUserId = '';
  String get currentUserId => _currentUserId;
  set currentUserId(String value) {
    _currentUserId = value;
    prefs.setString('ff_currentUserId', value);
  }

  DocumentReference? _currentUserRef;
  DocumentReference? get currentUserRef => _currentUserRef;
  set currentUserRef(DocumentReference? value) {
    _currentUserRef = value;
    value != null
        ? prefs.setString('ff_currentUserRef', value.path)
        : prefs.remove('ff_currentUserRef');
  }

  String _currentUserRole = '';
  String get currentUserRole => _currentUserRole;
  set currentUserRole(String value) {
    _currentUserRole = value;
    prefs.setString('ff_currentUserRole', value);
  }

  String _outletName = '';
  String get outletName => _outletName;
  set outletName(String value) {
    _outletName = value;
    prefs.setString('ff_outletName', value);
  }

  DocumentReference? _deviceRef;
  DocumentReference? get deviceRef => _deviceRef;
  set deviceRef(DocumentReference? value) {
    _deviceRef = value;
    value != null
        ? prefs.setString('ff_deviceRef', value.path)
        : prefs.remove('ff_deviceRef');
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  set loggedIn(bool value) {
    _loggedIn = value;
    prefs.setBool('ff_loggedIn', value);
  }

  bool _isShiftSelected = false;
  bool get isShiftSelected => _isShiftSelected;
  set isShiftSelected(bool value) {
    _isShiftSelected = value;
    prefs.setBool('ff_isShiftSelected', value);
  }

  List<String> _nullOutlets = [];
  List<String> get nullOutlets => _nullOutlets;
  set nullOutlets(List<String> value) {
    _nullOutlets = value;
    prefs.setStringList('ff_nullOutlets', value);
  }

  void addToNullOutlets(String value) {
    nullOutlets.add(value);
    prefs.setStringList('ff_nullOutlets', _nullOutlets);
  }

  void removeFromNullOutlets(String value) {
    nullOutlets.remove(value);
    prefs.setStringList('ff_nullOutlets', _nullOutlets);
  }

  void removeAtIndexFromNullOutlets(int index) {
    nullOutlets.removeAt(index);
    prefs.setStringList('ff_nullOutlets', _nullOutlets);
  }

  void updateNullOutletsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    nullOutlets[index] = updateFn(_nullOutlets[index]);
    prefs.setStringList('ff_nullOutlets', _nullOutlets);
  }

  void insertAtIndexInNullOutlets(int index, String value) {
    nullOutlets.insert(index, value);
    prefs.setStringList('ff_nullOutlets', _nullOutlets);
  }

  bool _deactivate = false;
  bool get deactivate => _deactivate;
  set deactivate(bool value) {
    _deactivate = value;
    prefs.setBool('ff_deactivate', value);
  }

  String _currentDay = '';
  String get currentDay => _currentDay;
  set currentDay(String value) {
    _currentDay = value;
    prefs.setString('ff_currentDay', value);
  }

  int _endDay = 0;
  int get endDay => _endDay;
  set endDay(int value) {
    _endDay = value;
    prefs.setInt('ff_endDay', value);
  }

  DateTime? _setDay;
  DateTime? get setDay => _setDay;
  set setDay(DateTime? value) {
    _setDay = value;
  }

  DateTime? _expDay;
  DateTime? get expDay => _expDay;
  set expDay(DateTime? value) {
    _expDay = value;
  }

  String _selectedOutlet = '';
  String get selectedOutlet => _selectedOutlet;
  set selectedOutlet(String value) {
    _selectedOutlet = value;
  }

  DocumentReference? _selectedOutletFromStock;
  DocumentReference? get selectedOutletFromStock => _selectedOutletFromStock;
  set selectedOutletFromStock(DocumentReference? value) {
    _selectedOutletFromStock = value;
  }

  List<dynamic> _productCart = [];
  List<dynamic> get productCart => _productCart;
  set productCart(List<dynamic> value) {
    _productCart = value;
  }

  void addToProductCart(dynamic value) {
    productCart.add(value);
  }

  void removeFromProductCart(dynamic value) {
    productCart.remove(value);
  }

  void removeAtIndexFromProductCart(int index) {
    productCart.removeAt(index);
  }

  void updateProductCartAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    productCart[index] = updateFn(_productCart[index]);
  }

  void insertAtIndexInProductCart(int index, dynamic value) {
    productCart.insert(index, value);
  }

  String _selectedProduct = '';
  String get selectedProduct => _selectedProduct;
  set selectedProduct(String value) {
    _selectedProduct = value;
  }

  double _stock = 0.0;
  double get stock => _stock;
  set stock(double value) {
    _stock = value;
  }

  String _stockType = '';
  String get stockType => _stockType;
  set stockType(String value) {
    _stockType = value;
  }

  List<dynamic> _selectedProductList = [];
  List<dynamic> get selectedProductList => _selectedProductList;
  set selectedProductList(List<dynamic> value) {
    _selectedProductList = value;
  }

  void addToSelectedProductList(dynamic value) {
    selectedProductList.add(value);
  }

  void removeFromSelectedProductList(dynamic value) {
    selectedProductList.remove(value);
  }

  void removeAtIndexFromSelectedProductList(int index) {
    selectedProductList.removeAt(index);
  }

  void updateSelectedProductListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    selectedProductList[index] = updateFn(_selectedProductList[index]);
  }

  void insertAtIndexInSelectedProductList(int index, dynamic value) {
    selectedProductList.insert(index, value);
  }

  List<ProductListStruct> _selectedPrdDataMap = [];
  List<ProductListStruct> get selectedPrdDataMap => _selectedPrdDataMap;
  set selectedPrdDataMap(List<ProductListStruct> value) {
    _selectedPrdDataMap = value;
  }

  void addToSelectedPrdDataMap(ProductListStruct value) {
    selectedPrdDataMap.add(value);
  }

  void removeFromSelectedPrdDataMap(ProductListStruct value) {
    selectedPrdDataMap.remove(value);
  }

  void removeAtIndexFromSelectedPrdDataMap(int index) {
    selectedPrdDataMap.removeAt(index);
  }

  void updateSelectedPrdDataMapAtIndex(
    int index,
    ProductListStruct Function(ProductListStruct) updateFn,
  ) {
    selectedPrdDataMap[index] = updateFn(_selectedPrdDataMap[index]);
  }

  void insertAtIndexInSelectedPrdDataMap(int index, ProductListStruct value) {
    selectedPrdDataMap.insert(index, value);
  }

  dynamic _allBillsList;
  dynamic get allBillsList => _allBillsList;
  set allBillsList(dynamic value) {
    _allBillsList = value;
    prefs.setString('ff_allBillsList', jsonEncode(value));
  }

  int _selBill = 0;
  int get selBill => _selBill;
  set selBill(int value) {
    _selBill = value;
    prefs.setInt('ff_selBill', value);
  }

  int _count = 0;
  int get count => _count;
  set count(int value) {
    _count = value;
  }

  int _shiftCount = 1;
  int get shiftCount => _shiftCount;
  set shiftCount(int value) {
    _shiftCount = value;
    prefs.setInt('ff_shiftCount', value);
  }

  bool _hide = false;
  bool get hide => _hide;
  set hide(bool value) {
    _hide = value;
    prefs.setBool('ff_hide', value);
  }

  String _selectedDate = '';
  String get selectedDate => _selectedDate;
  set selectedDate(String value) {
    _selectedDate = value;
  }

  dynamic _productSaleJson = jsonDecode('null');
  dynamic get productSaleJson => _productSaleJson;
  set productSaleJson(dynamic value) {
    _productSaleJson = value;
  }

  bool _isLoding = false;
  bool get isLoding => _isLoding;
  set isLoding(bool value) {
    _isLoding = value;
  }

  dynamic _catSaleJson;
  dynamic get catSaleJson => _catSaleJson;
  set catSaleJson(dynamic value) {
    _catSaleJson = value;
  }

  int _catCodeLength = 1;
  int get catCodeLength => _catCodeLength;
  set catCodeLength(int value) {
    _catCodeLength = value;
    prefs.setInt('ff_catCodeLength', value);
  }

  String _qrCodeResult = '';
  String get qrCodeResult => _qrCodeResult;
  set qrCodeResult(String value) {
    _qrCodeResult = value;
    prefs.setString('ff_qrCodeResult', value);
  }

  String _synchTime = '';
  String get synchTime => _synchTime;
  set synchTime(String value) {
    _synchTime = value;
  }

  Color _aShift = Color(4290117658);
  Color get aShift => _aShift;
  set aShift(Color value) {
    _aShift = value;
    prefs.setInt('ff_aShift', value.value);
  }

  Color _bShift = Color(4294761484);
  Color get bShift => _bShift;
  set bShift(Color value) {
    _bShift = value;
    prefs.setInt('ff_bShift', value.value);
  }

  int _shiftChose = 0;
  int get shiftChose => _shiftChose;
  set shiftChose(int value) {
    _shiftChose = value;
  }

  dynamic _shiftList;
  dynamic get shiftList => _shiftList;
  set shiftList(dynamic value) {
    _shiftList = value;
    prefs.setString('ff_shiftList', jsonEncode(value));
  }

  bool _noShift = false;
  bool get noShift => _noShift;
  set noShift(bool value) {
    _noShift = value;
  }

  List<dynamic> _shiftDetailsList = [];
  List<dynamic> get shiftDetailsList => _shiftDetailsList;
  set shiftDetailsList(List<dynamic> value) {
    _shiftDetailsList = value;
  }

  void addToShiftDetailsList(dynamic value) {
    shiftDetailsList.add(value);
  }

  void removeFromShiftDetailsList(dynamic value) {
    shiftDetailsList.remove(value);
  }

  void removeAtIndexFromShiftDetailsList(int index) {
    shiftDetailsList.removeAt(index);
  }

  void updateShiftDetailsListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    shiftDetailsList[index] = updateFn(_shiftDetailsList[index]);
  }

  void insertAtIndexInShiftDetailsList(int index, dynamic value) {
    shiftDetailsList.insert(index, value);
  }

  List<dynamic> _reportDetails = [];
  List<dynamic> get reportDetails => _reportDetails;
  set reportDetails(List<dynamic> value) {
    _reportDetails = value;
  }

  void addToReportDetails(dynamic value) {
    reportDetails.add(value);
  }

  void removeFromReportDetails(dynamic value) {
    reportDetails.remove(value);
  }

  void removeAtIndexFromReportDetails(int index) {
    reportDetails.removeAt(index);
  }

  void updateReportDetailsAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    reportDetails[index] = updateFn(_reportDetails[index]);
  }

  void insertAtIndexInReportDetails(int index, dynamic value) {
    reportDetails.insert(index, value);
  }

  int _iLoopStart = 0;
  int get iLoopStart => _iLoopStart;
  set iLoopStart(int value) {
    _iLoopStart = value;
  }

  int _jLoopStart = 0;
  int get jLoopStart => _jLoopStart;
  set jLoopStart(int value) {
    _jLoopStart = value;
  }

  int _iLoopEnd = 0;
  int get iLoopEnd => _iLoopEnd;
  set iLoopEnd(int value) {
    _iLoopEnd = value;
  }

  int _jLoopEnd = 0;
  int get jLoopEnd => _jLoopEnd;
  set jLoopEnd(int value) {
    _jLoopEnd = value;
  }

  List<dynamic> _categoryCart = [];
  List<dynamic> get categoryCart => _categoryCart;
  set categoryCart(List<dynamic> value) {
    _categoryCart = value;
  }

  void addToCategoryCart(dynamic value) {
    categoryCart.add(value);
  }

  void removeFromCategoryCart(dynamic value) {
    categoryCart.remove(value);
  }

  void removeAtIndexFromCategoryCart(int index) {
    categoryCart.removeAt(index);
  }

  void updateCategoryCartAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    categoryCart[index] = updateFn(_categoryCart[index]);
  }

  void insertAtIndexInCategoryCart(int index, dynamic value) {
    categoryCart.insert(index, value);
  }

  List<dynamic> _finalCategoryReport = [];
  List<dynamic> get finalCategoryReport => _finalCategoryReport;
  set finalCategoryReport(List<dynamic> value) {
    _finalCategoryReport = value;
  }

  void addToFinalCategoryReport(dynamic value) {
    finalCategoryReport.add(value);
  }

  void removeFromFinalCategoryReport(dynamic value) {
    finalCategoryReport.remove(value);
  }

  void removeAtIndexFromFinalCategoryReport(int index) {
    finalCategoryReport.removeAt(index);
  }

  void updateFinalCategoryReportAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    finalCategoryReport[index] = updateFn(_finalCategoryReport[index]);
  }

  void insertAtIndexInFinalCategoryReport(int index, dynamic value) {
    finalCategoryReport.insert(index, value);
  }

  String _setCategoryMasterName = '';
  String get setCategoryMasterName => _setCategoryMasterName;
  set setCategoryMasterName(String value) {
    _setCategoryMasterName = value;
    prefs.setString('ff_setCategoryMasterName', value);
  }

  DocumentReference? _selectCategoryMasterRef;
  DocumentReference? get selectCategoryMasterRef => _selectCategoryMasterRef;
  set selectCategoryMasterRef(DocumentReference? value) {
    _selectCategoryMasterRef = value;
    value != null
        ? prefs.setString('ff_selectCategoryMasterRef', value.path)
        : prefs.remove('ff_selectCategoryMasterRef');
  }

  List<ProductMasterListStruct> _readProductlist = [];
  List<ProductMasterListStruct> get readProductlist => _readProductlist;
  set readProductlist(List<ProductMasterListStruct> value) {
    _readProductlist = value;
  }

  void addToReadProductlist(ProductMasterListStruct value) {
    readProductlist.add(value);
  }

  void removeFromReadProductlist(ProductMasterListStruct value) {
    readProductlist.remove(value);
  }

  void removeAtIndexFromReadProductlist(int index) {
    readProductlist.removeAt(index);
  }

  void updateReadProductlistAtIndex(
    int index,
    ProductMasterListStruct Function(ProductMasterListStruct) updateFn,
  ) {
    readProductlist[index] = updateFn(_readProductlist[index]);
  }

  void insertAtIndexInReadProductlist(
      int index, ProductMasterListStruct value) {
    readProductlist.insert(index, value);
  }

  int _startLoop = 0;
  int get startLoop => _startLoop;
  set startLoop(int value) {
    _startLoop = value;
  }

  int _endLoop = 0;
  int get endLoop => _endLoop;
  set endLoop(int value) {
    _endLoop = value;
  }

  int _unitId = 0;
  int get unitId => _unitId;
  set unitId(int value) {
    _unitId = value;
  }

  int _productCodeLength = 0;
  int get productCodeLength => _productCodeLength;
  set productCodeLength(int value) {
    _productCodeLength = value;
    prefs.setInt('ff_productCodeLength', value);
  }

  int _iterator = 0;
  int get iterator => _iterator;
  set iterator(int value) {
    _iterator = value;
  }

  double _loopExcelDouble = 0.0;
  double get loopExcelDouble => _loopExcelDouble;
  set loopExcelDouble(double value) {
    _loopExcelDouble = value;
  }

  int _countExcel = 0;
  int get countExcel => _countExcel;
  set countExcel(int value) {
    _countExcel = value;
  }

  int _loopStart = 0;
  int get loopStart => _loopStart;
  set loopStart(int value) {
    _loopStart = value;
  }

  bool _showMenuProduct = false;
  bool get showMenuProduct => _showMenuProduct;
  set showMenuProduct(bool value) {
    _showMenuProduct = value;
  }

  bool _test = false;
  bool get test => _test;
  set test(bool value) {
    _test = value;
  }

  List<ProductListStruct> _testlist = [];
  List<ProductListStruct> get testlist => _testlist;
  set testlist(List<ProductListStruct> value) {
    _testlist = value;
  }

  void addToTestlist(ProductListStruct value) {
    testlist.add(value);
  }

  void removeFromTestlist(ProductListStruct value) {
    testlist.remove(value);
  }

  void removeAtIndexFromTestlist(int index) {
    testlist.removeAt(index);
  }

  void updateTestlistAtIndex(
    int index,
    ProductListStruct Function(ProductListStruct) updateFn,
  ) {
    testlist[index] = updateFn(_testlist[index]);
  }

  void insertAtIndexInTestlist(int index, ProductListStruct value) {
    testlist.insert(index, value);
  }

  List<dynamic> _listprd = [];
  List<dynamic> get listprd => _listprd;
  set listprd(List<dynamic> value) {
    _listprd = value;
  }

  void addToListprd(dynamic value) {
    listprd.add(value);
  }

  void removeFromListprd(dynamic value) {
    listprd.remove(value);
  }

  void removeAtIndexFromListprd(int index) {
    listprd.removeAt(index);
  }

  void updateListprdAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    listprd[index] = updateFn(_listprd[index]);
  }

  void insertAtIndexInListprd(int index, dynamic value) {
    listprd.insert(index, value);
  }

  List<dynamic> _productListSTockableUpdate = [];
  List<dynamic> get productListSTockableUpdate => _productListSTockableUpdate;
  set productListSTockableUpdate(List<dynamic> value) {
    _productListSTockableUpdate = value;
  }

  void addToProductListSTockableUpdate(dynamic value) {
    productListSTockableUpdate.add(value);
  }

  void removeFromProductListSTockableUpdate(dynamic value) {
    productListSTockableUpdate.remove(value);
  }

  void removeAtIndexFromProductListSTockableUpdate(int index) {
    productListSTockableUpdate.removeAt(index);
  }

  void updateProductListSTockableUpdateAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    productListSTockableUpdate[index] =
        updateFn(_productListSTockableUpdate[index]);
  }

  void insertAtIndexInProductListSTockableUpdate(int index, dynamic value) {
    productListSTockableUpdate.insert(index, value);
  }

  bool _isPresentBoolean = false;
  bool get isPresentBoolean => _isPresentBoolean;
  set isPresentBoolean(bool value) {
    _isPresentBoolean = value;
  }

  int _taxIndexSTate = 0;
  int get taxIndexSTate => _taxIndexSTate;
  set taxIndexSTate(int value) {
    _taxIndexSTate = value;
  }

  String _catcolor = '';
  String get catcolor => _catcolor;
  set catcolor(String value) {
    _catcolor = value;
    prefs.setString('ff_catcolor', value);
  }

  List<dynamic> _prdJsonList = [];
  List<dynamic> get prdJsonList => _prdJsonList;
  set prdJsonList(List<dynamic> value) {
    _prdJsonList = value;
  }

  void addToPrdJsonList(dynamic value) {
    prdJsonList.add(value);
  }

  void removeFromPrdJsonList(dynamic value) {
    prdJsonList.remove(value);
  }

  void removeAtIndexFromPrdJsonList(int index) {
    prdJsonList.removeAt(index);
  }

  void updatePrdJsonListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    prdJsonList[index] = updateFn(_prdJsonList[index]);
  }

  void insertAtIndexInPrdJsonList(int index, dynamic value) {
    prdJsonList.insert(index, value);
  }

  bool _sortMenuBool = false;
  bool get sortMenuBool => _sortMenuBool;
  set sortMenuBool(bool value) {
    _sortMenuBool = value;
  }

  String _sortProductString = '';
  String get sortProductString => _sortProductString;
  set sortProductString(String value) {
    _sortProductString = value;
  }

  List<ProductListStruct> _allProductdoc = [];
  List<ProductListStruct> get allProductdoc => _allProductdoc;
  set allProductdoc(List<ProductListStruct> value) {
    _allProductdoc = value;
  }

  void addToAllProductdoc(ProductListStruct value) {
    allProductdoc.add(value);
  }

  void removeFromAllProductdoc(ProductListStruct value) {
    allProductdoc.remove(value);
  }

  void removeAtIndexFromAllProductdoc(int index) {
    allProductdoc.removeAt(index);
  }

  void updateAllProductdocAtIndex(
    int index,
    ProductListStruct Function(ProductListStruct) updateFn,
  ) {
    allProductdoc[index] = updateFn(_allProductdoc[index]);
  }

  void insertAtIndexInAllProductdoc(int index, ProductListStruct value) {
    allProductdoc.insert(index, value);
  }

  String _passcode = '';
  String get passcode => _passcode;
  set passcode(String value) {
    _passcode = value;
  }

  bool _flag = false;
  bool get flag => _flag;
  set flag(bool value) {
    _flag = value;
  }

  String _emailId = '';
  String get emailId => _emailId;
  set emailId(String value) {
    _emailId = value;
  }

  String _outletBranch = '';
  String get outletBranch => _outletBranch;
  set outletBranch(String value) {
    _outletBranch = value;
  }

  String _categoryId = '';
  String get categoryId => _categoryId;
  set categoryId(String value) {
    _categoryId = value;
  }

  bool _falg2 = false;
  bool get falg2 => _falg2;
  set falg2(bool value) {
    _falg2 = value;
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? value) {
    _startDate = value;
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? value) {
    _endDate = value;
  }

  double _totalTaxAmount = 0.0;
  double get totalTaxAmount => _totalTaxAmount;
  set totalTaxAmount(double value) {
    _totalTaxAmount = value;
  }

  double _totalProductSaleAmount = 0.0;
  double get totalProductSaleAmount => _totalProductSaleAmount;
  set totalProductSaleAmount(double value) {
    _totalProductSaleAmount = value;
  }

  dynamic _gstJsonObj;
  dynamic get gstJsonObj => _gstJsonObj;
  set gstJsonObj(dynamic value) {
    _gstJsonObj = value;
  }

  double _priceTotal = 0.0;
  double get priceTotal => _priceTotal;
  set priceTotal(double value) {
    _priceTotal = value;
  }

  double _taxAmtTotal = 0.0;
  double get taxAmtTotal => _taxAmtTotal;
  set taxAmtTotal(double value) {
    _taxAmtTotal = value;
  }

  double _qtyTotal = 0.0;
  double get qtyTotal => _qtyTotal;
  set qtyTotal(double value) {
    _qtyTotal = value;
  }

  List<dynamic> _updatedPriceTable = [];
  List<dynamic> get updatedPriceTable => _updatedPriceTable;
  set updatedPriceTable(List<dynamic> value) {
    _updatedPriceTable = value;
  }

  void addToUpdatedPriceTable(dynamic value) {
    updatedPriceTable.add(value);
  }

  void removeFromUpdatedPriceTable(dynamic value) {
    updatedPriceTable.remove(value);
  }

  void removeAtIndexFromUpdatedPriceTable(int index) {
    updatedPriceTable.removeAt(index);
  }

  void updateUpdatedPriceTableAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    updatedPriceTable[index] = updateFn(_updatedPriceTable[index]);
  }

  void insertAtIndexInUpdatedPriceTable(int index, dynamic value) {
    updatedPriceTable.insert(index, value);
  }

  List<dynamic> _productJsonList = [];
  List<dynamic> get productJsonList => _productJsonList;
  set productJsonList(List<dynamic> value) {
    _productJsonList = value;
  }

  void addToProductJsonList(dynamic value) {
    productJsonList.add(value);
  }

  void removeFromProductJsonList(dynamic value) {
    productJsonList.remove(value);
  }

  void removeAtIndexFromProductJsonList(int index) {
    productJsonList.removeAt(index);
  }

  void updateProductJsonListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    productJsonList[index] = updateFn(_productJsonList[index]);
  }

  void insertAtIndexInProductJsonList(int index, dynamic value) {
    productJsonList.insert(index, value);
  }

  List<String> _premisesUpdateCheckboxList = [];
  List<String> get premisesUpdateCheckboxList => _premisesUpdateCheckboxList;
  set premisesUpdateCheckboxList(List<String> value) {
    _premisesUpdateCheckboxList = value;
  }

  void addToPremisesUpdateCheckboxList(String value) {
    premisesUpdateCheckboxList.add(value);
  }

  void removeFromPremisesUpdateCheckboxList(String value) {
    premisesUpdateCheckboxList.remove(value);
  }

  void removeAtIndexFromPremisesUpdateCheckboxList(int index) {
    premisesUpdateCheckboxList.removeAt(index);
  }

  void updatePremisesUpdateCheckboxListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    premisesUpdateCheckboxList[index] =
        updateFn(_premisesUpdateCheckboxList[index]);
  }

  void insertAtIndexInPremisesUpdateCheckboxList(int index, String value) {
    premisesUpdateCheckboxList.insert(index, value);
  }

  UserListStruct _userAccessList = UserListStruct();
  UserListStruct get userAccessList => _userAccessList;
  set userAccessList(UserListStruct value) {
    _userAccessList = value;
    prefs.setString('ff_userAccessList', value.serialize());
  }

  void updateUserAccessListStruct(Function(UserListStruct) updateFn) {
    updateFn(_userAccessList);
    prefs.setString('ff_userAccessList', _userAccessList.serialize());
  }

  List<BillSaleSummeryDataTypeStruct> _billSaleStructState = [];
  List<BillSaleSummeryDataTypeStruct> get billSaleStructState =>
      _billSaleStructState;
  set billSaleStructState(List<BillSaleSummeryDataTypeStruct> value) {
    _billSaleStructState = value;
  }

  void addToBillSaleStructState(BillSaleSummeryDataTypeStruct value) {
    billSaleStructState.add(value);
  }

  void removeFromBillSaleStructState(BillSaleSummeryDataTypeStruct value) {
    billSaleStructState.remove(value);
  }

  void removeAtIndexFromBillSaleStructState(int index) {
    billSaleStructState.removeAt(index);
  }

  void updateBillSaleStructStateAtIndex(
    int index,
    BillSaleSummeryDataTypeStruct Function(BillSaleSummeryDataTypeStruct)
        updateFn,
  ) {
    billSaleStructState[index] = updateFn(_billSaleStructState[index]);
  }

  void insertAtIndexInBillSaleStructState(
      int index, BillSaleSummeryDataTypeStruct value) {
    billSaleStructState.insert(index, value);
  }

  int _billStartLoop = 0;
  int get billStartLoop => _billStartLoop;
  set billStartLoop(int value) {
    _billStartLoop = value;
  }

  String _selectedLastDate = '';
  String get selectedLastDate => _selectedLastDate;
  set selectedLastDate(String value) {
    _selectedLastDate = value;
  }

  String _selectedStartDate = '';
  String get selectedStartDate => _selectedStartDate;
  set selectedStartDate(String value) {
    _selectedStartDate = value;
  }

  int _sStartDate = 0;
  int get sStartDate => _sStartDate;
  set sStartDate(int value) {
    _sStartDate = value;
  }

  int _sEndDate = 0;
  int get sEndDate => _sEndDate;
  set sEndDate(int value) {
    _sEndDate = value;
  }

  double _priceCompState = 0.0;
  double get priceCompState => _priceCompState;
  set priceCompState(double value) {
    _priceCompState = value;
  }

  double _qtyCompState = 0.0;
  double get qtyCompState => _qtyCompState;
  set qtyCompState(double value) {
    _qtyCompState = value;
  }

  List<BillSaleItemDTStruct> _EBProductList = [];
  List<BillSaleItemDTStruct> get EBProductList => _EBProductList;
  set EBProductList(List<BillSaleItemDTStruct> value) {
    _EBProductList = value;
  }

  void addToEBProductList(BillSaleItemDTStruct value) {
    EBProductList.add(value);
  }

  void removeFromEBProductList(BillSaleItemDTStruct value) {
    EBProductList.remove(value);
  }

  void removeAtIndexFromEBProductList(int index) {
    EBProductList.removeAt(index);
  }

  void updateEBProductListAtIndex(
    int index,
    BillSaleItemDTStruct Function(BillSaleItemDTStruct) updateFn,
  ) {
    EBProductList[index] = updateFn(_EBProductList[index]);
  }

  void insertAtIndexInEBProductList(int index, BillSaleItemDTStruct value) {
    EBProductList.insert(index, value);
  }

  List<String> _productSaleStringList = [];
  List<String> get productSaleStringList => _productSaleStringList;
  set productSaleStringList(List<String> value) {
    _productSaleStringList = value;
  }

  void addToProductSaleStringList(String value) {
    productSaleStringList.add(value);
  }

  void removeFromProductSaleStringList(String value) {
    productSaleStringList.remove(value);
  }

  void removeAtIndexFromProductSaleStringList(int index) {
    productSaleStringList.removeAt(index);
  }

  void updateProductSaleStringListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    productSaleStringList[index] = updateFn(_productSaleStringList[index]);
  }

  void insertAtIndexInProductSaleStringList(int index, String value) {
    productSaleStringList.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
