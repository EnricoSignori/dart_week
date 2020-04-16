import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/mixins/loader_mixin.dart';
import 'package:dart_week_mobile/app/modules/transaction/components/balance_panel/balance_panel_widget.dart';
import 'package:dart_week_mobile/app/modules/transaction/components/register_transaction/register_transaction_controller.dart';
import 'package:dart_week_mobile/app/modules/transaction/components/register_transaction/register_transaction_widget.dart';
import 'package:dart_week_mobile/app/modules/transaction/components/transaction_tile.dart';
import 'package:dart_week_mobile/app/repositories/user_repository.dart';
import 'package:dart_week_mobile/app/shared/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'transaction_controller.dart';

class TransactionPage extends StatefulWidget {
  final String title;
  const TransactionPage({Key key, this.title = "Transaction"})
      : super(key: key);

  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState
    extends ModularState<TransactionPage, TransactionController>
    with LoaderMixin {
  final RegisterTransactionController registerTranController =
      Modular.get<RegisterTransactionController>();

  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    super.initState();
    _disposers ??
        [
          reaction(
            (_) => controller.balancePanelController.date,
            (_) => controller.getTransactions(),
          ),
          reaction(
            (_) => registerTranController.stateNewTransaction,
            (_) {
              switch (_) {
                case StoreState.loading:
                  showLoader();
                  break;
                case StoreState.error:
                  hiddeLoader();
                  Get.snackbar('Erro', 'Erro ao salvar transaação');
                  break;
                case StoreState.loaded:
                  hiddeLoader();
                  Get.back();
                  controller.getTransactions();
                  controller.balancePanelController.getYearMonthTotal();
                  break;
              }
            },
          ),
          reaction((_) => registerTranController.stateListCategory,
              (stateListCategory) {
            switch (stateListCategory) {
              case StoreState.loading:
                showLoader();
                break;
              case StoreState.loaded:
                hiddeLoader();
                _showInsertModal();
                break;
            }
          }),
        ];
    controller.getTransactions();
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      centerTitle: true,
      title: Text(
        widget.title,
      ),
      actions: <Widget>[
        PopupMenuButton<String>(
          icon: Icon(
            Icons.add,
          ),
          onSelected: (item) {
            registerTranController.getAllCategories(item);
          },
          itemBuilder: (_) {
            return [
              PopupMenuItem<String>(
                value: 'revenue',
                child: Text(
                  'Receita',
                ),
              ),
              PopupMenuItem<String>(
                value: 'expense',
                child: Text(
                  'Despesas',
                ),
              ),
            ];
          },
        ),
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            Modular.get<UserRepository>().logout();
            Get.offAllNamed('/');
          },
        ),
      ],
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        height: SizeUtils.heightScreen,
        child: Stack(
          children: <Widget>[
            Observer(
              builder: (_) {
                switch (controller.state) {
                  case StoreState.initial:
                  case StoreState.loading:
                    return Container(
                      height: SizeUtils.heightScreen,
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case StoreState.loaded:
                    return _makeContent();
                  case StoreState.error:
                    Get.snackbar(
                        'Erro ao buscar dados', controller.errorMessage);
                    return Container();
                }

                return Container();
              },
            ),
            BalancePanelWidget(
              appBarHeight: appBar.preferredSize.height,
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeContent() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.separated(
            itemCount: controller.transactions?.length ?? 0,
            separatorBuilder: (_, index) => Divider(color: Colors.black),
            itemBuilder: (_, index) => TransactionTile(
              item: controller.transactions[index],
            ),
          ),
        ),
        SizedBox(height: SizeUtils.heightScreen * 0.08),
      ],
    );
  }

  _showInsertModal() {
    registerTranController.resetForm();

    Get.dialog(
      AlertDialog(
        title: Text(
          registerTranController.categoryTypeSelected == 'revenue'
              ? 'Adicionar Receita'
              : 'Adicionar Despesa',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        content: RegisterTransactionWidget(),
        actions: <Widget>[
          FlatButton(
            onPressed: () => registerTranController.saveTransaction(),
            child: Text('Salvar'),
          ),
          FlatButton(
            onPressed: () => Get.back(),
            child: Text('Cancelar'),
          ),
        ],
      ),
    );
  }
}
