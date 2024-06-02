import 'package:get/get_connect/http/src/status/http_status.dart';

import 'api_exception.dart';

class NotFoundException extends ApiException {
  NotFoundException(String message, String status)
      : super(httpCode: HttpStatus.notFound, status: status, message: message);
}
