import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ShiftSummaryCall {
  static Future<ApiCallResponse> call({
    String? outletId = '',
    String? dayId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'shiftSummary',
      apiUrl:
          'https://asia-south1-sconnect-pos.cloudfunctions.net/ShiftSummary',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'outletId': outletId,
        'dayId': dayId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? no(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].shiftNo''',
      ));
}

class DayWiseSaleCall {
  static Future<ApiCallResponse> call({
    String? outletId = '',
    String? dayId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'dayWiseSale',
      apiUrl:
          'https://asia-south1-sconnect-pos.cloudfunctions.net/ShiftSummary-1',
      callType: ApiCallType.GET,
      headers: {
        'Access-Control-Allow-Origin':
            'https://ff-debug-service-frontend-pro-ygxkweukma-uc.a.run.app',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'GET',
      },
      params: {
        'outletId': outletId,
        'dayId': dayId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SendMailCall {
  static Future<ApiCallResponse> call({
    String? outletName = '',
    String? file = '',
    String? fileName = '',
    String? toEmail = '',
    String? branchName = '',
    String? username = '',
    String? mobileNo = '',
    String? roll = '',
  }) async {
    final ffApiRequestBody = '''
{
  "outletName": "${outletName}",
  "branchName": "${branchName}",
  "userName": "${username}",
  "userMobileNumber": "${mobileNo}",
  "userRoll": "${roll}",
  "reportType": "GST SALE REPORT",
  "file": "${file}",
  "fileName": "${fileName}",
  "toEmail": "${toEmail}",
  "ccEmail": "rohit.sensibleconnect@gmail.com"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendMail',
      apiUrl:
          'https://asia-south1-sconnect-pos.cloudfunctions.net/msg91Mail/send_mail',
      callType: ApiCallType.POST,
      headers: {
        'Access-Control-Allow-Origin':
            'https://ff-debug-service-frontend-pro-ygxkweukma-uc.a.run.app',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'POST',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetCustomDateSaleCall {
  static Future<ApiCallResponse> call({
    String? outletId = '',
    int? start,
    int? end,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCustomDateSale',
      apiUrl:
          'https://asia-south1-sconnect-pos.cloudfunctions.net/ShiftSummaryRangeWise',
      callType: ApiCallType.GET,
      headers: {
        'Access-Control-Allow-Origin':
            'https://ff-debug-service-frontend-pro-ygxkweukma-uc.a.run.app',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'GET',
      },
      params: {
        'outletId': outletId,
        'start': start,
        'end': end,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
