import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/custom/custom.dart';
import 'package:flutter_com_getx/app/globals/utils/validators.dart';
import 'package:flutter_com_getx/app/modules/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class SignUpView extends GetView<AuthController> {
  SignUpView({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastre-se')),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(CustomPadding.padding_4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  onSaved: (value) => controller.user.email = value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: emailValidator,
                ),
                SizedBox(height: CustomPadding.padding_4),
                TextFormField(
                  onSaved: (value) => controller.user.password = value,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(height: CustomPadding.padding_4),
                TextFormField(
                  onSaved: (value) => controller.user.name = value,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: CustomPadding.padding_4),
                TextFormField(
                  onSaved: (value) => controller.user.phone = value,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'WhatsApp',
                    prefixIcon: Icon(Icons.whatsapp),
                  ),
                ),
                SizedBox(height: CustomPadding.padding_4),
                TextFormField(
                  onSaved: (value) => controller.user.cpf = value,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'CPF',
                    prefixIcon: Icon(Icons.notes_sharp),
                  ),
                ),
                SizedBox(height: CustomPadding.padding_4),
                Obx(
                  () => ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () {
                          FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              controller.signUp();
                            }
                          },
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text('Cadastrar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
