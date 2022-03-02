class CharNetworkManager {
  static CharNetworkManager? _instance;
  static CharNetworkManager get instance {
    if (_instance != null) return _instance!;
    _instance = CharNetworkManager._init();
    return _instance!;
  }

  CharNetworkManager._init();
}
