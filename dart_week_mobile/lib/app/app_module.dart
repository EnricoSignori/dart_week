import 'package:dart_week_mobile/app/app_controller.dart';
import 'package:dart_week_mobile/app/app_widget.dart';
import 'package:dart_week_mobile/app/modules/home/home_module.dart';
import 'package:dart_week_mobile/app/modules/login/login_module.dart';
import 'package:dart_week_mobile/app/modules/transaction/transaction_module.dart';
import 'package:dart_week_mobile/app/repositories/transaction_repository.dart';
import 'package:dart_week_mobile/app/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => UserRepository()),
        Bind((i) => TransactionRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/login', module: LoginModule()),
        Router('/transaction', module: TransactionModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
