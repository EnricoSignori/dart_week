import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/custom_dio.dart';

class UserRepository {
  Future<bool> isLogged() async {
    final String? token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<bool> login(String login, String password) async {
    final dio = CustomDio().instance;

    final res = await dio.post('/login', data: {
      'login': login,
      'password': password,
    });

    final String? token = res.data['token'];

    if (token != null && token.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      return true;
    }

    return false;
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> saveUser(String login, String password) async {
    final Dio dio = CustomDio().instance;
    await dio.post(
      '/user',
      data: {
        'login': login,
        'password': password,
      },
    );
  }
}
