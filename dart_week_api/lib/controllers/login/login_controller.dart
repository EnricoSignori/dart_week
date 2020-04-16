import 'package:dart_week_api/controllers/login/dto/login_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/services/user_service.dart';

class LoginController extends ResourceController {
  LoginController(this.context) : userService = UserService(context);

  final ManagedContext context;
  final UserService userService;

  @Operation.post()
  Future<Response> login(@Bind.body() LoginRequest request) async {
    final Map<String, String> validate = request.validate();

    if (validate.isNotEmpty) {
      return Response.badRequest(
        body: validate,
      );
    }

    final token = await userService.login(request);

    return Response.ok({
      'authenticated': token != null,
      'token': token,
    });
  }
}
