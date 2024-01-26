import 'package:app/app/modules/factories/articles_id_interface.dart';
import 'package:app/app/modules/models/article_id_models.dart';
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
  List<ArticleModelID>? homeArticle;
  List<ArticleModelID>? homearticleList;
  Future<void> loadArticle() async {
    isLoading = true;
    allArticle ??= [];
    homeArticle ??= [];
    homearticleList ??= [];

    try {
      isLoading = true;
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        isLoading = false;
        internet = false;
        allArticle = [];
        homeArticle = [];
        homearticleList = [];
        print("Sem conexão");
        return;
      }

      dynamic result = await _loadArticle.loadArticle(id).timeout(
        const Duration(seconds: 7),
        onTimeout: () {
          print("Tempo limite excedido (7 segundos)");
          isLoading = false;
          hatTime = false;
          allArticle = [];
          homeArticle = [];
          homearticleList = [];
          return [];
        },
      );

      if (result != null &&
          result is List<ArticleModelID> &&
          result.isNotEmpty) {
        internet = true;
        hatTime = true;
        allArticle = result;
        homeArticle = List.from(allArticle!); // Cria uma cópia da lista
        homearticleList!.addAll(homeArticle!);
      } else {
        hatTime = false;
      }

      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }
}
