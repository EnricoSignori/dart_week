import 'dart:convert';

class TransactionTotalItemModel {
  final double total;
  final String categoryItem;

  TransactionTotalItemModel({
    required this.total,
    required this.categoryItem,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'categoryItem': categoryItem,
    };
  }

  factory TransactionTotalItemModel.fromMap(Map<String, dynamic> map) {
    return TransactionTotalItemModel(
      total: (map['total'] is int) ? (map['total'] as int).toDouble() : (map['total'] ?? 0.0),
      categoryItem: map['categoryItem'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionTotalItemModel.fromJson(String source) => TransactionTotalItemModel.fromMap(json.decode(source));
}
