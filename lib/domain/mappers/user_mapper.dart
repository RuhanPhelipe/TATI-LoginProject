import 'dart:convert';

import '../entity/user.dart';

abstract class UserMapper {
  static User clone(User instace) => User(
        id: instace.id,
        login: instace.login,
        name: instace.name,
        email: instace.email,
        cell: instace.cell,
        password: instace.password,
      );

  static Map<String, dynamic> fromEntityToMap(User instance) {
    return {
      'id': instance.id,
      'login': instance.login,
      'name': instance.name,
      'email': instance.email,
      'cell': instance.cell,
      'password': instance.password
    };
  }

  static User fromMapToEntity(Map<String, dynamic> map) {
    return User(
        id: map['id'],
        login: map['login'],
        name: map['name'],
        email: map['email'],
        cell: map['cell'],
        password: map['password']);
  }

  static User fromJsonToEntity(String source) =>
      fromMapToEntity(json.decode(source));

  static String fromEntityToJson(User instance) =>
      json.encode(fromEntityToMap(instance));
}
