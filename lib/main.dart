import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/routes/pages.dart';
import 'package:flutter_com_getx/theme.dart';
import 'package:get/get.dart';

void main() {
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
      initialRoute: Routes.signin,
      getPages: Pages.routes,
    );
  }
}
