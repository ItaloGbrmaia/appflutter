import 'package:app/shared/app_routes.dart';
import 'package:app/shared/data/cache/local_storage_adapter.dart';
import 'package:app/shared/data/contracts/cache/cache_storage.dart';
import 'package:app/shared/data/factories/http_client_factory.dart';
import 'package:app/shared/data/usecases/local/local_remove_current_account.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localstorage/localstorage.dart';

import '../modules/home/router/home_router.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (_) => makeHttpAdapter(),
        ),
        Bind.singleton(
          (i) => LocalStorageAdapter(
            LocalStorage('App'),
          ),
        ),
        Bind.lazySingleton(
          (i) => LocalRemoveCurrentAccount(
            cacheStorage: Modular.get<CacheStorage>(),
          ),
        ),
      ];

  @override
  List<Module> get imports => [
        // UsecasesModule(),
        // ServicesModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.home,
          module: HomeRouter(),
        ),
      ];
}
