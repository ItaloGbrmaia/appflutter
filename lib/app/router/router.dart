import 'package:app/app/controller/article_controller.dart';
import 'package:app/app/controller/home_controller.dart';
import 'package:app/app/factories/articles_get_factories.dart';
import 'package:app/app/factories/articles_id_get_factories.dart';
import 'package:app/app/factories/quote_get_factories.dart';
import 'package:app/app/factories/video_get_factories.dart';
import 'package:app/app/views/article_details_view.dart';
import 'package:app/app/views/home_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
          (i) => makeGetArticleId(),
        ),
        Bind.singleton(
          (i) => ArticleController(
            loadArticle: i(),
          ),
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
        ChildRoute(
          '/article',
          child: (_, __) => ArticleView(
            controller: Modular.get<ArticleController>(),
          ),
        ),
      ];
}
