import 'package:app/app/modules/models/article_id_models.dart';

abstract class ArticleLoadId {
  Future<List<ArticleModelID>?> loadArticle(int id);
}
