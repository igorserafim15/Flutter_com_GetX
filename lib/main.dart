import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/modules/auth/controller/auth_controller.dart';
import 'package:flutter_com_getx/app/routes/pages.dart';
import 'package:flutter_com_getx/theme.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());
  runApp(const MainView());
}

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: Routes.splash,
      getPages: Pages.routes,
    );
  }
}
