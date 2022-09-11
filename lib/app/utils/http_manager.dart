import 'package:http/http.dart' as http;

class HttpManager {
  Future<http.Response> restPOST({
    required String url,
    Map<String, String>? headers,
    Map? body,
  }) async {
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    try {
      return response;
    } catch(err) {
      throw Exception('Erro na requisição POST: $err');
    }
  }

  Future<http.Response> restGET({
    required String url,
    Map<String, String>? headers,
  }) async {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    try {
      return response;
    } catch(err) {
      throw Exception('Erro na requisição GET: $err');
    }
  }
}