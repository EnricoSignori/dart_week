import 'package:get/get.dart';
import 'package:mobx/mobx.dart';

import '../../mixins/loader_mixin.dart';
import '../../repositories/user_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store, LoaderMixin {
  final UserRepository _userRepository;

  _HomeControllerBase(
    this._userRepository,
  );

  Future<void> verifyLoged() async {
    showLoader();
    if (await _userRepository.isLogged()) {
      hiddeLoader();
      Get.offAllNamed('/transaction');
    } else {
      hiddeLoader();
      Get.offAllNamed('/login');
    }
  }
}
