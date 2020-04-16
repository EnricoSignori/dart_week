import 'package:dart_week_api/config/jwt_authentication.dart';
import 'package:dart_week_api/controllers/transaction/transaction_controller.dart';
import 'package:dart_week_api/dart_week_api.dart';

class TransactionRouter {
  static void config(Router router, ManagedContext context) {
    router
        .route('/transaction/:yearMonth')
        .link(() => JwtAuthentication(context))
        .link(() => TransactionController(context));

    router
        .route('transaction/total/:totalYearMonth')
        .link(() => JwtAuthentication(context))
        .link(() => TransactionController(context));

    router
        .route('transaction/')
        .link(() => JwtAuthentication(context))
        .link(() => TransactionController(context));
  }
}
