import 'dart:convert';

class TransactionTotalItemModel {
  final double total;
  final String categoryItem;

  TransactionTotalItemModel({
    this.total,
    this.categoryItem,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'categoryItem': categoryItem,
    };
  }

  static TransactionTotalItemModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TransactionTotalItemModel(
      total: map['total'],
      categoryItem: map['categoryItem'],
    );
  }

  String toJson() => json.encode(toMap());

  static TransactionTotalItemModel fromJson(String source) =>
      fromMap(json.decode(source));
}
