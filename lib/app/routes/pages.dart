// import 'package:flutter_com_getx/app/modules/auth/binding/sign_in_binding.dart';
import 'package:flutter_com_getx/app/modules/auth/view/sign_in_view.dart';
import 'package:flutter_com_getx/app/modules/auth/view/sign_up_view.dart';
import 'package:flutter_com_getx/app/modules/base/views/base_view.dart';
import 'package:flutter_com_getx/app/modules/splash/splash.dart';
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
      page: () => SignInView(),
      // binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.signup,
      page: () => SignUpView(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const BaseView(),
    ),
  ];
}
