import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._();

  late SharedPreferences _storage;

  static final Storage instance = Storage._();

  Future<void> initialize() async {
    _storage = await SharedPreferences.getInstance();
  }

  String? get theme => _storage.getString('theme');
  void setTheme(final String theme) {
    _storage.setString('theme', theme);
  }

  String? get accessToken => _storage.getString('accessToken');
  void setAccessToken(final String access) {
    _storage.setString('accessToken', access);
  }

  String? get refreshToken => _storage.getString('refreshToken');
  void setRefreshToken(final String refresh) {
    _storage.setString('refreshToken', refresh);
  }

  Future<bool> logout() async {
    bool response = true;
    response &= await _storage.remove('accessToken');
    response &= await _storage.remove('refreshToken');
    return response;
  }
}
