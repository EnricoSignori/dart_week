// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionController on _TransactionControllerBase, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$errorMessageAtom =
      Atom(name: '_TransactionControllerBase.errorMessage');

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

  final _$_transactionFutureAtom =
      Atom(name: '_TransactionControllerBase._transactionFuture');

  @override
  ObservableFuture<List<TransactionModel>> get _transactionFuture {
    _$_transactionFutureAtom.context
        .enforceReadPolicy(_$_transactionFutureAtom);
    _$_transactionFutureAtom.reportObserved();
    return super._transactionFuture;
  }

  @override
  set _transactionFuture(ObservableFuture<List<TransactionModel>> value) {
    _$_transactionFutureAtom.context.conditionallyRunInAction(() {
      super._transactionFuture = value;
      _$_transactionFutureAtom.reportChanged();
    }, _$_transactionFutureAtom, name: '${_$_transactionFutureAtom.name}_set');
  }

  final _$transactionsAtom =
      Atom(name: '_TransactionControllerBase.transactions');

  @override
  ObservableList<TransactionModel> get transactions {
    _$transactionsAtom.context.enforceReadPolicy(_$transactionsAtom);
    _$transactionsAtom.reportObserved();
    return super.transactions;
  }

  @override
  set transactions(ObservableList<TransactionModel> value) {
    _$transactionsAtom.context.conditionallyRunInAction(() {
      super.transactions = value;
      _$transactionsAtom.reportChanged();
    }, _$transactionsAtom, name: '${_$transactionsAtom.name}_set');
  }

  final _$getTransactionsAsyncAction = AsyncAction('getTransactions');

  @override
  Future<void> getTransactions() {
    return _$getTransactionsAsyncAction.run(() => super.getTransactions());
  }

  @override
  String toString() {
    final string =
        'errorMessage: ${errorMessage.toString()},transactions: ${transactions.toString()},state: ${state.toString()}';
    return '{$string}';
  }
}
