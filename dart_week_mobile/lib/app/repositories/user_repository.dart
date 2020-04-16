import 'package:dart_week_mobile/app/core/custom_dio.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<bool> isLogged() async {
    final String token = await this.getToken();
    return token != null;
  }

  Future<bool> login(String login, String password) {
    final dio = CustomDio().instance;

    return dio.post('/login', data: {
      'login': login,
      'password': password,
    }).then((res) async {
      final String token = res.data['token'];

      if (token != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        return true;
      }

      return false;
    });
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> saveUser(String login, String password) async {
    final Dio dio = CustomDio().instance;
    return dio.post(
      '/user',
      data: {
        'login': login,
        'password': password,
      },
    );
  }
}
