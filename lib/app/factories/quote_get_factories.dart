import 'package:app/app/factories/quote_interface.dart';
import 'package:app/app/usercases/quote-usercase.dart';
import 'package:app/shared/data/factories/api_url_factory.dart';
import 'package:app/shared/data/http/http_client.dart';
import 'package:flutter_modular/flutter_modular.dart';

QuoteLoad makeGetQuote() => RemoteLoadQuote(
      url: makeApiUrl('/quotes2'),
      httpClient: Modular.get<HttpClient>(),
    );
