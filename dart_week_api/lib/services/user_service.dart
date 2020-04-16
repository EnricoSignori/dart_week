import 'package:dart_week_api/controllers/login/dto/login_request.dart';
import 'package:dart_week_api/controllers/user/dto/register_user_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/user_model.dart';
import 'package:dart_week_api/repositories/user_repository.dart';
import 'package:dart_week_api/utils/crypt_utils.dart';
import 'package:dart_week_api/utils/jwt_utils.dart';

class UserService {
  UserService(this.context) : userRepository = UserRepository(context);

  final ManagedContext context;
  final UserRepository userRepository;

  Future<String> login(LoginRequest request) async {
    final String login = request.login;
    final String password = request.password;

    final String passwordEncrypted = CryptUtils.encryptPassword(password);

    final UserModel userModel = await userRepository
        .recoverUserByLoginAndPassword(login, passwordEncrypted);

    return userModel != null ? JwtUtils.generateTokenJWT(userModel) : null;
  }

  Future<void> saveUser(RegisterUserRequest request) async {
    await userRepository.saveUser(request);
  }

  Future<UserModel> findUserById(int userId) async {
    return await userRepository.findUserByID(userId);
  }
}
