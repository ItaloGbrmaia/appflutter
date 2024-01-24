import 'package:app/shared/app_config.dart';

String makeApiUrl(String path) => '${AppConfig.getInstance().apiBaseUrl}$path';
