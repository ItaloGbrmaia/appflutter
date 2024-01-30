import 'package:app/app/router/router.dart';
import 'package:app/shared/app_routes.dart';
import 'package:app/shared/data/factories/http_client_factory.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (_) => makeHttpAdapter(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.home,
          module: HomeRouter(),
        ),
      ];
}
