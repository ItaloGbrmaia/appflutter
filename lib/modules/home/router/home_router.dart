import 'package:app/modules/home/factories/articles_get_factories.dart';
import 'package:app/modules/home/factories/quote_get_factories.dart';
import 'package:app/modules/home/factories/video_get_factories.dart';
import 'package:app/modules/home/view/home_view.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app/modules/home/controller/home_controller.dart';

class HomeRouter extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => makeGetVideo(),
        ),
        Bind.singleton(
          (i) => makeGetQuote(),
        ),
        Bind.singleton(
          (i) => makeGetArticle(),
        ),
        Bind.singleton(
          (i) => HomeController(
            loadVideo: i(),
            loadArticle: i(),
            loadQuote: i(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, __) => HomeView(
            controller: Modular.get<HomeController>(),
          ),
        ),
      ];
}
