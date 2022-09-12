import 'package:get/get_utils/src/get_utils/get_utils.dart';

String? emailValidator(String? email) {
  if (email!.isEmpty) return 'Email obrigatório';
  if (!GetUtils.isEmail(email)) {
    return 'Digite um email válido.';
  }
  return null;
}
