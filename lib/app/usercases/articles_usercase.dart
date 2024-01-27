import 'package:app/app/factories/articles_interface.dart';
import 'package:app/app/models/article_models.dart';
import 'package:app/shared/data/http/http_client.dart';

class RemoteLoadArticle implements ArticleLoad {
  const RemoteLoadArticle({
    required this.url,
    required this.httpClient,
  });

  final String url;
  final HttpClient httpClient;

  @override
  Future<List<ArticleModel>> loadArticle(int id) async {
    try {
      final responseData = await httpClient.request(
        url: '${url}2?page=$id',
        method: 'get',
      );

      List<dynamic> dataList = responseData['list'];
      List<ArticleModel> receivedList =
          dataList.map((item) => ArticleModel.fromJson(item)).toList();
      return receivedList;
    } catch (e) {
      rethrow;
    }
  }
}
