import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/category_model.dart';
import 'package:dart_week_api/services/category_serive.dart';

class CategoryController extends ResourceController {
  CategoryController(this.context) : categoryService = CategoryService(context);

  final ManagedContext context;
  final CategoryService categoryService;

  @Operation.get('type')
  Future<Response> findAllCategoriesByType() async {
    try {
      final String type = request.path.variables['type'];
      final CategoryType categoryType = CategoryType.values
          .firstWhere((t) => t.toString().split('.').last == type);

      return categoryService
          .findCategoryByType(categoryType)
          .then((result) => result
              .map((c) => {
                    'id': c.id,
                    'name': c.name,
                  })
              .toList())
          .then((data) => Response.ok(data));
    } catch (e) {
      print(e);

      return Response.serverError(body: {
        'message': e.toString(),
      });
    }
  }
}
