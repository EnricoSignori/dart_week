import 'dart:convert';

class CategoryModel {
  final int id;
  final String name;
  final String categoryType;

  CategoryModel({
    required this.id,
    required this.name,
    required this.categoryType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'categoryType': categoryType,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      categoryType: map['categoryType'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));
}
