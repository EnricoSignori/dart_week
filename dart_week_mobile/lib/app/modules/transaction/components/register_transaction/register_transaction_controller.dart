import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/models/category_model.dart';
import 'package:dart_week_mobile/app/repositories/category_repository.dart';
import 'package:dart_week_mobile/app/repositories/transaction_repository.dart';
import 'package:dart_week_mobile/app/shared/utils/store_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'register_transaction_controller.g.dart';

class RegisterTransactionController = _RegisterTransactionControllerBase
    with _$RegisterTransactionController;

abstract class _RegisterTransactionControllerBase with Store {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final MoneyMaskedTextController moneyMaskedTextController =
      MoneyMaskedTextController(
    decimalSeparator: ',',
    thousandSeparator: '.',
  );
  final CategoryRepository _categoryRepository =
      Modular.get<CategoryRepository>();
  final TransactionRepository _transactionRepository =
      Modular.get<TransactionRepository>();

  @observable
  DateTime dateInsert = DateTime.now();

  @observable
  CategoryModel categoryModel;

  @observable
  String description;

  @observable
  double value;

  @observable
  bool validCategory = true;

  @observable
  List<CategoryModel> categoryModelList;

  @observable
  String categoryTypeSelected;

  @observable
  String errorMessage;

  @observable
  ObservableFuture<List<CategoryModel>> _categoriesFuture;

  @computed
  StoreState get stateListCategory => StoreUtils.statusCheck(_categoriesFuture);

  @observable
  ObservableFuture _newTransactionFuture;

  @computed
  StoreState get stateNewTransaction =>
      StoreUtils.statusCheck(_newTransactionFuture);

  @action
  void setDateInsert(DateTime date) => dateInsert = date;

  @action
  void changeCategory(CategoryModel categoryModelValue) =>
      categoryModel = categoryModelValue;

  @action
  void changeDescription(String descriptionValue) =>
      description = descriptionValue;

  @action
  void changeValue(double valueValue) => value = valueValue;

  @action
  Future<void> getAllCategories(String categoryType) async {
    try {
      errorMessage = '';
      categoryTypeSelected = categoryType;
      _categoriesFuture =
          ObservableFuture(_categoryRepository.getAllCotegories(categoryType));
      List<CategoryModel> categoryModelList = await _categoriesFuture;
      this.categoryModelList = categoryModelList;
    } catch (e) {
      print(e);
      errorMessage = 'Erro ao buscar categorias';
    }
  }

  @action
  Future<void> saveTransaction() async {
    try {
      if (globalKey.currentState.validate()) {
        if (categoryModel == null) {
          validCategory = false;
        } else {
          _newTransactionFuture = ObservableFuture(
            _transactionRepository.saveTransaction(
              categoryModel.id,
              dateInsert,
              description,
              moneyMaskedTextController.numberValue,
            ),
          );
          await _newTransactionFuture;
        }
      } else {
        if (categoryModel == null) {
          validCategory = false;
        }
      }
    } catch (e) {
      print(e);
      errorMessage = 'Erro ao salvar tranasação';
    }
  }

  @action
  resetForm() {
    changeCategory(null);
    changeDescription(null);
    moneyMaskedTextController.text = '0,00';
    validCategory = true;
  }
}
