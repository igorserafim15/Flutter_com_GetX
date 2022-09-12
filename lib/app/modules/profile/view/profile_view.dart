import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/custom/custom.dart';
import 'package:flutter_com_getx/app/modules/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () => controller.signOut(),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: CustomPadding.padding_4),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nome',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(height: CustomPadding.padding_4),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Celular',
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          SizedBox(height: CustomPadding.padding_4),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'CPF',
              prefixIcon: Icon(Icons.notes_sharp),
            ),
          ),
          SizedBox(height: CustomPadding.padding_4),
        ],
      ),
    );
  }
}
