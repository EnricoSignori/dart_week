import 'package:dart_week_api/controllers/transaction/dto/register_transaction_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/category_model.dart';
import 'package:dart_week_api/model/transaction_model.dart';
import 'package:dart_week_api/model/user_model.dart';
import 'package:dart_week_api/repositories/category_repository.dart';
import 'package:intl/intl.dart';

class TransactionRepository {
  TransactionRepository(this.context)
      : categoryRepository = CategoryRepository(context);

  final ManagedContext context;
  final CategoryRepository categoryRepository;

  Query<TransactionModel> queryBaseFindAllTransaction(
      UserModel userModel, String yearMonth) {
    final DateFormat dateFormat = DateFormat('yyyy_MM_DD');
    final start = dateFormat
        .parse('${yearMonth.substring(0, 4)}_${yearMonth.substring(4)}_01');
    final end = dateFormat
        .parse('${yearMonth.substring(0, 4)}_${yearMonth.substring(4)}_31');

    return Query<TransactionModel>(context)
      ..join(object: (t) => t.categoryModel)
      ..where((t) => t.userModel.id).equalTo(userModel.id)
      ..where((t) => t.createdAt).between(start, end);
  }

  Future<List<TransactionModel>> findAllTransactions(
      UserModel userModel, String yearMonth) {
    final Query<TransactionModel> query =
        queryBaseFindAllTransaction(userModel, yearMonth)
          ..sortBy((t) => t.createdAt, QuerySortOrder.descending)
          ..sortBy((t) => t.id, QuerySortOrder.descending);

    return query.fetch();
  }

  Future<Map<String, dynamic>> findAllTransactionsByType(
      UserModel userModel, CategoryType categoryType, String yearMonth) async {
    final Query<TransactionModel> query =
        queryBaseFindAllTransaction(userModel, yearMonth)
          ..where((t) => t.categoryModel.categoryType).equalTo(categoryType);

    final List<TransactionModel> result = await query.fetch();
    final num total = result.fold(0.0, (total, t) => total += t.value);

    return {
      'categoryType': categoryType.toString(),
      'total': total,
    };
  }

  Future<Map<String, dynamic>> getTotalYearMonth(
      UserModel userModel, CategoryType categoryType, String yearMonth) async {
    final List<TransactionModel> result = [];
    final num total = result.fold(0.0, (total, t) => total += t.value);

    return {
      'categoryType': categoryType,
      'total': total,
    };
  }

  Future<void> saveTransaction(
      UserModel userModel, RegisterTransactionRequest request) async {
    final CategoryModel categoryModel =
        await categoryRepository.findCategoryById(request.categoryId);
    final TransactionModel transactionModel = TransactionModel();

    transactionModel.categoryModel = categoryModel;
    transactionModel.value = request.value;
    transactionModel.description = request.description;
    transactionModel.userModel = userModel;
    transactionModel.createdAt = request.createdAt;

    await context.insertObject(transactionModel);
  }
}
