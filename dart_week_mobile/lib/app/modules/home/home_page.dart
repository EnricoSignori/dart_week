import 'package:dart_week_mobile/app/shared/utils/size_utils.dart';
import 'package:dart_week_mobile/app/shared/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => controller.verifyLoged());
  }

  @override
  Widget build(BuildContext context) {
    ThemeUtils.init(context);
    SizeUtils.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
