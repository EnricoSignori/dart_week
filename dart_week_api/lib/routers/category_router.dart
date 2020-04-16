import 'package:dart_week_api/config/jwt_authentication.dart';
import 'package:dart_week_api/controllers/catrgoty/category_controller.dart';
import 'package:dart_week_api/dart_week_api.dart';

class CategoryRouter {
  static void config(Router router, ManagedContext context) {
    router
        .route('/categories/:type')
        .link(() => JwtAuthentication(context))
        .link(() => CategoryController(context));
  }
}
