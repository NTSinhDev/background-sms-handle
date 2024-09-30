import 'package:shared_preferences/shared_preferences.dart';

const _kLCSKeyHttpConfigBaseURL = "HttpConfig-baseURL";
const _kLCSKeyHttpConfigEndPoint = "HttpConfig-endPoint";
const _kLCSKeyHttpConfigProtocol = "HttpConfig-protocol";

class LocalStoreService {
  SharedPreferences? _sharedPrefer;
  Future<void> config() async {
    _sharedPrefer = await SharedPreferences.getInstance();
  }

  Future<bool> setBaseURL(String value) async {
    final result = await _sharedPrefer?.setString(
      _kLCSKeyHttpConfigBaseURL,
      value,
    );
    return result ?? false;
  }

  String? get baseURL => _sharedPrefer?.getString(_kLCSKeyHttpConfigBaseURL);

  Future<bool> setEndPoint(String value) async {
    final result = await _sharedPrefer?.setString(
      _kLCSKeyHttpConfigEndPoint,
      value,
    );
    return result ?? false;
  }

  String? get endPoint => _sharedPrefer?.getString(_kLCSKeyHttpConfigEndPoint);

  Future<bool> setProtocol(bool value) async {
    final result = await _sharedPrefer?.setBool(
      _kLCSKeyHttpConfigProtocol,
      value,
    );
    return result ?? false;
  }

  bool? get protocol => _sharedPrefer?.getBool(_kLCSKeyHttpConfigProtocol);
}
