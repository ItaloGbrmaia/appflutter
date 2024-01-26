import 'package:app/app/modules/models/video_models.dart';

abstract class VideoLoad {
  Future<List<VideoModel>?> loadData(int id);
}
