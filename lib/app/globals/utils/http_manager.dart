import 'package:flutter_com_getx/app/globals/constants/http_constants.dart';
import 'package:http/http.dart' as http;

class HttpManager {

  Future<http.Response> restPOST({
    required String url,
    Map<String, String>? headers,
    Map? body,
  }) async {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {...HttpConstants.defaultHeaders, ...?headers},
      body: body,
    );
    try {
      return response;
    } catch (err) {
      throw Exception('Exception: $err');
    }
  }

  Future<http.Response> restGET({
    required String url,
    Map<String, String>? headers,
  }) async {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {...HttpConstants.defaultHeaders, ...?headers},
    );
    try {
      return response;
    } catch (err) {
      throw Exception('Erro na requisição GET: $err');
    }
  }
}
