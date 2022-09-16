import 'package:flutter_com_getx/app/modules/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
  
AuthController auth = Get.find();

class HomeController extends GetxController {

  String nomeHome = auth.name;
}