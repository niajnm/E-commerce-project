import 'package:get/get_connect/http/src/status/http_status.dart';

import 'base_api_exception.dart';

class ServiceUnavailableException extends BaseApiException {
  ServiceUnavailableException(String message)
      : super(
      httpCode: HttpStatus.serviceUnavailable,
      message: message,
      status: "");
}