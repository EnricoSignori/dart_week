import 'package:dio/dio.dart';

import '../core/custom_dio.dart';
import '../models/category_model.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getAllCotegories(String categoryType) {
    final Dio dio = CustomDio.withAutentication().instance;
    return dio
        .get('/categories/$categoryType')
        .then((res) => res.data.map<CategoryModel>((c) => CategoryModel.fromMap(c)).toList());
  }
}
