import 'dart:convert';

import 'package:dart_week_mobile/app/models/category_model.dart';
import 'package:intl/intl.dart';

class TransactionModel {
  final int id;
  final DateTime createdAt;
  final String description;
  final double value;
  final CategoryModel categoryModel;

  TransactionModel({
    this.id,
    this.createdAt,
    this.description,
    this.value,
    this.categoryModel,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'description': description,
      'value': value,
      'categoryModel': categoryModel.toMap(),
    };
  }

  static TransactionModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    final DateFormat dateFormat = DateFormat('y-MM-d');

    return TransactionModel(
      id: map['id'],
      createdAt: dateFormat.parse(map['createdAt']),
      description: map['description'],
      value: map['value'],
      categoryModel: CategoryModel.fromMap(map['categoryModel']),
    );
  }

  String toJson() => json.encode(toMap());

  static TransactionModel fromJson(String source) =>
      fromMap(json.decode(source));
}
