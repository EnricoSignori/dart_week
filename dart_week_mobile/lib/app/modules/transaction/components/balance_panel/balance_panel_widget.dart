import 'dart:io';

import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/models/transaction_total_model.dart';
import 'package:dart_week_mobile/app/modules/transaction/components/balance_panel/balance_panel_controller.dart';
import 'package:dart_week_mobile/app/shared/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class BalancePanelWidget extends StatefulWidget {
  final double appBarHeight;

  const BalancePanelWidget({
    Key key,
    this.appBarHeight,
  }) : super(key: key);

  @override
  _BalancePanelWidgetState createState() => _BalancePanelWidgetState();
}

class _BalancePanelWidgetState
    extends ModularState<BalancePanelWidget, BalancePanelController> {
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    super.initState();
    _disposers ??
        reaction(
          (_) => controller.date,
          (_) => controller.getYearMonthTotal(),
        );
    controller.getYearMonthTotal();
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      cornerRadius: 20,
      elevation: 4,
      shadowColor: Colors.black12,
      snapSpec: SnapSpec(
        snap: true,
        snappings: [
          0.1,
          0.4,
        ],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      headerBuilder: (_, state) {
        return Container(
          margin: EdgeInsets.only(
            top: 4,
          ),
          height: 5,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
      builder: (_, state) {
        return Observer(builder: (_) {
          switch (controller.state) {
            case StoreState.initial:
            case StoreState.loading:
              return Container(
                height: SizeUtils.heightScreen,
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  child: CircularProgressIndicator(),
                ),
              );
            case StoreState.loaded:
              return _makeContent();
            case StoreState.error:
              return Text(
                controller.errorMessage,
              );
          }

          return Container();
        });
      },
    );
  }

  Widget _makeContent() {
    final TransactionTotalModel transactionTotalModel =
        controller.transactionTotalModel;
    final NumberFormat numberFormat = NumberFormat('###.00', 'pt_BR');

    return Container(
      width: SizeUtils.widthScreen,
      height: SizeUtils.heightScreen * .4 - widget.appBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => controller.previousMonth(),
              ),
              Text(
                DateFormat.yMMMM('pt_BR').format(controller.date),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: transactionTotalModel.balance < 0
                      ? Colors.red
                      : Colors.green,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () => controller.nextMonth(),
              ),
            ],
          ),
          SizedBox(
            height: Platform.isIOS ? 60 : 30,
          ),
          Column(
            children: <Widget>[
              Text(
                'Saldo',
              ),
              Text(
                'R\$ ${transactionTotalModel.balance != null ? numberFormat.format(transactionTotalModel.balance) : '-'}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: transactionTotalModel.balance < 0
                      ? Colors.red
                      : Colors.green,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: Platform.isIOS ? 30 : 10,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF4BCE97),
                        foregroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_upward,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Receitas',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4BCE97),
                          ),
                        ),
                        Text(
                          'R\$ ${numberFormat.format(transactionTotalModel.revenue.total)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4BCE97),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_downward,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Despesas',
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        ),
                        Text(
                          'R\$ ${numberFormat.format(transactionTotalModel.expense.total)}',
                          style: TextStyle(fontSize: 14, color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
