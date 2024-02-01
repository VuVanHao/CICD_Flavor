enum Environment { DEV, PROD }

class AppEnvironment {
  static var _config = _AppConfig(flavorName: 'DEV');

  static void _set({required Environment env}) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.devEnvironment;
        break;
      case Environment.PROD:
        _config = _Config.prodEnvironment;
        break;
      default:
        _config = _Config.devEnvironment;
        break;
    }
  }

  static void getAndSetEnv({required String flavorName}) {
    if (flavorName.toUpperCase() == Environment.DEV.name) {
      _set(env: Environment.DEV);
    } else if (flavorName.toUpperCase() == Environment.PROD.name) {
      _set(env: Environment.PROD);
    }
  }

  static _AppConfig getConfig() => _config;
}

class _Config {
  static final devEnvironment = _AppConfig(
    apiBaseUrl: 'https://smart-info-api.merket.io/',
    header: _header,
    receiveTimeout: _receiveTimeout,
    connectionTimeout: _connectionTimeout,
    flavorName: Environment.DEV.name,
  );
  static final prodEnvironment = _AppConfig(
    apiBaseUrl: 'https://apismartinfo.mbbank.com.vn/',
    header: _header,
    receiveTimeout: _receiveTimeout,
    connectionTimeout: _connectionTimeout,
    flavorName: Environment.PROD.name,
  );

  static const _header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static const int _receiveTimeout = 60000;
  static const int _connectionTimeout = 60000;
}

class _AppConfig {
  _AppConfig({
    this.header,
    this.receiveTimeout,
    this.connectionTimeout,
    required this.flavorName,
    this.apiBaseUrl,
  });

  final String flavorName;
  final String? apiBaseUrl;
  final Map<String, String>? header;
  final int? receiveTimeout;
  final int? connectionTimeout;
}
