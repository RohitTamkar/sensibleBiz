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
  set loggedInUser(List<dynamic> _value) {
    _loggedInUser = _value;
    prefs.setStringList(
        'ff_loggedInUser', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToLoggedInUser(dynamic _value) {
    _loggedInUser.add(_value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void removeFromLoggedInUser(dynamic _value) {
    _loggedInUser.remove(_value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromLoggedInUser(int _index) {
    _loggedInUser.removeAt(_index);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void updateLoggedInUserAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _loggedInUser[_index] = updateFn(_loggedInUser[_index]);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInLoggedInUser(int _index, dynamic _value) {
    _loggedInUser.insert(_index, _value);
    prefs.setStringList(
        'ff_loggedInUser', _loggedInUser.map((x) => jsonEncode(x)).toList());
  }

  String _currentMobile = '';
  String get currentMobile => _currentMobile;
  set currentMobile(String _value) {
    _currentMobile = _value;
    prefs.setString('ff_currentMobile', _value);
  }

  String _outletId = '';
  String get outletId => _outletId;
  set outletId(String _value) {
    _outletId = _value;
    prefs.setString('ff_outletId', _value);
  }

  DocumentReference? _outletRef;
  DocumentReference? get outletRef => _outletRef;
  set outletRef(DocumentReference? _value) {
    _outletRef = _value;
    _value != null
        ? prefs.setString('ff_outletRef', _value.path)
        : prefs.remove('ff_outletRef');
  }

  bool _flagForMaster = false;
  bool get flagForMaster => _flagForMaster;
  set flagForMaster(bool _value) {
    _flagForMaster = _value;
    prefs.setBool('ff_flagForMaster', _value);
  }

  String _selectedShift = '';
  String get selectedShift => _selectedShift;
  set selectedShift(String _value) {
    _selectedShift = _value;
    prefs.setString('ff_selectedShift', _value);
  }

  dynamic _shiftDetail;
  dynamic get shiftDetail => _shiftDetail;
  set shiftDetail(dynamic _value) {
    _shiftDetail = _value;
    prefs.setString('ff_shiftDetail', jsonEncode(_value));
  }

  String _currentUserId = '';
  String get currentUserId => _currentUserId;
  set currentUserId(String _value) {
    _currentUserId = _value;
    prefs.setString('ff_currentUserId', _value);
  }

  DocumentReference? _currentUserRef;
  DocumentReference? get currentUserRef => _currentUserRef;
  set currentUserRef(DocumentReference? _value) {
    _currentUserRef = _value;
    _value != null
        ? prefs.setString('ff_currentUserRef', _value.path)
        : prefs.remove('ff_currentUserRef');
  }

  String _currentUserRole = '';
  String get currentUserRole => _currentUserRole;
  set currentUserRole(String _value) {
    _currentUserRole = _value;
    prefs.setString('ff_currentUserRole', _value);
  }

  String _outletName = '';
  String get outletName => _outletName;
  set outletName(String _value) {
    _outletName = _value;
    prefs.setString('ff_outletName', _value);
  }

  DocumentReference? _deviceRef;
  DocumentReference? get deviceRef => _deviceRef;
  set deviceRef(DocumentReference? _value) {
    _deviceRef = _value;
    _value != null
        ? prefs.setString('ff_deviceRef', _value.path)
        : prefs.remove('ff_deviceRef');
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  set loggedIn(bool _value) {
    _loggedIn = _value;
    prefs.setBool('ff_loggedIn', _value);
  }

  bool _isShiftSelected = false;
  bool get isShiftSelected => _isShiftSelected;
  set isShiftSelected(bool _value) {
    _isShiftSelected = _value;
    prefs.setBool('ff_isShiftSelected', _value);
  }

  List<String> _nullOutlets = [];
  List<String> get nullOutlets => _nullOutlets;
  set nullOutlets(List<String> _value) {
    _nullOutlets = _value;
    prefs.setStringList('ff_nullOutlets', _value);
  }

  void addToNullOutlets(String _value) {
    _nullOutlets.add(_value);
    prefs.setStringList('ff_nullOutlets', _nullOutlets);
  }

  void removeFromNullOutlets(String _value) {
    _nullOutlets.remove(_value);
    prefs.setStringList('ff_nullOutlets', _nullOutlets);
  }

  void removeAtIndexFromNullOutlets(int _index) {
    _nullOutlets.removeAt(_index);
    prefs.setStringList('ff_nullOutlets', _nullOutlets);
  }

  void updateNullOutletsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _nullOutlets[_index] = updateFn(_nullOutlets[_index]);
    prefs.setStringList('ff_nullOutlets', _nullOutlets);
  }

  void insertAtIndexInNullOutlets(int _index, String _value) {
    _nullOutlets.insert(_index, _value);
    prefs.setStringList('ff_nullOutlets', _nullOutlets);
  }

  bool _deactivate = false;
  bool get deactivate => _deactivate;
  set deactivate(bool _value) {
    _deactivate = _value;
    prefs.setBool('ff_deactivate', _value);
  }

  String _currentDay = '';
  String get currentDay => _currentDay;
  set currentDay(String _value) {
    _currentDay = _value;
    prefs.setString('ff_currentDay', _value);
  }

  int _endDay = 0;
  int get endDay => _endDay;
  set endDay(int _value) {
    _endDay = _value;
    prefs.setInt('ff_endDay', _value);
  }

  DateTime? _setDay;
  DateTime? get setDay => _setDay;
  set setDay(DateTime? _value) {
    _setDay = _value;
  }

  DateTime? _expDay;
  DateTime? get expDay => _expDay;
  set expDay(DateTime? _value) {
    _expDay = _value;
  }

  String _selectedOutlet = '';
  String get selectedOutlet => _selectedOutlet;
  set selectedOutlet(String _value) {
    _selectedOutlet = _value;
  }

  DocumentReference? _selectedOutletFromStock;
  DocumentReference? get selectedOutletFromStock => _selectedOutletFromStock;
  set selectedOutletFromStock(DocumentReference? _value) {
    _selectedOutletFromStock = _value;
  }

  List<dynamic> _productCart = [];
  List<dynamic> get productCart => _productCart;
  set productCart(List<dynamic> _value) {
    _productCart = _value;
  }

  void addToProductCart(dynamic _value) {
    _productCart.add(_value);
  }

  void removeFromProductCart(dynamic _value) {
    _productCart.remove(_value);
  }

  void removeAtIndexFromProductCart(int _index) {
    _productCart.removeAt(_index);
  }

  void updateProductCartAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _productCart[_index] = updateFn(_productCart[_index]);
  }

  void insertAtIndexInProductCart(int _index, dynamic _value) {
    _productCart.insert(_index, _value);
  }

  String _selectedProduct = '';
  String get selectedProduct => _selectedProduct;
  set selectedProduct(String _value) {
    _selectedProduct = _value;
  }

  double _stock = 0.0;
  double get stock => _stock;
  set stock(double _value) {
    _stock = _value;
  }

  String _stockType = '';
  String get stockType => _stockType;
  set stockType(String _value) {
    _stockType = _value;
  }

  List<dynamic> _selectedProductList = [];
  List<dynamic> get selectedProductList => _selectedProductList;
  set selectedProductList(List<dynamic> _value) {
    _selectedProductList = _value;
  }

  void addToSelectedProductList(dynamic _value) {
    _selectedProductList.add(_value);
  }

  void removeFromSelectedProductList(dynamic _value) {
    _selectedProductList.remove(_value);
  }

  void removeAtIndexFromSelectedProductList(int _index) {
    _selectedProductList.removeAt(_index);
  }

  void updateSelectedProductListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _selectedProductList[_index] = updateFn(_selectedProductList[_index]);
  }

  void insertAtIndexInSelectedProductList(int _index, dynamic _value) {
    _selectedProductList.insert(_index, _value);
  }

  List<ProductListStruct> _selectedPrdDataMap = [];
  List<ProductListStruct> get selectedPrdDataMap => _selectedPrdDataMap;
  set selectedPrdDataMap(List<ProductListStruct> _value) {
    _selectedPrdDataMap = _value;
  }

  void addToSelectedPrdDataMap(ProductListStruct _value) {
    _selectedPrdDataMap.add(_value);
  }

  void removeFromSelectedPrdDataMap(ProductListStruct _value) {
    _selectedPrdDataMap.remove(_value);
  }

  void removeAtIndexFromSelectedPrdDataMap(int _index) {
    _selectedPrdDataMap.removeAt(_index);
  }

  void updateSelectedPrdDataMapAtIndex(
    int _index,
    ProductListStruct Function(ProductListStruct) updateFn,
  ) {
    _selectedPrdDataMap[_index] = updateFn(_selectedPrdDataMap[_index]);
  }

  void insertAtIndexInSelectedPrdDataMap(int _index, ProductListStruct _value) {
    _selectedPrdDataMap.insert(_index, _value);
  }

  dynamic _allBillsList;
  dynamic get allBillsList => _allBillsList;
  set allBillsList(dynamic _value) {
    _allBillsList = _value;
    prefs.setString('ff_allBillsList', jsonEncode(_value));
  }

  int _selBill = 0;
  int get selBill => _selBill;
  set selBill(int _value) {
    _selBill = _value;
    prefs.setInt('ff_selBill', _value);
  }

  int _count = 0;
  int get count => _count;
  set count(int _value) {
    _count = _value;
  }

  int _shiftCount = 1;
  int get shiftCount => _shiftCount;
  set shiftCount(int _value) {
    _shiftCount = _value;
    prefs.setInt('ff_shiftCount', _value);
  }

  bool _hide = false;
  bool get hide => _hide;
  set hide(bool _value) {
    _hide = _value;
    prefs.setBool('ff_hide', _value);
  }

  String _selectedDate = '';
  String get selectedDate => _selectedDate;
  set selectedDate(String _value) {
    _selectedDate = _value;
  }

  dynamic _productSaleJson = jsonDecode('null');
  dynamic get productSaleJson => _productSaleJson;
  set productSaleJson(dynamic _value) {
    _productSaleJson = _value;
  }

  bool _isLoding = false;
  bool get isLoding => _isLoding;
  set isLoding(bool _value) {
    _isLoding = _value;
  }

  dynamic _catSaleJson;
  dynamic get catSaleJson => _catSaleJson;
  set catSaleJson(dynamic _value) {
    _catSaleJson = _value;
  }

  int _catCodeLength = 1;
  int get catCodeLength => _catCodeLength;
  set catCodeLength(int _value) {
    _catCodeLength = _value;
    prefs.setInt('ff_catCodeLength', _value);
  }

  String _qrCodeResult = '';
  String get qrCodeResult => _qrCodeResult;
  set qrCodeResult(String _value) {
    _qrCodeResult = _value;
    prefs.setString('ff_qrCodeResult', _value);
  }

  String _synchTime = '';
  String get synchTime => _synchTime;
  set synchTime(String _value) {
    _synchTime = _value;
  }

  Color _aShift = Color(4290117658);
  Color get aShift => _aShift;
  set aShift(Color _value) {
    _aShift = _value;
    prefs.setInt('ff_aShift', _value.value);
  }

  Color _bShift = Color(4294761484);
  Color get bShift => _bShift;
  set bShift(Color _value) {
    _bShift = _value;
    prefs.setInt('ff_bShift', _value.value);
  }

  int _shiftChose = 0;
  int get shiftChose => _shiftChose;
  set shiftChose(int _value) {
    _shiftChose = _value;
  }

  dynamic _shiftList;
  dynamic get shiftList => _shiftList;
  set shiftList(dynamic _value) {
    _shiftList = _value;
    prefs.setString('ff_shiftList', jsonEncode(_value));
  }

  bool _noShift = false;
  bool get noShift => _noShift;
  set noShift(bool _value) {
    _noShift = _value;
  }

  List<dynamic> _shiftDetailsList = [];
  List<dynamic> get shiftDetailsList => _shiftDetailsList;
  set shiftDetailsList(List<dynamic> _value) {
    _shiftDetailsList = _value;
  }

  void addToShiftDetailsList(dynamic _value) {
    _shiftDetailsList.add(_value);
  }

  void removeFromShiftDetailsList(dynamic _value) {
    _shiftDetailsList.remove(_value);
  }

  void removeAtIndexFromShiftDetailsList(int _index) {
    _shiftDetailsList.removeAt(_index);
  }

  void updateShiftDetailsListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _shiftDetailsList[_index] = updateFn(_shiftDetailsList[_index]);
  }

  void insertAtIndexInShiftDetailsList(int _index, dynamic _value) {
    _shiftDetailsList.insert(_index, _value);
  }

  List<dynamic> _reportDetails = [];
  List<dynamic> get reportDetails => _reportDetails;
  set reportDetails(List<dynamic> _value) {
    _reportDetails = _value;
  }

  void addToReportDetails(dynamic _value) {
    _reportDetails.add(_value);
  }

  void removeFromReportDetails(dynamic _value) {
    _reportDetails.remove(_value);
  }

  void removeAtIndexFromReportDetails(int _index) {
    _reportDetails.removeAt(_index);
  }

  void updateReportDetailsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _reportDetails[_index] = updateFn(_reportDetails[_index]);
  }

  void insertAtIndexInReportDetails(int _index, dynamic _value) {
    _reportDetails.insert(_index, _value);
  }

  int _iLoopStart = 0;
  int get iLoopStart => _iLoopStart;
  set iLoopStart(int _value) {
    _iLoopStart = _value;
  }

  int _jLoopStart = 0;
  int get jLoopStart => _jLoopStart;
  set jLoopStart(int _value) {
    _jLoopStart = _value;
  }

  int _iLoopEnd = 0;
  int get iLoopEnd => _iLoopEnd;
  set iLoopEnd(int _value) {
    _iLoopEnd = _value;
  }

  int _jLoopEnd = 0;
  int get jLoopEnd => _jLoopEnd;
  set jLoopEnd(int _value) {
    _jLoopEnd = _value;
  }

  List<dynamic> _categoryCart = [];
  List<dynamic> get categoryCart => _categoryCart;
  set categoryCart(List<dynamic> _value) {
    _categoryCart = _value;
  }

  void addToCategoryCart(dynamic _value) {
    _categoryCart.add(_value);
  }

  void removeFromCategoryCart(dynamic _value) {
    _categoryCart.remove(_value);
  }

  void removeAtIndexFromCategoryCart(int _index) {
    _categoryCart.removeAt(_index);
  }

  void updateCategoryCartAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _categoryCart[_index] = updateFn(_categoryCart[_index]);
  }

  void insertAtIndexInCategoryCart(int _index, dynamic _value) {
    _categoryCart.insert(_index, _value);
  }

  List<dynamic> _finalCategoryReport = [];
  List<dynamic> get finalCategoryReport => _finalCategoryReport;
  set finalCategoryReport(List<dynamic> _value) {
    _finalCategoryReport = _value;
  }

  void addToFinalCategoryReport(dynamic _value) {
    _finalCategoryReport.add(_value);
  }

  void removeFromFinalCategoryReport(dynamic _value) {
    _finalCategoryReport.remove(_value);
  }

  void removeAtIndexFromFinalCategoryReport(int _index) {
    _finalCategoryReport.removeAt(_index);
  }

  void updateFinalCategoryReportAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _finalCategoryReport[_index] = updateFn(_finalCategoryReport[_index]);
  }

  void insertAtIndexInFinalCategoryReport(int _index, dynamic _value) {
    _finalCategoryReport.insert(_index, _value);
  }

  String _setCategoryMasterName = '';
  String get setCategoryMasterName => _setCategoryMasterName;
  set setCategoryMasterName(String _value) {
    _setCategoryMasterName = _value;
    prefs.setString('ff_setCategoryMasterName', _value);
  }

  DocumentReference? _selectCategoryMasterRef;
  DocumentReference? get selectCategoryMasterRef => _selectCategoryMasterRef;
  set selectCategoryMasterRef(DocumentReference? _value) {
    _selectCategoryMasterRef = _value;
    _value != null
        ? prefs.setString('ff_selectCategoryMasterRef', _value.path)
        : prefs.remove('ff_selectCategoryMasterRef');
  }

  List<ProductMasterListStruct> _readProductlist = [];
  List<ProductMasterListStruct> get readProductlist => _readProductlist;
  set readProductlist(List<ProductMasterListStruct> _value) {
    _readProductlist = _value;
  }

  void addToReadProductlist(ProductMasterListStruct _value) {
    _readProductlist.add(_value);
  }

  void removeFromReadProductlist(ProductMasterListStruct _value) {
    _readProductlist.remove(_value);
  }

  void removeAtIndexFromReadProductlist(int _index) {
    _readProductlist.removeAt(_index);
  }

  void updateReadProductlistAtIndex(
    int _index,
    ProductMasterListStruct Function(ProductMasterListStruct) updateFn,
  ) {
    _readProductlist[_index] = updateFn(_readProductlist[_index]);
  }

  void insertAtIndexInReadProductlist(
      int _index, ProductMasterListStruct _value) {
    _readProductlist.insert(_index, _value);
  }

  int _startLoop = 0;
  int get startLoop => _startLoop;
  set startLoop(int _value) {
    _startLoop = _value;
  }

  int _endLoop = 0;
  int get endLoop => _endLoop;
  set endLoop(int _value) {
    _endLoop = _value;
  }

  int _unitId = 0;
  int get unitId => _unitId;
  set unitId(int _value) {
    _unitId = _value;
  }

  int _productCodeLength = 0;
  int get productCodeLength => _productCodeLength;
  set productCodeLength(int _value) {
    _productCodeLength = _value;
    prefs.setInt('ff_productCodeLength', _value);
  }

  int _iterator = 0;
  int get iterator => _iterator;
  set iterator(int _value) {
    _iterator = _value;
  }

  double _loopExcelDouble = 0.0;
  double get loopExcelDouble => _loopExcelDouble;
  set loopExcelDouble(double _value) {
    _loopExcelDouble = _value;
  }

  int _countExcel = 0;
  int get countExcel => _countExcel;
  set countExcel(int _value) {
    _countExcel = _value;
  }

  int _loopStart = 0;
  int get loopStart => _loopStart;
  set loopStart(int _value) {
    _loopStart = _value;
  }

  bool _showMenuProduct = false;
  bool get showMenuProduct => _showMenuProduct;
  set showMenuProduct(bool _value) {
    _showMenuProduct = _value;
  }

  bool _test = false;
  bool get test => _test;
  set test(bool _value) {
    _test = _value;
  }

  List<ProductListStruct> _testlist = [];
  List<ProductListStruct> get testlist => _testlist;
  set testlist(List<ProductListStruct> _value) {
    _testlist = _value;
  }

  void addToTestlist(ProductListStruct _value) {
    _testlist.add(_value);
  }

  void removeFromTestlist(ProductListStruct _value) {
    _testlist.remove(_value);
  }

  void removeAtIndexFromTestlist(int _index) {
    _testlist.removeAt(_index);
  }

  void updateTestlistAtIndex(
    int _index,
    ProductListStruct Function(ProductListStruct) updateFn,
  ) {
    _testlist[_index] = updateFn(_testlist[_index]);
  }

  void insertAtIndexInTestlist(int _index, ProductListStruct _value) {
    _testlist.insert(_index, _value);
  }

  List<dynamic> _listprd = [];
  List<dynamic> get listprd => _listprd;
  set listprd(List<dynamic> _value) {
    _listprd = _value;
  }

  void addToListprd(dynamic _value) {
    _listprd.add(_value);
  }

  void removeFromListprd(dynamic _value) {
    _listprd.remove(_value);
  }

  void removeAtIndexFromListprd(int _index) {
    _listprd.removeAt(_index);
  }

  void updateListprdAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _listprd[_index] = updateFn(_listprd[_index]);
  }

  void insertAtIndexInListprd(int _index, dynamic _value) {
    _listprd.insert(_index, _value);
  }

  List<dynamic> _productListSTockableUpdate = [];
  List<dynamic> get productListSTockableUpdate => _productListSTockableUpdate;
  set productListSTockableUpdate(List<dynamic> _value) {
    _productListSTockableUpdate = _value;
  }

  void addToProductListSTockableUpdate(dynamic _value) {
    _productListSTockableUpdate.add(_value);
  }

  void removeFromProductListSTockableUpdate(dynamic _value) {
    _productListSTockableUpdate.remove(_value);
  }

  void removeAtIndexFromProductListSTockableUpdate(int _index) {
    _productListSTockableUpdate.removeAt(_index);
  }

  void updateProductListSTockableUpdateAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _productListSTockableUpdate[_index] =
        updateFn(_productListSTockableUpdate[_index]);
  }

  void insertAtIndexInProductListSTockableUpdate(int _index, dynamic _value) {
    _productListSTockableUpdate.insert(_index, _value);
  }

  bool _isPresentBoolean = false;
  bool get isPresentBoolean => _isPresentBoolean;
  set isPresentBoolean(bool _value) {
    _isPresentBoolean = _value;
  }

  int _taxIndexSTate = 0;
  int get taxIndexSTate => _taxIndexSTate;
  set taxIndexSTate(int _value) {
    _taxIndexSTate = _value;
  }

  String _catcolor = '';
  String get catcolor => _catcolor;
  set catcolor(String _value) {
    _catcolor = _value;
    prefs.setString('ff_catcolor', _value);
  }

  List<dynamic> _prdJsonList = [];
  List<dynamic> get prdJsonList => _prdJsonList;
  set prdJsonList(List<dynamic> _value) {
    _prdJsonList = _value;
  }

  void addToPrdJsonList(dynamic _value) {
    _prdJsonList.add(_value);
  }

  void removeFromPrdJsonList(dynamic _value) {
    _prdJsonList.remove(_value);
  }

  void removeAtIndexFromPrdJsonList(int _index) {
    _prdJsonList.removeAt(_index);
  }

  void updatePrdJsonListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _prdJsonList[_index] = updateFn(_prdJsonList[_index]);
  }

  void insertAtIndexInPrdJsonList(int _index, dynamic _value) {
    _prdJsonList.insert(_index, _value);
  }

  bool _sortMenuBool = false;
  bool get sortMenuBool => _sortMenuBool;
  set sortMenuBool(bool _value) {
    _sortMenuBool = _value;
  }

  String _sortProductString = '';
  String get sortProductString => _sortProductString;
  set sortProductString(String _value) {
    _sortProductString = _value;
  }

  List<ProductListStruct> _allProductdoc = [];
  List<ProductListStruct> get allProductdoc => _allProductdoc;
  set allProductdoc(List<ProductListStruct> _value) {
    _allProductdoc = _value;
  }

  void addToAllProductdoc(ProductListStruct _value) {
    _allProductdoc.add(_value);
  }

  void removeFromAllProductdoc(ProductListStruct _value) {
    _allProductdoc.remove(_value);
  }

  void removeAtIndexFromAllProductdoc(int _index) {
    _allProductdoc.removeAt(_index);
  }

  void updateAllProductdocAtIndex(
    int _index,
    ProductListStruct Function(ProductListStruct) updateFn,
  ) {
    _allProductdoc[_index] = updateFn(_allProductdoc[_index]);
  }

  void insertAtIndexInAllProductdoc(int _index, ProductListStruct _value) {
    _allProductdoc.insert(_index, _value);
  }

  String _passcode = '';
  String get passcode => _passcode;
  set passcode(String _value) {
    _passcode = _value;
  }

  bool _flag = false;
  bool get flag => _flag;
  set flag(bool _value) {
    _flag = _value;
  }

  String _emailId = '';
  String get emailId => _emailId;
  set emailId(String _value) {
    _emailId = _value;
  }

  String _outletBranch = '';
  String get outletBranch => _outletBranch;
  set outletBranch(String _value) {
    _outletBranch = _value;
  }

  String _categoryId = '';
  String get categoryId => _categoryId;
  set categoryId(String _value) {
    _categoryId = _value;
  }

  bool _falg2 = false;
  bool get falg2 => _falg2;
  set falg2(bool _value) {
    _falg2 = _value;
  }

  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? _value) {
    _startDate = _value;
  }

  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  set endDate(DateTime? _value) {
    _endDate = _value;
  }

  double _totalTaxAmount = 0.0;
  double get totalTaxAmount => _totalTaxAmount;
  set totalTaxAmount(double _value) {
    _totalTaxAmount = _value;
  }

  double _totalProductSaleAmount = 0.0;
  double get totalProductSaleAmount => _totalProductSaleAmount;
  set totalProductSaleAmount(double _value) {
    _totalProductSaleAmount = _value;
  }

  dynamic _gstJsonObj;
  dynamic get gstJsonObj => _gstJsonObj;
  set gstJsonObj(dynamic _value) {
    _gstJsonObj = _value;
  }

  double _priceTotal = 0.0;
  double get priceTotal => _priceTotal;
  set priceTotal(double _value) {
    _priceTotal = _value;
  }

  double _taxAmtTotal = 0.0;
  double get taxAmtTotal => _taxAmtTotal;
  set taxAmtTotal(double _value) {
    _taxAmtTotal = _value;
  }

  double _qtyTotal = 0.0;
  double get qtyTotal => _qtyTotal;
  set qtyTotal(double _value) {
    _qtyTotal = _value;
  }

  List<dynamic> _updatedPriceTable = [];
  List<dynamic> get updatedPriceTable => _updatedPriceTable;
  set updatedPriceTable(List<dynamic> _value) {
    _updatedPriceTable = _value;
  }

  void addToUpdatedPriceTable(dynamic _value) {
    _updatedPriceTable.add(_value);
  }

  void removeFromUpdatedPriceTable(dynamic _value) {
    _updatedPriceTable.remove(_value);
  }

  void removeAtIndexFromUpdatedPriceTable(int _index) {
    _updatedPriceTable.removeAt(_index);
  }

  void updateUpdatedPriceTableAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _updatedPriceTable[_index] = updateFn(_updatedPriceTable[_index]);
  }

  void insertAtIndexInUpdatedPriceTable(int _index, dynamic _value) {
    _updatedPriceTable.insert(_index, _value);
  }

  List<dynamic> _productJsonList = [];
  List<dynamic> get productJsonList => _productJsonList;
  set productJsonList(List<dynamic> _value) {
    _productJsonList = _value;
  }

  void addToProductJsonList(dynamic _value) {
    _productJsonList.add(_value);
  }

  void removeFromProductJsonList(dynamic _value) {
    _productJsonList.remove(_value);
  }

  void removeAtIndexFromProductJsonList(int _index) {
    _productJsonList.removeAt(_index);
  }

  void updateProductJsonListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _productJsonList[_index] = updateFn(_productJsonList[_index]);
  }

  void insertAtIndexInProductJsonList(int _index, dynamic _value) {
    _productJsonList.insert(_index, _value);
  }

  List<String> _premisesUpdateCheckboxList = [];
  List<String> get premisesUpdateCheckboxList => _premisesUpdateCheckboxList;
  set premisesUpdateCheckboxList(List<String> _value) {
    _premisesUpdateCheckboxList = _value;
  }

  void addToPremisesUpdateCheckboxList(String _value) {
    _premisesUpdateCheckboxList.add(_value);
  }

  void removeFromPremisesUpdateCheckboxList(String _value) {
    _premisesUpdateCheckboxList.remove(_value);
  }

  void removeAtIndexFromPremisesUpdateCheckboxList(int _index) {
    _premisesUpdateCheckboxList.removeAt(_index);
  }

  void updatePremisesUpdateCheckboxListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _premisesUpdateCheckboxList[_index] =
        updateFn(_premisesUpdateCheckboxList[_index]);
  }

  void insertAtIndexInPremisesUpdateCheckboxList(int _index, String _value) {
    _premisesUpdateCheckboxList.insert(_index, _value);
  }

  UserListStruct _userAccessList = UserListStruct();
  UserListStruct get userAccessList => _userAccessList;
  set userAccessList(UserListStruct _value) {
    _userAccessList = _value;
    prefs.setString('ff_userAccessList', _value.serialize());
  }

  void updateUserAccessListStruct(Function(UserListStruct) updateFn) {
    updateFn(_userAccessList);
    prefs.setString('ff_userAccessList', _userAccessList.serialize());
  }

  List<BillSaleSummeryDataTypeStruct> _billSaleStructState = [];
  List<BillSaleSummeryDataTypeStruct> get billSaleStructState =>
      _billSaleStructState;
  set billSaleStructState(List<BillSaleSummeryDataTypeStruct> _value) {
    _billSaleStructState = _value;
  }

  void addToBillSaleStructState(BillSaleSummeryDataTypeStruct _value) {
    _billSaleStructState.add(_value);
  }

  void removeFromBillSaleStructState(BillSaleSummeryDataTypeStruct _value) {
    _billSaleStructState.remove(_value);
  }

  void removeAtIndexFromBillSaleStructState(int _index) {
    _billSaleStructState.removeAt(_index);
  }

  void updateBillSaleStructStateAtIndex(
    int _index,
    BillSaleSummeryDataTypeStruct Function(BillSaleSummeryDataTypeStruct)
        updateFn,
  ) {
    _billSaleStructState[_index] = updateFn(_billSaleStructState[_index]);
  }

  void insertAtIndexInBillSaleStructState(
      int _index, BillSaleSummeryDataTypeStruct _value) {
    _billSaleStructState.insert(_index, _value);
  }

  int _billStartLoop = 0;
  int get billStartLoop => _billStartLoop;
  set billStartLoop(int _value) {
    _billStartLoop = _value;
  }

  String _selectedLastDate = '';
  String get selectedLastDate => _selectedLastDate;
  set selectedLastDate(String _value) {
    _selectedLastDate = _value;
  }

  String _selectedStartDate = '';
  String get selectedStartDate => _selectedStartDate;
  set selectedStartDate(String _value) {
    _selectedStartDate = _value;
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
