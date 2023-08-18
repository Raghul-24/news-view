import 'dart:developer';

import '../networking/http_service.dart';

class ApiService implements ApiInterface {
  final HttpService _httpService = HttpService();

  @override
  Future<T> getDocumentData<T>(
      {required String endpoint,
        JSON? queryParams,
        required T Function(JSON responseBody) converter,
        Function(bool)? onError}) async {
    final data = await _httpService.get(
      endpoint: endpoint,
      queryParams: queryParams,
    );
    log("return Type${data.runtimeType}");
    return converter(data);

  }
}

abstract class ApiInterface {
  const ApiInterface();

  Future<T> getDocumentData<T>(
      {required String endpoint,
        JSON? queryParams,
        required T Function(JSON responseBody) converter,
        final dynamic Function(bool)? onError});

}
