import 'package:app/modules/home/models/article_models.dart';

abstract class ArticleLoad {
  Future<List<ArticleModel>?> loadArticle(int id);
}
