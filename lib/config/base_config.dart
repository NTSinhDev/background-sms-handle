class BaseConfig {
  BaseConfig._();

  static BaseConfig get ins => BaseConfig._();

  Uri uri(Map<String, dynamic>? smsData) {
    if (protocolHttp) {
      return Uri.http(baseURL, endPoint, smsData);
    }

    return Uri.https(baseURL, endPoint, smsData);
  }

  /// true: http, false: https
  bool protocolHttp = true;
  String endPoint = "/api/v1/casso/mobile/callback";
  String baseURL = "192.168.31.51:3300";
}
