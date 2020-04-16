import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/models/transaction_model.dart';
import 'package:dart_week_mobile/app/modules/transaction/components/balance_panel/balance_panel_controller.dart';
import 'package:dart_week_mobile/app/repositories/transaction_repository.dart';
import 'package:dart_week_mobile/app/shared/utils/store_utils.dart';
import 'package:mobx/mobx.dart';

part 'transaction_controller.g.dart';

class TransactionController = _TransactionControllerBase
    with _$TransactionController;

abstract class _TransactionControllerBase with Store {
  final TransactionRepository transactionRepository;
  final BalancePanelController balancePanelController;

  _TransactionControllerBase(
    this.transactionRepository,
    this.balancePanelController,
  );

  @observable
  String errorMessage;

  @observable
  ObservableFuture<List<TransactionModel>> _transactionFuture;

  @observable
  ObservableList<TransactionModel> transactions;

  @computed
  StoreState get state => StoreUtils.statusCheck(_transactionFuture);

  @action
  Future<void> getTransactions() async {
    try {
      _transactionFuture = ObservableFuture(transactionRepository
          .getAllTransactions(balancePanelController.yearMonth));
      List<TransactionModel> transactionsResult = await _transactionFuture;
      transactions = transactionsResult.asObservable();
    } catch (e) {
      print(e);
      errorMessage = 'Erro ao listar Transações';
    }
  }
}
