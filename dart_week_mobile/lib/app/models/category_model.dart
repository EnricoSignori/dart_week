import 'dart:convert';

class CategoryModel {
  final int id;
  final String name;
  final String categoryType;

  CategoryModel({
    this.id,
    this.name,
    this.categoryType,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'categoryType': categoryType,
    };
  }

  static CategoryModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CategoryModel(
      id: map['id'],
      name: map['name'],
      categoryType: map['categoryType'],
    );
  }

  String toJson() => json.encode(toMap());

  static CategoryModel fromJson(String source) => fromMap(json.decode(source));
}
