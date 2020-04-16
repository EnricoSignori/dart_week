import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/category_model.dart';
import 'package:dart_week_api/repositories/category_repository.dart';

class CategoryService {
  CategoryService(this.context)
      : categoryRepository = CategoryRepository(context);

  final ManagedContext context;
  final CategoryRepository categoryRepository;

  Future<List<CategoryModel>> findCategoryByType(CategoryType categoryType) {
    return categoryRepository.findCategoryByType(categoryType);
  }
}
