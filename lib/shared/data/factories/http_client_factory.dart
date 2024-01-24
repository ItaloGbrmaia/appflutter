import 'package:app/shared/data/http/http_adapter.dart';
import 'package:app/shared/data/http/http_client.dart';
import 'package:dio/dio.dart';

HttpClient makeHttpAdapter() => HttpAdapter(
      Dio(),
    );
