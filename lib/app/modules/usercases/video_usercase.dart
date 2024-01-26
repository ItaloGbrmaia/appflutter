import 'package:app/app/modules/factories/video_interface.dart';
import 'package:app/app/modules/models/video_models.dart';
import 'package:app/shared/data/http/http_client.dart';

class RemoteLoadVideo implements VideoLoad {
  const RemoteLoadVideo({
    required this.url,
    required this.httpClient,
  });

  final String url;
  final HttpClient httpClient;

  @override
  Future<List<VideoModel>> loadData(int id) async {
    try {
      final responseData = await httpClient.request(
        url: "${url}?videos=$id",
        method: 'get',
      );

      List<dynamic> dataList = responseData;
      List<VideoModel> receivedList =
          dataList.map((item) => VideoModel.fromJson(item)).toList();
      return receivedList;
    } catch (e) {
      rethrow;
    }
  }
}
