import 'dart:convert';

import 'transaction_total_item_model.dart';

class TransactionTotalModel {
  final double total;
  final double balance;
  final TransactionTotalItemModel revenue;
  final TransactionTotalItemModel expense;

  TransactionTotalModel({
    required this.total,
    required this.balance,
    required this.revenue,
    required this.expense,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'balance': balance,
      'revenue': revenue.toMap(),
      'expense': expense.toMap(),
    };
  }

  factory TransactionTotalModel.fromMap(Map<String, dynamic> map) {
    return TransactionTotalModel(
      total: (map['total'] is int) ? (map['total'] as int).toDouble() : (map['total'] ?? 0.0),
      balance: (map['balance'] is int) ? (map['balance'] as int).toDouble() : (map['balance'] ?? 0.0),
      revenue: TransactionTotalItemModel.fromMap(map['revenue']),
      expense: TransactionTotalItemModel.fromMap(map['expense']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionTotalModel.fromJson(String source) => TransactionTotalModel.fromMap(json.decode(source));
}
