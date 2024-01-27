import 'package:app/app/factories/articles_interface.dart';
import 'package:app/app/usercases/articles_usercase.dart';
import 'package:app/shared/data/factories/api_url_factory.dart';
import 'package:app/shared/data/http/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

ArticleLoad makeGetArticle() => RemoteLoadArticle(
      url: makeApiUrl('/articles'),
      httpClient: Modular.get<HttpClient>(),
    );
