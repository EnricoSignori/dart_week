import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/category_model.dart';

class CategoryRepository {
  CategoryRepository(this.context);

  final ManagedContext context;

  Future<List<CategoryModel>> findCategoryByType(CategoryType categoryType) {
    final Query<CategoryModel> query = Query<CategoryModel>(context)
      ..where((c) => c.categoryType).equalTo(categoryType);

    return query.fetch();
  }

  Future<CategoryModel> findCategoryById(int categoryId) {
    final Query<CategoryModel> query = Query<CategoryModel>(context)
      ..where((c) => c.id).equalTo(categoryId);

    return query.fetchOne();
  }
}
