import 'package:dart_week_mobile/app/core/custom_dio.dart';
import 'package:dart_week_mobile/app/models/category_model.dart';
import 'package:dio/dio.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getAllCotegories(String categoryType) {
    final Dio dio = CustomDio.withAutentication().instance;
    return dio.get('/categories/$categoryType').then((res) =>
        res.data.map<CategoryModel>((c) => CategoryModel.fromMap(c)).toList());
  }
}
