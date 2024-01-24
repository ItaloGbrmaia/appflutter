import 'package:app/modules/home/factories/video_interface.dart';
import 'package:app/modules/home/usercases/video_usercase.dart';
import 'package:app/shared/data/factories/api_url_factory.dart';
import 'package:app/shared/data/http/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

VideoLoad makeGetVideo() => RemoteLoadVideo(
      url: makeApiUrl('/videos'),
      httpClient: Modular.get<HttpClient>(),
    );
