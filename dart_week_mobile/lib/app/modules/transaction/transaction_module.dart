import 'package:dart_week_mobile/app/modules/transaction/components/register_transaction/register_transaction_controller.dart';
import 'package:dart_week_mobile/app/modules/transaction/components/balance_panel/balance_panel_controller.dart';
import 'package:dart_week_mobile/app/modules/transaction/transaction_controller.dart';
import 'package:dart_week_mobile/app/repositories/category_repository.dart';
import 'package:dart_week_mobile/app/repositories/transaction_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_week_mobile/app/modules/transaction/transaction_page.dart';

class TransactionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterTransactionController()),
        Bind((i) => BalancePanelController(
              i.get<TransactionRepository>(),
            )),
        Bind((i) => TransactionController(
              i.get<TransactionRepository>(),
              i.get<BalancePanelController>(),
            )),
        Bind((i) => CategoryRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TransactionPage()),
      ];

  static Inject get to => Inject<TransactionModule>.of();
}
