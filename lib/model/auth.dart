import 'dart:convert';

class User{

}
class Auth {
  final String accessToken;
  final User? user;
  Auth({
    required this.accessToken,
    this.user,
  });

  String get getToken => 'Bearer $accessToken';

  factory Auth.fromMap(Map<String, dynamic> map) {
    // final info = map['info'] ?? {};
    return Auth(
      accessToken: map['token'] as String,
      // customer: info.isNotEmpty ? Customer.fromMap(info) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': accessToken,
      // 'info': user?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());
}
