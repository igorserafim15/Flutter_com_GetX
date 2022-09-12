import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/user/user_model.dart';
import 'package:flutter_com_getx/app/globals/utils/utils.dart';
import 'package:flutter_com_getx/app/modules/auth/repository/auth_repository.dart';
import 'package:flutter_com_getx/app/routes/pages.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  User user = User();

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 2));
    validateToken();
  }

  final authRepository = AuthRepository();
  final helps = Helps();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    final resultUser = await authRepository.signin(
      email: email,
      password: password,
    );

    if (resultUser != null) {
      user = resultUser;
      helps.saveLocalDate(key: 'token', data: user.token!);
      Get.offAllNamed(Routes.home);
    } else {
      Get.snackbar('Erro', 'Email ou senha incorretos');
    }

    isLoading.value = false;
  }

  Future validateToken() async {
    String? token = await helps.getLocalData(key: 'token');

    if (token == null) {
      Get.offAllNamed(Routes.signin);
      return;
    }
    final resultUser = await authRepository.validateToken(token);
    if (resultUser != null) {
      user = resultUser;
      Get.offAllNamed(Routes.home);
    } else {
      signOut();
      Get.snackbar('Token', 'Sua sessão inspirou. Faça login novamente.');
    }
  }

  Future signOut() async {
    user = User();
    await helps.removeLocalData(key: 'token');
    Get.offAllNamed(Routes.signin);
  }

  Future signUp() async {
    isLoading.value = true;
    print(user);
    final resultUser = await authRepository.signup(user);

    if (resultUser != null) {
      user = resultUser;
      helps.saveLocalDate(key: 'token', data: user.token!);
      Get.offAllNamed(Routes.home);
    } else {
      Get.snackbar(
        'Cadastro',
        'Não foi possível realizar seu cadastro. Por favor, tente novamente.',
      );
    }

    isLoading.value = false;
  }
}
