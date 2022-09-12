const String baseUrl = 'https://parseapi.back4app.com/functions';

abstract class Endpoints {
  static const String signin = '$baseUrl/login';
  static const String signup = '$baseUrl/signup';
  static const String validateToken = '$baseUrl/validate-token';
}

abstract class HttpConstants {
  static const Map<String, String> defaultHeaders = {
    // 'content-type': 'application/json',
    // 'accept': 'application/json',
    'X-Parse-Application-Id': 'g1Oui3JqxnY4S1ykpQWHwEKGOe0dRYCPvPF4iykc',
    'X-Parse-REST-API-Key': 'rFBKU8tk0m5ZlKES2CGieOaoYz6TgKxVMv8jRIsN'
  };
}
