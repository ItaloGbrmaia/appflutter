enum AppEnvironment {
  development,
}

class AppConfig {
  final AppEnvironment appEnvironment;
  final String apiBaseUrl;

  AppConfig({
    required this.appEnvironment,
    required this.apiBaseUrl,
  });

  static late AppConfig _instance;

  static AppConfig getInstance({AppConfig? config}) {
    if (config != null) {
      _instance = config;
      return _instance;
    }
    return _instance;
  }

  bool get isDev {
    if (_instance.appEnvironment == AppEnvironment.development) {
      return true;
    } else {
      return false;
    }
  }
}
