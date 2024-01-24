import 'dart:convert';
import 'dart:developer';
import 'package:app/shared/data/http/http_client.dart';
import 'package:app/shared/data/http/http_error.dart';
import 'package:dio/dio.dart';

class HttpAdapter implements HttpClient {
  final Dio dio;

  HttpAdapter(this.dio);

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
  }) async {
    const token =
        "O7Kw5E2embxod5YtL1h1YsGNN7FFN8wIxPYMg6J9zFjE6Th9oDssEsFLVhxf";
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'accept': 'application/json',
        'content-type': 'application/json',
        'Authorization': 'Bearer $token',
      });

    late Response<dynamic> response;
    final jsonBody = body != null ? jsonEncode(body) : null;
    final uri = Uri.parse(url);

    try {
      if (method == 'get') {
        response = await dio.get(
          uri.toString(),
          options: Options(headers: defaultHeaders),
        );
      } else if (method == 'post') {
        response = await dio.post(
          uri.toString(),
          options: Options(headers: defaultHeaders),
          data: jsonBody,
        );
      } else if (method == 'put') {
        response = await dio.put(
          uri.toString(),
          options: Options(headers: defaultHeaders),
          data: jsonBody,
        );
      } else if (method == 'delete') {
        response = await dio.delete(
          uri.toString(),
          options: Options(headers: defaultHeaders),
          data: jsonBody,
        );
      }
    } catch (error) {
      log('''
        ${response.requestOptions.method} [${response.statusCode}] ${uri.path}
        error: $error
      ''');

      throw HttpError.serverError;
    }

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response<dynamic> response) {
    final data = response.data;

    if ([200, 201, 403].contains(response.statusCode)) return data;

    log('''
        ${response.requestOptions.method} [${response.statusCode}] ${response.requestOptions.uri.path}
        info: ${data?['message']}
        data: $data
    ''');

    switch (response.statusCode) {
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 404:
        throw HttpError.notFound;
      case 422:
        throw HttpError.unprocessableEntity;
      default:
        throw HttpError.serverError;
    }
  }
}
