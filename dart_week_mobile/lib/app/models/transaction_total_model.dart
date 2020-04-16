import 'dart:convert';

import 'package:dart_week_mobile/app/models/transaction_total_item_model.dart';

class TransactionTotalModel {
  final double total;
  final double balance;
  final TransactionTotalItemModel revenue;
  final TransactionTotalItemModel expense;

  TransactionTotalModel({
    this.total,
    this.balance,
    this.revenue,
    this.expense,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'balance': balance,
      'revenue': revenue.toMap(),
      'expense': expense.toMap(),
    };
  }

  static TransactionTotalModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TransactionTotalModel(
      total: map['total'],
      balance: map['balance'],
      revenue: TransactionTotalItemModel.fromMap(map['revenue']),
      expense: TransactionTotalItemModel.fromMap(map['expense']),
    );
  }

  String toJson() => json.encode(toMap());

  static TransactionTotalModel fromJson(String source) =>
      fromMap(json.decode(source));
}
