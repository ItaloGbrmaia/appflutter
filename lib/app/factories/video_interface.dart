import 'package:app/app/models/video_models.dart';

abstract class VideoLoad {
  Future<List<VideoModel>?> loadData(int id);
}
