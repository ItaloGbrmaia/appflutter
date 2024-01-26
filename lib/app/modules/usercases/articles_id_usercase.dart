import 'package:app/app/modules/factories/articles_id_interface.dart';
import 'package:app/app/modules/models/article_id_models.dart';
import 'package:app/shared/data/http/http_client.dart';

class RemoteLoadArticleId implements ArticleLoadId {
  const RemoteLoadArticleId({
    required this.url,
    required this.httpClient,
  });

  final String url;
  final HttpClient httpClient;

  @override
  Future<List<ArticleModelID>> loadArticle(int id) async {
    try {
      final responseData = await httpClient.request(
        url: '${url}$id',
        method: 'get',
      );

      List<dynamic> dataList = responseData['list'];
      List<ArticleModelID> receivedList =
          dataList.map((item) => ArticleModelID.fromJson(item)).toList();
      return receivedList;
    } catch (e) {
      rethrow;
    }
  }
}
