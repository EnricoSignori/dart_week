import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/repositories/user_repository.dart';
import 'package:dart_week_mobile/app/shared/utils/store_utils.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserRepository userRepository;

  _LoginControllerBase(
    this.userRepository,
  );

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @observable
  String login;

  @observable
  String password;

  @observable
  ObservableFuture<bool> _loginFuture;

  @observable
  bool loginSuccess;

  @observable
  String errorMessage;

  @action
  changeLogin(String loginValue) => login = loginValue;

  @action
  changePassword(String passwordValue) => password = passwordValue;

  @computed
  StoreState get state => StoreUtils.statusCheck(_loginFuture);

  @action
  Future<void> requestLogin() async {
    if (globalKey.currentState.validate()) {
      try {
        errorMessage = '';
        loginSuccess = null;
        _loginFuture = ObservableFuture(
          userRepository.login(
            login,
            password,
          ),
        );
        loginSuccess = await _loginFuture;
      } catch (e) {
        print(e);
        errorMessage = 'Erro ao realizar Login';
      }
    }
  }
}
