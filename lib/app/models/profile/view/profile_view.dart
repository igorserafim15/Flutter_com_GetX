import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/globals/custom.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil do usuário')),
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
