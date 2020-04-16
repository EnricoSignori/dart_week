import 'package:dart_week_api/controllers/transaction/dto/register_transaction_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/category_model.dart';
import 'package:dart_week_api/model/transaction_model.dart';
import 'package:dart_week_api/model/user_model.dart';
import 'package:dart_week_api/repositories/transaction_repository.dart';

class TransactionService {
  TransactionService(this.context)
      : transactionRepository = TransactionRepository(context);

  final ManagedContext context;
  final TransactionRepository transactionRepository;

  Future<List<TransactionModel>> findAllTransactions(
      UserModel userModel, String yearMonth) {
    return transactionRepository.findAllTransactions(userModel, yearMonth);
  }

  Future<Map<String, dynamic>> findAllTransactionsByType(
      UserModel userModel, String yearMonth) async {
    final Map<String, dynamic> revenue = await transactionRepository
        .findAllTransactionsByType(userModel, CategoryType.revenue, yearMonth);
    final Map<String, dynamic> expense = await transactionRepository
        .findAllTransactionsByType(userModel, CategoryType.expense, yearMonth);

    final double total =
        (revenue['total'] ?? 0) + (expense['total'] ?? 0) as double;
    final double balance =
        (revenue['total'] ?? 0) + (expense['total'] * -1 ?? 0) as double;

    return {
      'revenue': revenue,
      'expense': expense,
      'total': total,
      'balance': balance,
    };
  }

  Future<void> saveTransaction(
      UserModel userModel, RegisterTransactionRequest request) async {
    await transactionRepository.saveTransaction(userModel, request);
  }
}
