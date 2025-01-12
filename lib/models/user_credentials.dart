// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserCredentials {
  final String token;
  final String refreshToken;
  final int expiresIn;

  UserCredentials({
    required this.token,
    required this.refreshToken,
    required this.expiresIn,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'refreshToken': refreshToken,
      'expiresIn': expiresIn,
    };
  }

  factory UserCredentials.fromMap(Map<String, dynamic> map) {
    return UserCredentials(
      token: map['token'] as String,
      refreshToken: map['refreshToken'] as String,
      expiresIn: map['expiresIn'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCredentials.fromJson(String source) =>
      UserCredentials.fromMap(json.decode(source) as Map<String, dynamic>);
}
