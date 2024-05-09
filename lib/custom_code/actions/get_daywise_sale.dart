// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions
import 'dart:convert';

Future<List<dynamic>> getDaywiseSale(List<dynamic> data) async {
  List<dynamic> list = [];
  List<dynamic> finalList = [];
  List<dynamic> prd = [];

  List<dynamic> prdDetails = [];
  List<dynamic> catDetails = [];
  List<String> catIdList = [];
  int count = 0;
  int countMain = 0;
  for (int i = 0; i < data.length; i++) {
    countMain++;
    var entryList = data[i]["productSale"].entries.toList();
    entryList.forEach((item) {
      // print(item);
      var value1 = item.value;
      var value2 = value1.entries.toList();
      prd.add({
        "prdId": item.key.toString(),
        "price": double.parse(value2[0].key),
        "qty": value2[0].value
      });
    });
    if (countMain == data.length) {
      var doc;
      for (int i = 0; i < prd.length; i++) {
        FirebaseFirestore.instance
            .collection('OUTLET')
            .doc(FFAppState().outletId)
            .collection('PRODUCT')
            .where(FieldPath.documentId, isEqualTo: prd[i]["prdId"])
            .get()
            .then((QuerySnapshot querySnapshot) {
          count++;
          querySnapshot.docs.forEach((doc) {
            prdDetails.add({
              "prdId": prd[i]["prdId"],
              "price": prd[i]["price"],
              "qty": prd[i]["qty"],
              "prdName": doc["name"],
              "shortName": doc["shortName"],
              "catId": doc["category"],
              "catTotal": prd[i]["price"] * prd[i]["qty"],
              //"catTotal": price * qty,
            });
            catIdList.add(doc["category"]);
            //  print(catIdList);
          });
          if (count == prd.length) {
            int catCount = 0;
            var distinctCatIdList = catIdList.toSet().toList();
            print(distinctCatIdList);
            for (int k = 0; k < distinctCatIdList.length; k++) {
              FirebaseFirestore.instance
                  .collection('OUTLET')
                  .doc(FFAppState().outletId)
                  .collection('CATEGORY')
                  .where(FieldPath.documentId, isEqualTo: distinctCatIdList[k])
                  .get()
                  .then((QuerySnapshot querySnapshot1) {
                catCount++;
                querySnapshot1.docs.forEach((doc) {
                  catDetails.add(
                      {"catId": doc.id, "catName": doc["name"], "catTotal": 0});
                  print(catDetails);
                });
                if (catCount == catDetails.length) {
                  for (int k = 0; k < catDetails.length; k++) {
                    List<dynamic> temp1 = [];
                    prdDetails.forEach((element) {
                      if (catDetails[k]["catId"] == element["catId"]) {
                        catDetails[k]["catTotal"] =
                            catDetails[k]["catTotal"] + element["catTotal"];
                        //  console.log(details[i]);
                        temp1.add(element);
                      }
                    });
                    list.add({"category": catDetails[k], "products": temp1});
                  }
                  print("final");

                  finalList.add({"details": list});
                  print(finalList);
                  FFAppState().reportDetails = finalList;
                  return finalList;
                }
              });
            }

            //Cat
          }
        });
      }
    }
  }
  return finalList;
}
