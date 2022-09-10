import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/custom.dart';
import 'package:flutter_com_getx/app/models/auth/controller/sign_in_controller.dart';
import 'package:flutter_com_getx/app/routes/pages.dart';
import 'package:get/get.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

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
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) return 'Email obrigatório';
                      if (!GetUtils.isEmail(value)) {
                        return 'Digite um email válido.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: CustomPadding.padding_4),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                  SizedBox(height: CustomPadding.padding_4),
                  Obx(
                    () => ElevatedButton(
                      onPressed: () async {
                        if (controller.formKey.currentState!.validate()) {
                          await controller.signIn(email: '', password: '');
                          Get.offAllNamed(Routes.home);
                        }
                      },
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator()
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
