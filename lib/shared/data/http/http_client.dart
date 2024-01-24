import 'package:flutter/foundation.dart';

@immutable
abstract class HttpClient {
  const HttpClient();

  Future<dynamic> request({
    required String url,
    required String method,
    Map<String, dynamic>? body,
    Map? headers,
  });
}
