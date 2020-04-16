// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_panel_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BalancePanelController on _BalancePanelControllerBase, Store {
  Computed<String> _$yearMonthComputed;

  @override
  String get yearMonth =>
      (_$yearMonthComputed ??= Computed<String>(() => super.yearMonth)).value;
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$dateAtom = Atom(name: '_BalancePanelControllerBase.date');

  @override
  DateTime get date {
    _$dateAtom.context.enforceReadPolicy(_$dateAtom);
    _$dateAtom.reportObserved();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.context.conditionallyRunInAction(() {
      super.date = value;
      _$dateAtom.reportChanged();
    }, _$dateAtom, name: '${_$dateAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_BalancePanelControllerBase.errorMessage');

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

  final _$_totalTransactionAtom =
      Atom(name: '_BalancePanelControllerBase._totalTransaction');

  @override
  ObservableFuture<TransactionTotalModel> get _totalTransaction {
    _$_totalTransactionAtom.context.enforceReadPolicy(_$_totalTransactionAtom);
    _$_totalTransactionAtom.reportObserved();
    return super._totalTransaction;
  }

  @override
  set _totalTransaction(ObservableFuture<TransactionTotalModel> value) {
    _$_totalTransactionAtom.context.conditionallyRunInAction(() {
      super._totalTransaction = value;
      _$_totalTransactionAtom.reportChanged();
    }, _$_totalTransactionAtom, name: '${_$_totalTransactionAtom.name}_set');
  }

  final _$transactionTotalModelAtom =
      Atom(name: '_BalancePanelControllerBase.transactionTotalModel');

  @override
  TransactionTotalModel get transactionTotalModel {
    _$transactionTotalModelAtom.context
        .enforceReadPolicy(_$transactionTotalModelAtom);
    _$transactionTotalModelAtom.reportObserved();
    return super.transactionTotalModel;
  }

  @override
  set transactionTotalModel(TransactionTotalModel value) {
    _$transactionTotalModelAtom.context.conditionallyRunInAction(() {
      super.transactionTotalModel = value;
      _$transactionTotalModelAtom.reportChanged();
    }, _$transactionTotalModelAtom,
        name: '${_$transactionTotalModelAtom.name}_set');
  }

  final _$getYearMonthTotalAsyncAction = AsyncAction('getYearMonthTotal');

  @override
  Future getYearMonthTotal() {
    return _$getYearMonthTotalAsyncAction.run(() => super.getYearMonthTotal());
  }

  final _$_BalancePanelControllerBaseActionController =
      ActionController(name: '_BalancePanelControllerBase');

  @override
  dynamic nextMonth() {
    final _$actionInfo =
        _$_BalancePanelControllerBaseActionController.startAction();
    try {
      return super.nextMonth();
    } finally {
      _$_BalancePanelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic previousMonth() {
    final _$actionInfo =
        _$_BalancePanelControllerBaseActionController.startAction();
    try {
      return super.previousMonth();
    } finally {
      _$_BalancePanelControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'date: ${date.toString()},errorMessage: ${errorMessage.toString()},transactionTotalModel: ${transactionTotalModel.toString()},yearMonth: ${yearMonth.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
