// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_transaction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterTransactionController
    on _RegisterTransactionControllerBase, Store {
  Computed<StoreState> _$stateListCategoryComputed;

  @override
  StoreState get stateListCategory => (_$stateListCategoryComputed ??=
          Computed<StoreState>(() => super.stateListCategory))
      .value;
  Computed<StoreState> _$stateNewTransactionComputed;

  @override
  StoreState get stateNewTransaction => (_$stateNewTransactionComputed ??=
          Computed<StoreState>(() => super.stateNewTransaction))
      .value;

  final _$dateInsertAtom =
      Atom(name: '_RegisterTransactionControllerBase.dateInsert');

  @override
  DateTime get dateInsert {
    _$dateInsertAtom.context.enforceReadPolicy(_$dateInsertAtom);
    _$dateInsertAtom.reportObserved();
    return super.dateInsert;
  }

  @override
  set dateInsert(DateTime value) {
    _$dateInsertAtom.context.conditionallyRunInAction(() {
      super.dateInsert = value;
      _$dateInsertAtom.reportChanged();
    }, _$dateInsertAtom, name: '${_$dateInsertAtom.name}_set');
  }

  final _$categoryModelAtom =
      Atom(name: '_RegisterTransactionControllerBase.categoryModel');

  @override
  CategoryModel get categoryModel {
    _$categoryModelAtom.context.enforceReadPolicy(_$categoryModelAtom);
    _$categoryModelAtom.reportObserved();
    return super.categoryModel;
  }

  @override
  set categoryModel(CategoryModel value) {
    _$categoryModelAtom.context.conditionallyRunInAction(() {
      super.categoryModel = value;
      _$categoryModelAtom.reportChanged();
    }, _$categoryModelAtom, name: '${_$categoryModelAtom.name}_set');
  }

  final _$descriptionAtom =
      Atom(name: '_RegisterTransactionControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_RegisterTransactionControllerBase.value');

  @override
  double get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$validCategoryAtom =
      Atom(name: '_RegisterTransactionControllerBase.validCategory');

  @override
  bool get validCategory {
    _$validCategoryAtom.context.enforceReadPolicy(_$validCategoryAtom);
    _$validCategoryAtom.reportObserved();
    return super.validCategory;
  }

  @override
  set validCategory(bool value) {
    _$validCategoryAtom.context.conditionallyRunInAction(() {
      super.validCategory = value;
      _$validCategoryAtom.reportChanged();
    }, _$validCategoryAtom, name: '${_$validCategoryAtom.name}_set');
  }

  final _$categoryModelListAtom =
      Atom(name: '_RegisterTransactionControllerBase.categoryModelList');

  @override
  List<CategoryModel> get categoryModelList {
    _$categoryModelListAtom.context.enforceReadPolicy(_$categoryModelListAtom);
    _$categoryModelListAtom.reportObserved();
    return super.categoryModelList;
  }

  @override
  set categoryModelList(List<CategoryModel> value) {
    _$categoryModelListAtom.context.conditionallyRunInAction(() {
      super.categoryModelList = value;
      _$categoryModelListAtom.reportChanged();
    }, _$categoryModelListAtom, name: '${_$categoryModelListAtom.name}_set');
  }

  final _$categoryTypeSelectedAtom =
      Atom(name: '_RegisterTransactionControllerBase.categoryTypeSelected');

  @override
  String get categoryTypeSelected {
    _$categoryTypeSelectedAtom.context
        .enforceReadPolicy(_$categoryTypeSelectedAtom);
    _$categoryTypeSelectedAtom.reportObserved();
    return super.categoryTypeSelected;
  }

  @override
  set categoryTypeSelected(String value) {
    _$categoryTypeSelectedAtom.context.conditionallyRunInAction(() {
      super.categoryTypeSelected = value;
      _$categoryTypeSelectedAtom.reportChanged();
    }, _$categoryTypeSelectedAtom,
        name: '${_$categoryTypeSelectedAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_RegisterTransactionControllerBase.errorMessage');

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

  final _$_categoriesFutureAtom =
      Atom(name: '_RegisterTransactionControllerBase._categoriesFuture');

  @override
  ObservableFuture<List<CategoryModel>> get _categoriesFuture {
    _$_categoriesFutureAtom.context.enforceReadPolicy(_$_categoriesFutureAtom);
    _$_categoriesFutureAtom.reportObserved();
    return super._categoriesFuture;
  }

  @override
  set _categoriesFuture(ObservableFuture<List<CategoryModel>> value) {
    _$_categoriesFutureAtom.context.conditionallyRunInAction(() {
      super._categoriesFuture = value;
      _$_categoriesFutureAtom.reportChanged();
    }, _$_categoriesFutureAtom, name: '${_$_categoriesFutureAtom.name}_set');
  }

  final _$_newTransactionFutureAtom =
      Atom(name: '_RegisterTransactionControllerBase._newTransactionFuture');

  @override
  ObservableFuture<dynamic> get _newTransactionFuture {
    _$_newTransactionFutureAtom.context
        .enforceReadPolicy(_$_newTransactionFutureAtom);
    _$_newTransactionFutureAtom.reportObserved();
    return super._newTransactionFuture;
  }

  @override
  set _newTransactionFuture(ObservableFuture<dynamic> value) {
    _$_newTransactionFutureAtom.context.conditionallyRunInAction(() {
      super._newTransactionFuture = value;
      _$_newTransactionFutureAtom.reportChanged();
    }, _$_newTransactionFutureAtom,
        name: '${_$_newTransactionFutureAtom.name}_set');
  }

  final _$getAllCategoriesAsyncAction = AsyncAction('getAllCategories');

  @override
  Future<void> getAllCategories(String categoryType) {
    return _$getAllCategoriesAsyncAction
        .run(() => super.getAllCategories(categoryType));
  }

  final _$saveTransactionAsyncAction = AsyncAction('saveTransaction');

  @override
  Future<void> saveTransaction() {
    return _$saveTransactionAsyncAction.run(() => super.saveTransaction());
  }

  final _$_RegisterTransactionControllerBaseActionController =
      ActionController(name: '_RegisterTransactionControllerBase');

  @override
  void setDateInsert(DateTime date) {
    final _$actionInfo =
        _$_RegisterTransactionControllerBaseActionController.startAction();
    try {
      return super.setDateInsert(date);
    } finally {
      _$_RegisterTransactionControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeCategory(CategoryModel categoryModelValue) {
    final _$actionInfo =
        _$_RegisterTransactionControllerBaseActionController.startAction();
    try {
      return super.changeCategory(categoryModelValue);
    } finally {
      _$_RegisterTransactionControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeDescription(String descriptionValue) {
    final _$actionInfo =
        _$_RegisterTransactionControllerBaseActionController.startAction();
    try {
      return super.changeDescription(descriptionValue);
    } finally {
      _$_RegisterTransactionControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void changeValue(double valueValue) {
    final _$actionInfo =
        _$_RegisterTransactionControllerBaseActionController.startAction();
    try {
      return super.changeValue(valueValue);
    } finally {
      _$_RegisterTransactionControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetForm() {
    final _$actionInfo =
        _$_RegisterTransactionControllerBaseActionController.startAction();
    try {
      return super.resetForm();
    } finally {
      _$_RegisterTransactionControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'dateInsert: ${dateInsert.toString()},categoryModel: ${categoryModel.toString()},description: ${description.toString()},value: ${value.toString()},validCategory: ${validCategory.toString()},categoryModelList: ${categoryModelList.toString()},categoryTypeSelected: ${categoryTypeSelected.toString()},errorMessage: ${errorMessage.toString()},stateListCategory: ${stateListCategory.toString()},stateNewTransaction: ${stateNewTransaction.toString()}';
    return '{$string}';
  }
}
