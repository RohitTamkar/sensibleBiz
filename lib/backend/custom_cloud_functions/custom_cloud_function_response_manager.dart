import '/backend/schema/structs/index.dart';

class LogoutFromOtherDevicesCloudFunctionCallResponse {
  LogoutFromOtherDevicesCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
}
