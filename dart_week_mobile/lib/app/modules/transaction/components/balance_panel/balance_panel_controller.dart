import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/models/transaction_total_model.dart';
import 'package:dart_week_mobile/app/repositories/transaction_repository.dart';
import 'package:dart_week_mobile/app/shared/utils/store_utils.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'balance_panel_controller.g.dart';

class BalancePanelController = _BalancePanelControllerBase
    with _$BalancePanelController;

abstract class _BalancePanelControllerBase with Store {
  final TransactionRepository transactionRepository;

  _BalancePanelControllerBase(this.transactionRepository);

  @observable
  DateTime date = DateTime.now();

  @observable
  String errorMessage;

  @observable
  ObservableFuture<TransactionTotalModel> _totalTransaction;

  @observable
  TransactionTotalModel transactionTotalModel;

  @computed
  String get yearMonth => DateFormat('yyyyMM').format(date);

  @computed
  StoreState get state => StoreUtils.statusCheck(_totalTransaction);

  @action
  nextMonth() {
    date = DateTime(date.year, date.month + 1);
  }

  @action
  previousMonth() {
    date = DateTime(date.year, date.month - 1);
  }

  @action
  getYearMonthTotal() async {
    try {
      errorMessage = '';
      _totalTransaction =
          ObservableFuture(transactionRepository.getYearMonthTotal(yearMonth));
      transactionTotalModel = await _totalTransaction;
    } catch (e) {
      print(e);
      errorMessage = 'Erro ao procurar transações';
    }
  }
}
