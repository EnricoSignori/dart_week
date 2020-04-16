import 'package:dart_week_mobile/app/core/store_state.dart';
import 'package:dart_week_mobile/app/mixins/loader_mixin.dart';
import 'package:dart_week_mobile/app/shared/ui/components/controleja_button.dart';
import 'package:dart_week_mobile/app/shared/ui/components/controleja_text_form_field.dart';
import 'package:dart_week_mobile/app/shared/utils/size_utils.dart';
import 'package:dart_week_mobile/app/shared/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController>
    with LoaderMixin {
  List<ReactionDisposer> _disposers;

  @override
  void initState() {
    super.initState();
    _disposers ??= [
      reaction(
        (_) => controller.state,
        (StoreState state) {
          if (state == StoreState.loading) {
            showLoader();
          } else if (state == StoreState.loaded) {
            hiddeLoader();
          }
        },
      ),
      reaction(
        (_) => controller.loginSuccess,
        (success) {
          if (success != null) {
            if (success) {
              Get.offAllNamed('/transaction');
            } else {
              Get.snackbar(
                'Error ao realizar Login',
                'Login ou senha inválidos',
                backgroundColor: Colors.white,
              );
            }
          }
        },
      ),
      reaction(
        (_) => controller.errorMessage,
        (String errorMessage) {
          if (errorMessage.isNotEmpty) {
            Get.snackbar(
              'Erro ao realizar Login',
              errorMessage,
              backgroundColor: Colors.white,
            );
          }
        },
      )
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _makeHeader(),
          SizedBox(height: 30),
          _makeForm(),
        ],
      ),
    );
  }

  Widget _makeHeader() {
    return Container(
      color: ThemeUtils.primaryColor,
      height: SizeUtils.heightScreen * .5,
      width: SizeUtils.widthScreen,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 50,
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ],
      ),
    );
  }

  Form _makeForm() {
    return Form(
      key: controller.globalKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: <Widget>[
            ControleJaTextFormField(
              icon: Icons.person_outline,
              labelText: 'Login',
              onChanged: controller.changeLogin,
              validator: (String value) =>
                  value.isEmpty ? 'Login Obrigatório' : null,
            ),
            SizedBox(height: 30),
            ControleJaTextFormField(
              icon: Icons.lock_outline,
              labelText: 'Senha',
              onChanged: controller.changePassword,
              validator: (String value) =>
                  value.isEmpty ? 'Senha Obrigatória' : null,
              obscureText: true,
            ),
            SizedBox(height: 30),
            ControleJaButton(
              label: 'Entrar',
              onPressed: () => controller.requestLogin(),
            ),
            SizedBox(height: 30),
            FlatButton(
              child: Text(
                'Cadastre-se',
                style: TextStyle(
                  color: ThemeUtils.primaryColor,
                  fontSize: 20,
                ),
              ),
              onPressed: () => Get.toNamed('/login/register'),
            )
          ],
        ),
      ),
    );
  }
}
