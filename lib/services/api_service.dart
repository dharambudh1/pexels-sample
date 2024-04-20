import "dart:convert";
import "dart:developer";

import "package:get/get.dart";
import "package:get/get_connect/http/src/status/http_status.dart";
import "package:logger/logger.dart";

class APIService extends GetConnect {
  factory APIService() {
    return _singleton;
  }

  APIService._internal();
  static final APIService _singleton = APIService._internal();

  final Logger logger = Logger();

  final String baseURL = "https://api.pexels.com/v1";
  final String key = "RfCXgHh6shOELyv2DEiC7yszAdhChynzxUDgxKTXqODLdF5CXbW6Juxz";

  Future<void> functionGet({
    required String endPoint,
    required int page,
    required int perPage,
    required Function(Map<String, dynamic> json) successCallback,
    required Function(Map<String, dynamic> json) failureCallback,
  }) async {
    try {
      final Response<dynamic> response = await get(
        "$baseURL$endPoint",
        contentType: "application/json",
        headers: <String, String>{"Authorization": key},
        query: <String, String>{
          "page": page.toString(),
          "per_page": perPage.toString(),
        },
      );
      if (response.body is Map<String, dynamic>) {
        log(const JsonEncoder.withIndent("  ").convert(response.body));

        response.statusCode == HttpStatus.ok
            ? successCallback(response.body)
            : failureCallback(response.body);
      } else {
        failureCallback(<String, dynamic>{"code": "Unknown error occurred"});
      }
    } on Exception catch (error, stackTrace) {
      Logger().e("functionGet() catch:", error: error, stackTrace: stackTrace);

      failureCallback(<String, dynamic>{"code": error});
    } finally {}
    return Future<void>.value();
  }
}
