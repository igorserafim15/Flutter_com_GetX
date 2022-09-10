import 'package:flutter_com_getx/app/models/auth/binding/sign_in_binding.dart';
import 'package:flutter_com_getx/app/models/auth/view/sign_in_view.dart';
import 'package:flutter_com_getx/app/models/auth/view/sign_up_view.dart';
import 'package:flutter_com_getx/app/models/base/views/base_view.dart';
import 'package:flutter_com_getx/app/models/splash/splash.dart';
import 'package:get/get.dart';

part 'routes.dart';

abstract class Pages {
  static final routes = <GetPage>[
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.signin,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.signup,
      page: () => const SignUpView(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const BaseView(),
    ),
  ];
}
