import 'package:app/modules/home/factories/articles_interface.dart';
import 'package:app/modules/home/usercases/articles_usercase.dart';
import 'package:app/shared/data/factories/api_url_factory.dart';
import 'package:app/shared/data/http/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

ArticleLoad makeGetArticle() => RemoteLoadArticle(
      url: makeApiUrl('/articles'),
      httpClient: Modular.get<HttpClient>(),
    );
