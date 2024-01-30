import 'package:app/shared/app_config.dart';
import 'package:app/shared/app_module.dart';
import 'package:app/shared/app_widget.dart';
import 'package:app/shared/core/env.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ChuckerFlutter.showOnRelease = true;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig.getInstance(config: Environment.dev);
    return ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    );
  }
}
