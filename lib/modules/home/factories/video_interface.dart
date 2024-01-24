import 'package:app/modules/home/models/video_models.dart';

abstract class VideoLoad {
  Future<List<VideoModel>?> loadData(int id);
}
