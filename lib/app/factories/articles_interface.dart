import 'package:app/app/models/article_models.dart';

abstract class ArticleLoad {
  Future<List<ArticleModel>?> loadArticle(int id);
}
