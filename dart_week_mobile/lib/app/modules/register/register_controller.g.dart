// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$loginAtom = Atom(name: '_RegisterControllerBase.login');

  @override
  String get login {
    _$loginAtom.context.enforceReadPolicy(_$loginAtom);
    _$loginAtom.reportObserved();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.context.conditionallyRunInAction(() {
      super.login = value;
      _$loginAtom.reportChanged();
    }, _$loginAtom, name: '${_$loginAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_RegisterControllerBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$passwordAgainAtom =
      Atom(name: '_RegisterControllerBase.passwordAgain');

  @override
  String get passwordAgain {
    _$passwordAgainAtom.context.enforceReadPolicy(_$passwordAgainAtom);
    _$passwordAgainAtom.reportObserved();
    return super.passwordAgain;
  }

  @override
  set passwordAgain(String value) {
    _$passwordAgainAtom.context.conditionallyRunInAction(() {
      super.passwordAgain = value;
      _$passwordAgainAtom.reportChanged();
    }, _$passwordAgainAtom, name: '${_$passwordAgainAtom.name}_set');
  }

  final _$_registerFutureAtom =
      Atom(name: '_RegisterControllerBase._registerFuture');

  @override
  ObservableFuture<dynamic> get _registerFuture {
    _$_registerFutureAtom.context.enforceReadPolicy(_$_registerFutureAtom);
    _$_registerFutureAtom.reportObserved();
    return super._registerFuture;
  }

  @override
  set _registerFuture(ObservableFuture<dynamic> value) {
    _$_registerFutureAtom.context.conditionallyRunInAction(() {
      super._registerFuture = value;
      _$_registerFutureAtom.reportChanged();
    }, _$_registerFutureAtom, name: '${_$_registerFutureAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_RegisterControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  dynamic changeLogin(String loginValue) {
    final _$actionInfo =
        _$_RegisterControllerBaseActionController.startAction();
    try {
      return super.changeLogin(loginValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String passwordValue) {
    final _$actionInfo =
        _$_RegisterControllerBaseActionController.startAction();
    try {
      return super.changePassword(passwordValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePasswordAgain(String passwordAgainValue) {
    final _$actionInfo =
        _$_RegisterControllerBaseActionController.startAction();
    try {
      return super.changePasswordAgain(passwordAgainValue);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'login: ${login.toString()},password: ${password.toString()},passwordAgain: ${passwordAgain.toString()},errorMessage: ${errorMessage.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
