import 'package:flutter_com_getx/app/models/auth/controller/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignInController>(SignInController());
  }

}