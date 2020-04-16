import 'package:dart_week_api/controllers/user/dto/register_user_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/services/user_service.dart';

class UserController extends ResourceController {
  UserController(this.context) : userService = UserService(context);

  final ManagedContext context;
  final UserService userService;

  @Operation.post()
  Future<Response> save(@Bind.body() RegisterUserRequest request) async {
    final Map<String, String> validate = request.validate();

    if (validate.isNotEmpty) {
      return Response.badRequest(
        body: validate,
      );
    }

    try {
      await userService.saveUser(request);
      return Response.ok({
        'message': 'Usuário cadastrado com sucesso!',
      });
    } catch (e) {
      print(e);
      return Response.serverError(body: {
        'message': 'Erro ao salvar usuário.',
        'exception': e.toString(),
      });
    }
  }
}
