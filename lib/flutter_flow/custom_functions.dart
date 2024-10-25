import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int newCustomFunction(DateTime date) {
  int dateInMili = date.millisecondsSinceEpoch;
  return dateInMili;
}

List<dynamic> premisesToJsonfuncCopy(
  String getString,
  List<PremisesRecord> premiseDocs,
) {
  // final paymentJsonData = jsonDecode(getString);
  // print(paymentJsonData["default price"]);
  // return paymentJsonData;

  String stringTobeSeparated = getString;

  List<dynamic> list1 = [];

  var trimmed = stringTobeSeparated.replaceAll('{', "");
  var str = trimmed.replaceAll('}', "");
  var list = str.split(",");
//  print(list);

  for (int i = 0; i < list.length; i++) {
    var list2 = list[i].split(":");
    //  print(list2);
    //   print(list2[0]);
    //  print(list2[1]);

    list1.add({"key": list2[0], "value": list2[1]});
  }
  premiseDocs.forEach((element) {
    int index;
    index =
        list1.indexWhere((innerElement) => innerElement["key"] == element.name);
    if (index == -1) {
      list1.add({"key": element.name, "value": 0});
    }
  });

  print(list1);

  return list1;
}

String returnPriceJsonString(double price) {
  String priceJsonStr;

  priceJsonStr = '{"default price":' + price.toString() + '}';
  print(priceJsonStr);

  return priceJsonStr;
}

String getTaxIdEdit2(int? tax) {
  if (tax != null) {
    switch (tax) {
      case 1:
        return "GST0";
      case 2:
        return "GST5";
      case 3:
        return "GST12";
      case 4:
        return "GST18";
      case 5:
        return "GST28";
      case 6:
        return "VAT22";
      case 7:
        return "VAT10";
      case 8:
        return "GST3";
      case 9:
        return "GST2";
    }
  }
  // Default value if the provided tax is not found
  return "";
}

DateTime getToday(DateTime customDate) {
  var today = DateTime(customDate.year, customDate.month, customDate.day);
  return today;
}

dynamic updateProductToJson(
  ProductRecord changedStockable,
  int taxIndexToSave,
) {
  dynamic changedStockableNew;
  changedStockableNew = {
    "id": changedStockable.reference.id,
    "name": changedStockable.name,
    "tax": taxIndexToSave,
    "reference": changedStockable.reference,
    "active": changedStockable.active,

    "barcode": changedStockable.barcode,
    "category": changedStockable.category,
    "cess": changedStockable.cess,
    "code": changedStockable.code,
    "costPrice": changedStockable.costPrice,
    // "dateTime": changedStockable.dateTime,
    "discount": changedStockable.discount,
    "keyCount": changedStockable.keyCount,
    "kitchenId": changedStockable.kitchenId,
    "mrpPrice": changedStockable.mrpPrice,
    "onlinePrice": changedStockable.onlinePrice,
    "onlineSynced": changedStockable.onlineSynced,
    "price": changedStockable.price,
    "priceTable": changedStockable.priceTable,
    "recipeId": changedStockable.recipeId,
    "regionalName": changedStockable.regionalName,
    "reorderLevel": changedStockable.reorderLevel,
    "selected": changedStockable.selected,
    "shortName": changedStockable.shortName,
    "stockable": changedStockable.stockable,
    // "taxIndex": changedStockable.active,
    "type": changedStockable.type,
    "unitId": changedStockable.unitId,
    // "weightable": changedStockable.weghable,
    "currentStock": changedStockable.currentStock,
    // "hsncode": changedStockable.hsncode,
    "discountAmount": changedStockable.discountAmount,
  };
  // print(changedStockableNew["stockable"]);
  // changedStockableNew["stockable"] = isStockable;
  print(changedStockableNew);
  return changedStockableNew;
}

dynamic updateProductTax(
  ProductRecord changedStockable,
  int taxIndexToSave,
) {
  dynamic changedStockableNew;
  changedStockableNew = {
    "id": changedStockable.reference.id,
    "name": changedStockable.name,
    "tax": taxIndexToSave,
    "reference": changedStockable.reference
  };
  // print(changedStockableNew["stockable"]);
  // changedStockableNew["stockable"] = isStockable;
  print(changedStockableNew);
  return changedStockableNew;
}

String newCustomFunction2(DocumentReference ref) {
  return ref.id;
}

dynamic jsonStringTojsonList(String data) {
  data.replaceAll('"\"', " ");

  dynamic json = jsonDecode(data);

  print(json);
  return json;
}

int getProductCount(int count) {
  return count + 1;
}

double stringToDouble(String? val1) {
  return double.parse('$val1');
}

String getCatIdByRefCopy2(DocumentReference docRef) {
  return docRef.id;
}

int setRenewalDate(DateTime date) {
  int renewalInMiliSec;
  //DateTime dateInMili = DateTime.fromMillisecondsSinceEpoch(date!);
  DateTime datetime;
  datetime = date.add(Duration(days: 365));
  print(datetime); //2023-04-30 00:00:00.000
  renewalInMiliSec = DateTime.parse(datetime.toString()).millisecondsSinceEpoch;
  print(renewalInMiliSec);
  return renewalInMiliSec;
}

String differenceBetDates(
  int date1,
  int date2,
  String index,
) {
  int result = 0;
  DateTime dt1 = DateTime.fromMillisecondsSinceEpoch(date1);
  DateTime dt2 = DateTime.fromMillisecondsSinceEpoch(date2);

  Duration diff = dt1.difference(dt2);
  if (index == "day") {
    print(diff.inDays);
    result = diff.inDays;
  } else if (index == "min") {
    print(diff.inMinutes);
    result = diff.inMinutes;
  } else if (index == "hour") {
    print(diff.inHours);
    result = diff.inHours;
  } else if (index == "sec") {
    print(diff.inSeconds);
    result = diff.inSeconds;
  }
  return result.toString();
}

DocumentReference genDeviceRefById(String id) {
  return FirebaseFirestore.instance.doc('/DEVICE/$id');
}

String getDayId(DateTime date) {
  var day, month;

  if (date.day.toString().length == 1) {
    day = "0" + date.day.toString();
  } else {
    day = date.day.toString();
  }

  if (date.month.toString().length == 1) {
    month = "0" + date.month.toString();
  } else {
    month = date.month.toString();
  }
  var invNum = date.year.toString() + "-" + month + "-" + day;
  //var invNum = day + "-" + month + "-" + date.year.toString();
  print(invNum);

  return invNum.toString();
}

String getProductIdByRef(DocumentReference docRef) {
  String id = docRef!.id;
  return id;
}

String? getUserprofileIdByRef(DocumentReference ref) {
  return ref.id;
}

bool checkOutletsLength(UserProfileRecord doc) {
  bool result;
  int len = doc.outlets!.length;
  print(len);
  if (len > 0) {
    result = true;
  } else {
    result = false;
  }
  return result;
}

String getCatIdByRef(DocumentReference docRef) {
  return docRef.id;
}

int getCatCount(int count) {
  return count + 1;
}

int setDeletionDate(DateTime date) {
  int deletionInMiliSec;
  //DateTime dateInMili = DateTime.fromMillisecondsSinceEpoch(date!);
  DateTime datetime;
  datetime = date.add(Duration(days: 30));
  print(datetime); //2023-04-30 00:00:00.000
  deletionInMiliSec =
      DateTime.parse(datetime.toString()).millisecondsSinceEpoch;
  print(deletionInMiliSec);
  return deletionInMiliSec;
}

DateTime setExpiryTime(DateTime date) {
  int renewalInMiliSec;

  DateTime datetime;
  DateTime now = new DateTime.now();
  print(now);
  datetime = date.add(Duration(hours: 4));
  print(datetime); //2023-04-30 00:00:00.000

  renewalInMiliSec = DateTime.parse(datetime.toString()).millisecondsSinceEpoch;
  print(renewalInMiliSec);
  print(datetime);
  return datetime;
}

dynamic newCustomFunction3(ProductRecord doc) {
  // convert document to json
  return {
    'id': doc.id,
    'name': doc.name,
    'price': doc.price,
    'category': doc.category
  };
}

int timestampToMili(DateTime? sdate) {
  return sdate!.millisecondsSinceEpoch;
}

String getMonthId() {
  DateTime date = DateTime.now();
  //var day;
  //if (date.day.toString().length == 1) {
  //day = "0" + date.day.toString();
  //} else {
  //  day = date.day.toString();
  //}
  var month;
  if (date.month.toString().length == 1) {
    month = "0" + date.month.toString();
  } else {
    month = date.month.toString();
  }
  var invNum = date.year.toString() + "-" + month;
  print(invNum);
  return invNum;
}

String? genInvoiceNum(int? count) {
  DateTime date = DateTime.now();

  var day, month;
  day = date.day.toString();
  month = date.month.toString();

  var invNum = (day.length < 2 ? "0" + day : day).toString() +
      (month.length < 2 ? "0" + month : month).toString() +
      date.year.toString() +
      count.toString();

  print(invNum);
  return invNum.toString();
}

int reqCountNumber(StockLogRecord doc) {
  return (doc.reqCount + 1);
}

String selectedDayId(DateTime dateTime) {
  var day;

  if (dateTime.day.toString().length == 1) {
    day = "0" + dateTime.day.toString();
  } else {
    day = dateTime.day.toString();
  }
  var month;
  if (dateTime.month.toString().length == 1) {
    month = "0" + dateTime.month.toString();
  } else {
    month = dateTime.month.toString();
  }

  var invNum = dateTime.year.toString() + "-" + month + "-" + day;

  print(invNum);
  return invNum.toString();
}

String dateFormat(DateTime? date) {
  var newFormat = DateFormat("dd-MM-yyyy");
  String newDateInString = newFormat.format(date!);
  return newDateInString;
}

List<dynamic> soldProductList(List<dynamic> list) {
  List<dynamic> returnList = [];
  print(list);
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list[i]["products"].length; j++) {
      returnList.add(list[i]["products"][j]);
    }
  }
  print(returnList);

  return returnList;
}

String toCapitalLetter(String? value) {
  return (value!.toUpperCase());
}

String getOutletIdbyRef(DocumentReference? doc) {
  return doc!.id;
}

DocumentReference productRef(
  String id,
  String outletId,
) {
  DocumentReference x =
      FirebaseFirestore.instance.doc('/OUTLET/$outletId/PRODUCT/$id');
  // print(x);
  return FirebaseFirestore.instance.doc('/OUTLET/$outletId/PRODUCT/$id');
}

DocumentReference categoryRef(
  String id,
  String outletId,
) {
  DocumentReference x =
      FirebaseFirestore.instance.doc('/OUTLET/$outletId/CATEGORY/$id');
  print(x);
  return FirebaseFirestore.instance.doc('/OUTLET/$outletId/CATEGORY/$id');
}

String getDocIdFromDocRef(DocumentReference? docRef) {
  String id = docRef!.id;
  print(id);
  return id;
}

int today() {
  var now = DateTime.now();
  var today = DateTime(now.year, now.month, now.day);
  return today.millisecondsSinceEpoch;
}

String roundOff(double number) {
  print("Tax");
  print(number);
  String output;

  output = number.toStringAsFixed(2);
  print("output");
  print(output);

  return output;
}

String getTaxIdEdit1(int? tax) {
  if (tax != null) {
    switch (tax) {
      case 0:
        return "GST0";
      case 1:
        return "GST5";
      case 2:
        return "GST12";
      case 3:
        return "GST18";
      case 4:
        return "GST28";
      case 5:
        return "VAT22";
      case 6:
        return "GST3";
      case 7:
        return "GST2";
      case 8:
        return "IGST18";
    }
  }
  // Default value if the provided tax is not found
  return "";
}

String getUnitTypesEdit1(int? unittype) {
  print("unittype");
  print(unittype);
  if (unittype != null) {
    print("unittype");
    print(unittype);
    switch (unittype) {
      case 0:
        return "KILOGRAM";
      case 1:
        return "LITER";
      case 2:
        return "NUMBER";
      case 3:
        return "MILLILITRE";
      case 4:
        return "BOX";
      case 5:
        return "TIN";
      case 6:
        return "JAR";
      case 7:
        return "BOTTLE";
      case 8:
        return "GRAM";
      case 9:
        print("skdhjk");
        return "METER";
      case 10:
        return "DOZEN";
      case 11:
        return "BAG";
      case 12:
        return "PIECE";
    }
  }
  // Default value if the provided unittype is not found
  return "";
}

dynamic returnPriceJson(double price) {
  return {"default price": price};
}

String returnPriceJsonStringCopy(List<dynamic> priceTable) {
  String priceJsonStr;

  priceJsonStr = json.encode(priceTable);
  print(priceJsonStr);

  return priceJsonStr;
}

double discountAmtPer(
  double? discountPer,
  double? sellingPrice,
) {
  double output;
  double amt = 0.0;
  if (discountPer != null) {
    output = (sellingPrice! * discountPer) / 100;
    amt = output;
  } else {
    amt = 0.0;
  }
  return amt;
}

String shortName(String name) {
  // short name in sentence in first later
  List<String> words = name.split(' ');
  String initials = '';
  for (String word in words) {
    initials += word[0];
  }
  return initials.toUpperCase();
}

String categoryName(
  List<CategoryRecord> category,
  String categoryId,
) {
  return ("categoryName");
}

DocumentReference getCatRefById(
  String id,
  String outletId,
) {
  print(outletId);
  print(id);
  return FirebaseFirestore.instance
      .doc("/OUTLET/" + outletId + '/CATEGORY/$id');
}

double gerProgressValue(
  int percentage,
  int totalProduct,
) {
  print(percentage);
  print(totalProduct);
  print((percentage / totalProduct));
  return (percentage / totalProduct);
}

dynamic updateProductStockableFunction(
  ProductRecord changedStockable,
  DocumentReference documentReference,
  bool isStockable,
  bool? isweightable,
) {
  dynamic changedStockableNew;

  changedStockableNew = {
    "id": changedStockable.id,
    "stockable": isStockable,
    "weightable": isweightable,
    "reference": changedStockable.reference
  };

  print(
      "--------------------------------------------------------------------------------------");
  // changedStockableNew["stockable"] = isStockable;
  print(changedStockableNew);
  return changedStockableNew;
}

DocumentReference getReferenceProduct(
  String id,
  DocumentReference parentRef,
) {
  var docId = parentRef.id;
  var subId = id;
  print("id");
  print(subId);
  print(docId);
  return FirebaseFirestore.instance.doc('/OUTLET/$docId/PRODUCT/$subId');
}

String getReferenceCategory(
  DocumentReference parentRef,
  DocumentReference catRef,
) {
  var docId = parentRef.id;
  var subId = catRef.id;
  print("id");
  print(subId);
  print(docId);
  // return FirebaseFirestore.instance.doc(catRef.id);
  return (catRef.id);
}

DocumentReference updateProductStkorWt(dynamic json) {
  print(
      "-------------------json------------------------------------------------------------------------");
  print(json);
  print(
      "-------------------updateProductStkorWt------------------------------------------------------------------------");
  print(json["ref"]);
  DocumentReference ref = json["ref"];

  return ref;
}

int getTaxIdfunc(String tax) {
  // Add your function code here!
  if (tax != null) {
    switch (tax.toUpperCase()) {
      case "GST0":
        return 1;

      case "GST5":
        return 2;
      case "GST12":
        return 3;

      case "GST18":
        return 4;

      case "GST28":
        return 5;
      case "VAT22":
        return 6;
      case "GST3":
        return 7;
      case "GST2":
        return 8;
    }
  }
  // Default value if the provided tax is not found
  return -1;
}

List<ProductRecord> sortProductFunction(
  List<ProductRecord> allPrd,
  String switchCase,
  String cat,
) {
  // return list  prodoc
  switch (switchCase) {
    case 'code':
      allPrd.sort((a, b) => a.code.compareTo(b.code));
      break;

    case 'nameAZ':
      allPrd.sort((a, b) => a.name.compareTo(b.name));
      break;

    case 'category':
      List<ProductRecord> filteredProducts =
          allPrd.where((product) => product.category == cat).toList();
      allPrd = filteredProducts;
      break;

    case 'date':
      allPrd.sort((a, b) => a.dateTme!.compareTo(b.dateTme!));
      break;
    default:
      break;
  }
  print(switchCase);
  print(allPrd);
  return allPrd;
}

List<dynamic> premisesToJsonfunc(String getString) {
  // final paymentJsonData = jsonDecode(getString);
  // print(paymentJsonData["default price"]);
  // return paymentJsonData;

  String stringTobeSeparated = getString;

  List<dynamic> list1 = [];

  var trimmed = stringTobeSeparated.replaceAll('{', "");
  var str = trimmed.replaceAll('}', "");
  var list = str.split(",");
//  print(list);

  for (int i = 0; i < list.length; i++) {
    var list2 = list[i].split(":");
    //  print(list2);
    //   print(list2[0]);
    //  print(list2[1]);

    list1.add({"key": list2[0], "value": list2[1]});
  }
  // print(list1);

  return list1;
}

DateTime getTomorrow(DateTime customDate) {
  var tomorrow =
      DateTime(customDate.year, customDate.month, customDate.day + 1);
  return tomorrow;
}

List<dynamic> returnEmptyList() {
  List<dynamic> list = [];

  return list;
}

int getCurrentMonth(String index) {
  DateTime curDate = new DateTime.now();
  var first, last;
  int firstInMilli, lastInMilli;
  int result = 0;
  if (index == "first") {
    first = DateTime(curDate.year, curDate.month, 1);

    firstInMilli = first.millisecondsSinceEpoch;
    result = firstInMilli;
  } else if (index == "last") {
    last = (curDate.month < 12)
        ? new DateTime(curDate.year, curDate.month + 1, 1)
        : new DateTime(curDate.year + 1, 1, 1);
    lastInMilli = last.millisecondsSinceEpoch;
    result = lastInMilli;
  }
  return result;
}

List<dynamic> editPriceTable(
  dynamic json,
  String id,
  String editPrice,
  List<dynamic> priceTableList,
  List<dynamic> prdList,
) {
  List<dynamic> resList = prdList;
  //int index = priceTableList.indexOf(json);
  int index = priceTableList
      .indexWhere((innerElement) => innerElement["key"] == json["key"]);
  print("Index for price table key");
  print(index);

  if (index != -1) {
    priceTableList[index]["value"] = editPrice;
  }
  var y;
  String item = "";
  int x = resList.indexWhere((innerElement) => innerElement["id"] == id);
  print("Index for id");
  print(x);
  print(id);
  if (x != -1) {
    int len = priceTableList.length;
    int count = 0;
    priceTableList.forEach((element) {
      count++;
      if (count < len) {
        item = item + element["key"] + ":" + element["value"] + ",";
      } else {
        item = item + element["key"] + ":" + element["value"];
      }
      // y = y + item;
      // print(y);
    });
    resList[x]["priceTable"] = "{" + item.toString() + "}";
  }
  print("*****************************************");
  print(resList);
  return resList;
}

String getTimeFromMilliseonds(int milliseconds) {
  if (milliseconds > 1) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    String formattedTime = DateFormat('hh:mm a').format(dateTime);
    return formattedTime;
  }
  return "-";
}

int addOneIndexAhead(int start) {
  return start + 1;
}

DocumentReference getOutletRefById(String id) {
  return FirebaseFirestore.instance.doc('/OUTLET/$id');
}

int getMillisecondsFromDate(String dayId) {
  DateTime dateTime = DateFormat('yyyy-MM-dd').parse(dayId);
  return dateTime.millisecondsSinceEpoch;
}

double getTotalSaleOfBillSaleSummery(
    List<BillSaleSummaryRecord>? billSaleDocuments) {
  double totalSale = 0;
  if (billSaleDocuments!.length == 0) {
    return totalSale;
  }

  for (var item in billSaleDocuments) {
    totalSale += item.finalTotal;
  }

  return totalSale;
}

String getYesterdayDayId(String date) {
  DateTime parsedDate = DateTime.parse(date);
  DateTime yesterday = parsedDate.subtract(Duration(days: 1));
  String formattedDate = yesterday.toIso8601String().split('T').first;
  return formattedDate;
}

double roundOff1Copy(double number) {
  print("Tax");
  print(number);
  double output;

  output = double.parse(number.toStringAsFixed(3));
  print("output");
  print(output);

  return output;
}

List<BillSaleSummaryRecord> orderByBillSale(
  List<BillSaleSummaryRecord> docs,
  String type,
) {
  int compareDates(String? a, String? b) {
    if (a == null && b == null) return 0;
    if (a == null) return -1; // Treat null as earlier than any date
    if (b == null) return 1;
    return a.compareTo(b);
  }

  if (type == "a") {
    docs.sort((a, b) => compareDates(a.billNo, b.billNo)); // Ascending order
  } else if (type == "d") {
    docs.sort((a, b) => compareDates(b.billNo, a.billNo)); // Descending order
  }
  return docs;
}

int stringToInteger(String? val1) {
  return int.parse('$val1');
}

String getPaymentMode(String jsonData) {
  Map<String, dynamic> paymentData = jsonDecode(jsonData);
  // Map to translate keys to human-readable payment modes
  Map<String, String> paymentModes = {
    "cash": "Cash",
    "credit": "Credit",
    "digital": "Digital",
    "card": "Card",
    "googlepay": "Google Pay",
    "phonepe": "PhonePe",
    "paytm": "Paytm",
    "other": "Other",
    "loyaltypoint": "Loyalty Points",
    "cheque_payment_mode": "Cheque",
  };

  // Collect modes with values greater than 0
  String paMode = "";
  paymentData.forEach((key, value) {
    if (value > 0) {
      paMode = paymentModes[key]!;
    }
  });

  return paMode.isNotEmpty ? paMode : 'Cash';
}

double getTotalOnQtyAndPrice(
  double var1,
  double var2,
) {
  return var1 * var2;
}

double getTotalEditBIll(List<BillSaleItemDTStruct> eBProductList) {
  double totalSale = 0;
  if (eBProductList.length == 0) {
    return totalSale;
  }

  for (var item in eBProductList) {
    totalSale += item.total;
  }
  return totalSale;
}

String updatePaymentMode(
  String jsonData,
  String newMode,
) {
  Map<String, dynamic> paymentData = jsonDecode(jsonData);

  // Map to translate keys to human-readable payment modes
  Map<String, String> paymentModes = {
    "cash": "Cash",
    "credit": "Credit",
    "digital": "Digital",
    "card": "Card",
    "googlepay": "Google Pay",
    "phonepe": "PhonePe",
    "paytm": "Paytm",
    "other": "Other",
    "loyaltypoint": "Loyalty Points",
    "cheque_payment_mode": "Cheque",
  };

  // Find the key for the new mode to update
  String? newModeKey = paymentModes.entries
      .firstWhere((entry) => entry.value == newMode,
          orElse: () => const MapEntry("", ""))
      .key;

  if (newModeKey.isEmpty) {
    return jsonData; // If the newMode is invalid, return the original JSON string
  }

  // Find the current mode with a value greater than 0
  String? currentModeKey;
  int currentValue = 0;

  paymentData.forEach((key, value) {
    if (value > 0 && paymentModes.containsKey(key)) {
      currentModeKey = key;
      currentValue = value;
    }
  });

  // If we found a mode with value > 0, transfer its value to the newMode and set it to 0
  if (currentModeKey != null && currentValue > 0) {
    paymentData[newModeKey] =
        currentValue; // Transfer the value to the new mode
    paymentData[currentModeKey!] = 0; // Set the original mode to 0
  }

  // Convert the updated map back to a JSON string
  return jsonEncode(paymentData);
}

String updatePaymentMode2(
  String jsonData,
  String mode,
  int newValue,
) {
  Map<String, dynamic> paymentData = jsonDecode(jsonData);

  // Map to translate keys to human-readable payment modes
  Map<String, String> paymentModes = {
    "cash": "Cash",
    "credit": "Credit",
    "digital": "Digital",
    "card": "Card",
    "googlepay": "Google Pay",
    "phonepe": "PhonePe",
    "paytm": "Paytm",
    "other": "Other",
    "loyaltypoint": "Loyalty Points",
    "cheque_payment_mode": "Cheque",
  };

  // Find the key that matches the mode
  String? paymentKey = paymentModes.entries
      .firstWhere((entry) => entry.value == mode,
          orElse: () => const MapEntry("", ""))
      .key;

  // Set all current non-zero payment modes to 0
  paymentData.forEach((key, value) {
    if (value > 0) {
      paymentData[key] = 0;
    }
  });

  // Update the value in the JSON if the key exists and the new value is greater than 0
  if (paymentKey.isNotEmpty && newValue > 0) {
    paymentData[paymentKey] = newValue;
  }

  // Convert the updated map back to a JSON string
  String updatedJson = jsonEncode(paymentData);

  return updatedJson;
}

List<String> updateProductSale(
  List<String> productSale,
  String productID,
  double price,
  int qty,
) {
/*  if (productSale.containsKey(productID)) {
    productSale[productID]![price] = qty;
  } else {
    productSale[productID] = {price: qty};
  }*/

  return productSale;
}

double? getMrpAndSPriceforMultipleOutlets(
  String? inputMRP,
  String? gstPerStr,
  String? returnType,
  double? multiple,
) {
  print(inputMRP);
  print(gstPerStr);
  print(returnType);
  print(multiple);
  // Parse the MRP
  double mrp;
  try {
    mrp = double.parse(inputMRP!);
  } catch (e) {
    return 0.0; // Return 0.0 if parsing fails
  }

  if (returnType == "MRP") {
    // Return MRP multiplied by 1.2
    print(mrp * multiple!);

    return mrp * multiple!;
  } else if (returnType == "SP") {
    // Extract GST percentage
    int gstPercentage = 0;
    if (gstPerStr!.startsWith("GST")) {
      gstPercentage = int.parse(gstPerStr!.substring(3));
    } else if (gstPerStr!.startsWith("VAT")) {
      gstPercentage = int.parse(gstPerStr!.substring(3));
    } else {
      return 0.0; // Return 0.0 if GST format is invalid
    }

    double sellingPrice = mrp * multiple! / (1 + (gstPercentage / 100));
    print(sellingPrice);

    String roundedX = sellingPrice.toStringAsFixed(2);
    print(roundedX);
    //return sellingPrice..toStringAsFixed(2);
    return double.parse(roundedX);
    // Calculate Selling Price based on MRP and GST
    // double sellingPrice =
    //     mrp * multiple! + (mrp * multiple! * gstPercentage / 100);
    // return sellingPrice; // Return the Selling Price
  }
  print("*****");
  //return 0.0;
}

double getMultiCounterPrices(
  String outletId,
  List<MultipliersListStruct> list,
  String type,
) {
  double result = 0.0;
  bool flag = false;
  int count = 0;
  for (int j = 0; j < list.length; j++) {
    count++;
    if (outletId == list[j].outletId) {
      flag = true;
      if (type == "SP") {
        result = list[j].sPrice;
      } else if (type == "MRP") {
        result = list[j].mrp;
      }

      break;
    } else {
      if (flag = false && count == list.length) {
        result = 0.0;
      }
    }
  }

  return result;
}

String? imgStrtoimagePath(String? imageLink) {
  return imageLink;
}

String? imagePatToString(String? imagePath) {
  return imagePath;
}
