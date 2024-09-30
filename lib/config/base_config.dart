// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../main.dart';

class BaseConfig {
  BaseConfig._();

  static BaseConfig get ins => BaseConfig._();

  Uri uri(Map<String, dynamic>? smsData) {
    if (protocolHttp) {
      return Uri.http(baseURL, endPoint, smsData);
    }

    return Uri.https(baseURL, endPoint, smsData);
  }


  @override
  String toString() => 'BaseConfig(protocolHttp: $protocolHttp, endPoint: $endPoint, baseURL: $baseURL)';
}
