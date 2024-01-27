import 'package:app/app/factories/articles_id_interface.dart';
import 'package:app/app/models/article_id_models.dart';
import 'package:app/shared/data/http/http_client.dart';

class RemoteLoadArticleId implements ArticleLoadId {
  const RemoteLoadArticleId({
    required this.url,
    required this.httpClient,
  });

  final String url;
  final HttpClient httpClient;

  @override
  Future<ArticleModelID> loadArticle(int id) async {
    try {
      final responseData = await httpClient.request(
        url: '$url$id',
        method: 'get',
      );

      return ArticleModelID.fromJson(
          responseData); // Ajustado para um único objeto
    } catch (e) {
      rethrow;
    }
  }
}
