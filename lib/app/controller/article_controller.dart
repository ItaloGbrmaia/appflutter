import 'package:app/app/factories/articles_id_interface.dart';
import 'package:app/app/models/article_id_models.dart';
import 'package:mobx/mobx.dart';
import 'package:connectivity/connectivity.dart';

part 'article_controller.g.dart';

class ArticleController = ArticleControllerBase with _$ArticleController;

abstract class ArticleControllerBase with Store {
  ArticleControllerBase({
    required ArticleLoadId loadArticle,
  }) : _loadArticle = loadArticle;

  final ArticleLoadId _loadArticle;

  @observable
  late int id;

  @observable
  bool isLoading = true;

  @observable
  int pagevideos = 1;

  @observable
  int pageArticles = 1;

  @observable
  int pageQuote = 1;

  @observable
  bool internet = true;

  @observable
  bool hatTime = true;

  List<ArticleModelID>? allArticle;

  Future<void> loadArticle() async {
    isLoading = true;
    allArticle ??= [];

    try {
      isLoading = true;
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        isLoading = false;
        internet = false;
        allArticle = [];

        return;
      }

      final result = await _loadArticle.loadArticle(id);

      if (result != null) {
        internet = true;

        allArticle = [result];
      }

      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }
}
