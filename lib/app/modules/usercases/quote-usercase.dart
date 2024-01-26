// ignore: file_names
import 'package:app/app/modules/factories/quote_interface.dart';
import 'package:app/modules/home/models/Quote_models.dart';
import 'package:app/shared/data/http/http_client.dart';

class RemoteLoadQuote implements QuoteLoad {
  const RemoteLoadQuote({
    required this.url,
    required this.httpClient,
  });

  final String url;
  final HttpClient httpClient;

  @override
  Future<List<QuoteModel>?> loadQuote(int id) async {
    try {
      final responseData = await httpClient.request(
        url: '$url?page=$id',
        method: 'get',
      );

      List<dynamic> dataList = responseData['list'];
      List<QuoteModel> receivedList =
          dataList.map((item) => QuoteModel.fromJson(item)).toList();
      return receivedList;
    } catch (e) {
      rethrow;
    }
  }
}
