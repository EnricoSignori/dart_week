import 'package:dart_week_mobile/app/modules/register/register_controller.dart';
import 'package:dart_week_mobile/app/repositories/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_week_mobile/app/modules/register/register_page.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController(i.get<UserRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
