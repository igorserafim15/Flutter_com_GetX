import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/constants/endpoints.dart';
import 'package:flutter_com_getx/app/utils/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signin({
    required String email,
    required String password,
  }) async {
    final response = await _httpManager.restPOST(
      url: Endpoints.signin,
      body: {
        'email': email,
        'password': password,
      }
    );

    if(response.statusCode == 200) {
      
    } else {
      debugPrint('Error type: ${response.statusCode}');
    }
  }
}
