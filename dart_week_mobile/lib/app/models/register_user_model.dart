import 'dart:convert';

class RegisterUserModel {
  final String login;
  final String passwird;

  RegisterUserModel({
    this.login,
    this.passwird,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'passwird': passwird,
    };
  }

  static RegisterUserModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return RegisterUserModel(
      login: map['login'],
      passwird: map['passwird'],
    );
  }

  String toJson() => json.encode(toMap());

  static RegisterUserModel fromJson(String source) =>
      fromMap(json.decode(source));
}
