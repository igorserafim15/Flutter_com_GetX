import 'package:flutter_com_getx/app/modules/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
  }

}