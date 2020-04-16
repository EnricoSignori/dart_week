import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/services/user_service.dart';
import 'package:dart_week_api/utils/jwt_utils.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class JwtAuthentication extends Controller {
  JwtAuthentication(this.context) : userService = UserService(context);

  final ManagedContext context;
  final UserService userService;

  @override
  FutureOr<RequestOrResponse> handle(Request request) async {
    final authHeader = request?.raw?.headers['authorization'];

    if (authHeader == null || authHeader.isEmpty) {
      return Response.unauthorized();
    }

    final authHeaderContent = authHeader[0]?.split(" ");

    if (authHeaderContent.length != 2 || authHeaderContent[0] != 'Bearer') {
      return Response.badRequest(body: {'message': 'Token inválido.'});
    }

    try {
      final token = authHeaderContent[1];

      final JwtClaim claimSets = JwtUtils.verificationToken(token);
      final int userId = int.tryParse(claimSets.toJson()['sub'].toString());
      if (userId == null) {
        throw JwtException;
      }

      final currentDate = DateTime.now().toUtc();
      if (currentDate.isAfter(claimSets.expiry)) {
        return Response.unauthorized();
      }

      final user = await userService.findUserById(userId);

      request.attachments['user'] = user;

      return request;
    } on JwtException catch (e) {
      print(e);
      return Response.unauthorized();
    }
  }
}
