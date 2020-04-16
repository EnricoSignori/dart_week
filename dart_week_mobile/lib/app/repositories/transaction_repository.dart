import 'package:dart_week_mobile/app/core/custom_dio.dart';
import 'package:dart_week_mobile/app/models/transaction_model.dart';
import 'package:dart_week_mobile/app/models/transaction_total_model.dart';
import 'package:dio/dio.dart';

class TransactionRepository {
  Future<List<TransactionModel>> getAllTransactions(String yearMonth) {
    final Dio dio = CustomDio.withAutentication().instance;
    return dio.get('/transaction/$yearMonth').then((res) => res.data
        .map<TransactionModel>((m) => TransactionModel.fromMap(m))
        .toList());
  }

  Future<TransactionTotalModel> getYearMonthTotal(String yearMonth) {
    final Dio dio = CustomDio.withAutentication().instance;
    return dio
        .get('/transaction/total/$yearMonth')
        .then((res) => TransactionTotalModel.fromMap(res.data));
  }

  Future<void> saveTransaction(
    int categoryId,
    DateTime createdAt,
    String description,
    double value,
  ) {
    final Dio dio = CustomDio.withAutentication().instance;
    return dio.post('/transaction', data: {
      "categoryId": categoryId,
      "createdAt": createdAt.toIso8601String(),
      "description": description,
      "value": value,
    });
  }
}
