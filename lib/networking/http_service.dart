import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'network_check.dart';

typedef JSON = Map<String, dynamic>;
typedef QueryParams = Map<String, String>;

class HttpService {
  Future<JSON> get({
    required String endpoint,
    Map<String, String>? headers,
    JSON? queryParams,
    final dynamic Function(bool)? onError,
  }) async {
    final bool isNetworkAvailable = await NetworkCheck().check();
    if (isNetworkAvailable) {
      try {
        final response = await http.get(
          Uri.parse(endpoint),
          // headers: await addAuthenticationHeader(),
        );
        var responseJson = json.decode(response.body.toString());
        log("Data from API$responseJson");
        responseJson.putIfAbsent("status_code", () => response.statusCode);
        return responseJson;
      } on Exception catch (_) {}
    }
    return onError != null ? onError(isNetworkAvailable) : false;
  }
}

Future<Map<String, String>> addAuthenticationHeader() async {
  return {
    'Content-Type': 'application/json',
    'Host':'<calculated when request is sent>',
    'User-Agent':'PostmanRuntime/7.32.3',
    'Accept':'*/*',
    'Accept-Encoding':'gzip, deflate, br',
    'Connection':'keep-alive'
  };
}

