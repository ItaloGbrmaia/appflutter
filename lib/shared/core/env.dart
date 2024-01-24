import '../app_config.dart';

mixin Environment {
  static final dev = AppConfig(
    appEnvironment: AppEnvironment.development,
    apiBaseUrl: 'https://applojong.com/api',
  );
}
