import 'package:app/app/modules/models/article_models.dart';

abstract class ArticleLoad {
  Future<List<ArticleModel>?> loadArticle(int id);
}
