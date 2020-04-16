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
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterController>
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
            Get.snackbar(
              'Login cadastrado com sucesso',
              'Login cadastrado com sucesso',
              backgroundColor: Colors.white,
            );
            Get.offAllNamed('/login');
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

  AppBar appBar = AppBar(
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _makeHeader(),
            SizedBox(height: 30),
            _makeForm(),
          ],
        ),
      ),
    );
  }

  Widget _makeHeader() {
    return Container(
      color: ThemeUtils.primaryColor,
      height: SizeUtils.heightScreen * .5 -
          SizeUtils.statusBarHeight -
          appBar.preferredSize.height,
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
            ControleJaTextFormField(
              icon: Icons.lock_outline,
              labelText: 'Confirma Senha',
              onChanged: controller.changePasswordAgain,
              validator: (String value) {
                if (value.isNotEmpty) {
                  if (value != controller.password) {
                    return 'Senha diferente de Confirma Senha';
                  }
                } else {
                  return 'Confirma Senha Obrigatória';
                }

                return null;
              },
              obscureText: true,
            ),
            SizedBox(height: 30),
            ControleJaButton(
              label: 'Salvar',
              onPressed: () => controller.saveUSer(),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
