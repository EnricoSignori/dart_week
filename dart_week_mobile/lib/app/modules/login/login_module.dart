import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/user_repository.dart';
import '../register/register_module.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i.get<UserRepository>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => LoginPage()),
        Router('/register', module: RegisterModule()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
