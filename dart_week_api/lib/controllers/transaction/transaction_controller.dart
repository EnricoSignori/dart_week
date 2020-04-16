import 'package:dart_week_api/controllers/transaction/dto/register_transaction_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/user_model.dart';
import 'package:dart_week_api/services/transaction_service.dart';
import 'package:intl/intl.dart';

class TransactionController extends ResourceController {
  TransactionController(this.context)
      : transactionService = TransactionService(context);

  final ManagedContext context;
  final TransactionService transactionService;

  @Operation.get('yearMonth')
  Future<Response> findAllTransactions() {
    final yearMonth = request.path.variables['yearMonth'];
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final UserModel userModel = request.attachments['user'] as UserModel;
    return transactionService
        .findAllTransactions(userModel, yearMonth)
        .then((data) {
      return data
          .map((t) => {
                'id': t.id,
                'createdAt': dateFormat.format(t.createdAt),
                'value': t.value,
                'description': t.description,
                'categoryModel': {
                  'id': t.categoryModel.id,
                  'name': t.categoryModel.name,
                  'categoryType': t.categoryModel.categoryType.toString(),
                }
              })
          .toList();
    }).then((list) => Response.ok(list));
  }

  @Operation.get('totalYearMonth')
  Future<Response> getTotalYearMonth(
      @Bind.path('totalYearMonth') String yearMonth) async {
    final UserModel userModel = request.attachments['user'] as UserModel;
    final Map<String, dynamic> result = await transactionService
        .findAllTransactionsByType(userModel, yearMonth);

    return Response.ok(result);
  }

  @Operation.post()
  Future<Response> saveTransaction(
      @Bind.body() RegisterTransactionRequest requestSave) async {
    try {
      final Map<String, String> validate = requestSave.validate();

      if (validate.isNotEmpty) {
        return Response.badRequest(body: validate);
      }

      final UserModel userModel = request.attachments['user'] as UserModel;

      await transactionService.saveTransaction(userModel, requestSave);
      return Response.ok({});
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'Erro ao salvar Transação',
      });
    }
  }
}
