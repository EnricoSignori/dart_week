import 'package:dart_week_mobile/app/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel item;

  const TransactionTile({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat('###.00', 'pt_BR');
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dateFormat.format(item.createdAt),
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor:
                item.categoryModel.categoryType == 'CategoryType.expense'
                    ? Colors.red
                    : Colors.blue,
            child: Icon(
              item.categoryModel.categoryType == 'CategoryType.expense'
                  ? Icons.money_off
                  : Icons.attach_money,
              color: Colors.white,
            ),
          ),
          title: Text(
            item.description,
          ),
          subtitle: Text(
            item.categoryModel.name,
          ),
          trailing: Container(
            padding: EdgeInsets.only(
              right: 10,
            ),
            child: Text(
              'R\$ ${numberFormat.format(item.value)}',
              style: TextStyle(
                color: item.categoryModel.categoryType == 'CategoryType.expense'
                    ? Colors.red
                    : Colors.blue,
              ),
            ),
          ),
        )
      ],
    );
  }
}
