import 'dart:convert';

import 'package:intl/intl.dart';

import 'category_model.dart';

class TransactionModel {
  final int id;
  final DateTime createdAt;
  final String description;
  final double value;
  final CategoryModel categoryModel;

  TransactionModel({
    required this.id,
    required this.createdAt,
    required this.description,
    required this.value,
    required this.categoryModel,
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

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    DateTime created;
    if (map['createdAt'] is int) {
      created = DateTime.fromMillisecondsSinceEpoch(map['createdAt']);
    } else if (map['createdAt'] is String) {
      created = DateFormat('y-MM-d').parse(map['createdAt']);
    } else {
      created = DateTime.now();
    }

    return TransactionModel(
      id: map['id'] ?? 0,
      createdAt: created,
      description: map['description'] ?? '',
      value: (map['value'] is int) ? (map['value'] as int).toDouble() : (map['value'] ?? 0.0),
      categoryModel: CategoryModel.fromMap(map['categoryModel']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) => TransactionModel.fromMap(json.decode(source));
}
