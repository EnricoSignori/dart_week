import 'package:dart_week_api/dart_week_api.dart';

class RegisterTransactionRequest extends Serializable {
  int categoryId;
  double value;
  String description;
  DateTime createdAt;

  @override
  Map<String, dynamic> asMap() {
    return {
      'categoryId': categoryId,
      'value': value,
      'description': description,
      'createdAt': createdAt,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    final createdAtString = object['createdAt'] as String;

    categoryId = object['categoryId'] as int;
    value = object['value'] as double;
    description = object['description'] as String;
    createdAt =
        createdAtString != null ? DateTime.parse(createdAtString) : null;
  }

  Map<String, String> validate() {
    final Map<String, String> validateResult = {};

    if (categoryId == null) {
      validateResult['categoryId'] = 'Categoria não informada.';
    }

    if (value == null) {
      validateResult['value'] = 'Valor não informado.';
    }

    if (createdAt == null) {
      validateResult['createdAt'] = 'Data da Transação não informada.';
    }

    return validateResult;
  }
}
