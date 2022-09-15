// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
      cpf: json['cpf'] as String?,
      id: json['id'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'password': instance.password,
      'cpf': instance.cpf,
      'id': instance.id,
      'token': instance.token,
    };
