import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/repositories/user_repository.dart';
import 'package:dart_week_mobile/app/shared/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final UserRepository userRepository;

  _RegisterControllerBase(
    this.userRepository,
  );

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @observable
  String login;

  @observable
  String password;

  @observable
  String passwordAgain;

  @observable
  ObservableFuture _registerFuture;

  @observable
  String errorMessage;

  @action
  changeLogin(String loginValue) => login = loginValue;

  @action
  changePassword(String passwordValue) => password = passwordValue;

  @action
  changePasswordAgain(String passwordAgainValue) =>
      passwordAgain = passwordAgainValue;

  @computed
  StoreState get state => StoreUtils.statusCheck(_registerFuture);

  Future<void> saveUSer() async {
    if (globalKey.currentState.validate()) {
      try {
        errorMessage = '';
        _registerFuture = ObservableFuture(
          userRepository.saveUser(
            login,
            password,
          ),
        );
        await _registerFuture;
      } catch (e) {
        print(e);
        errorMessage = 'Erro ao cadastrar o usuário';
      }
    }
  }
}
