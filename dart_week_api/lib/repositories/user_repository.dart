import 'package:dart_week_api/controllers/user/dto/register_user_request.dart';
import 'package:dart_week_api/dart_week_api.dart';
import 'package:dart_week_api/model/user_model.dart';
import 'package:dart_week_api/utils/crypt_utils.dart';

class UserRepository {
  UserRepository(this.context);

  final ManagedContext context;

  Future<UserModel> recoverUserByLoginAndPassword(
      String login, String password) {
    final Query<UserModel> query = Query<UserModel>(context)
      ..where((user) => user.login).equalTo(login)
      ..where((user) => user.password).equalTo(password);

    return query.fetchOne();
  }

  Future<void> saveUser(RegisterUserRequest request) async {
    final UserModel userSave = UserModel()..read(request.asMap());
    userSave.password = CryptUtils.encryptPassword(request.password);

    await context.insertObject(userSave);
  }

  Future<UserModel> findUserByID(int userId) async {
    final Query<UserModel> query = Query<UserModel>(context)
      ..where((user) => user.id).equalTo(userId);

    return await query.fetchOne();
  }
}
