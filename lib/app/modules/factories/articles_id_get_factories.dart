import 'package:app/app/modules/factories/articles_id_interface.dart';
import 'package:app/app/modules/usercases/articles_id_usercase.dart';
import 'package:app/shared/data/factories/api_url_factory.dart';
import 'package:app/shared/data/http/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

ArticleLoadId makeGetArticleId() => RemoteLoadArticleId(
      url: makeApiUrl('/article-content?articleid='),
      httpClient: Modular.get<HttpClient>(),
    );
