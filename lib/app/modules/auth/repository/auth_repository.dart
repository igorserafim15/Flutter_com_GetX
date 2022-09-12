import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/constants/http_constants.dart';
import 'package:flutter_com_getx/app/globals/user/user_model.dart';
import 'package:flutter_com_getx/app/globals/utils/http_manager.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  User? handleUserOrError(http.Response response) {
    if (response.statusCode == 200) {
      final decode = jsonDecode(response.body)['result'];
      final User user = User.fromJson(decode);
      return user;
    } else {
      debugPrint('Error type: ${response.statusCode}');
    }
    return null;
  }

  // sign in
  Future<User?> signin({
    required String email,
    required String password,
  }) async {
    final response = await _httpManager.restPOST(
      url: Endpoints.signin,
      body: {
        'email': email,
        'password': password,
      },
    );

    return handleUserOrError(response);
  }

  // validate token
  Future<User?> validateToken(String token) async {
    final response = await _httpManager.restPOST(
      url: Endpoints.validateToken,
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    return handleUserOrError(response);
  }

  // sign up
  Future<User?> signup(User user) async {

    final response = await _httpManager.restPOST(
      url: Endpoints.signup,
      body: user.toJson(),
    );
    
    return handleUserOrError(response);
  }
}
