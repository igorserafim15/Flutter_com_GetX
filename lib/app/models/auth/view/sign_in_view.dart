import 'package:flutter/material.dart';
import 'package:flutter_com_getx/app/models/auth/view/sign_up_view.dart';
import 'package:flutter_com_getx/app/globals/custom.dart';
import 'package:flutter_com_getx/app/models/base/views/base_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(CustomPadding.padding_4),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo obrigatório.';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
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
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const BaseView(),
                          ),
                        );
                      }
                    },
                    child: const Text('Entrar'),
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
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpView(),
                      ),
                    ),
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
