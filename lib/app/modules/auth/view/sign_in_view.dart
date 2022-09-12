import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/custom/custom.dart';
import 'package:flutter_com_getx/app/globals/utils/validators.dart';
import 'package:flutter_com_getx/app/modules/auth/controller/auth_controller.dart';
import 'package:flutter_com_getx/app/routes/pages.dart';
import 'package:get/get.dart';

class SignInView extends GetView<AuthController> {
  SignInView({Key? key}) : super(key: key);

  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(CustomPadding.padding_4),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: emailEC,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: emailValidator,
                  ),
                  SizedBox(height: CustomPadding.padding_4),
                  TextFormField(
                    controller: passwordEC,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(height: CustomPadding.padding_4),
                  Obx(
                    () => ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : () async {
                              FocusScope.of(context).unfocus();
                              if (controller.formKey.currentState!.validate()) {
                                await controller.signIn(
                                  email: emailEC.text,
                                  password: passwordEC.text,
                                );
                              }
                            },
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('Entrar'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Esqueceu sua senha?'),
                  ),
                  const SizedBox(
                    height: 40,
                    child: Divider(thickness: 1.5),
                  ),
                  OutlinedButton(
                    onPressed: () => Get.toNamed(Routes.signup),
                    child: const Text('Criar conta'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
