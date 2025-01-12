import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:sistema_de_reservas/models/user.dart';
import 'package:sistema_de_reservas/models/user_credentials.dart';

class AuthService {
  final apiKey = 'AIzaSyBEZ-xCPo7BhOxONr2V359RgNGsev8UBCo';
  final apiUrl = 'https://reserv-app-77552-default-rtdb.firebaseio.com';
  final authApi = 'https://identitytoolkit.googleapis.com/v1/accounts';
  final apiHeaders = <String, String>{
    'Content-Type': 'application/json',
  };

  Future<User?> signUp({
    required String email,
    required String password,
    required String name,
    required int age,
  }) async {
    final url = Uri.parse('$authApi:signUp?key=$apiKey');

    final resquestBody = jsonEncode({
      'email': email,
      'password': password,
      'returnSecureToken': false,
    });

    final response =
        await http.post(url, headers: apiHeaders, body: resquestBody);

    if (response.statusCode != 200) {
      debugPrint('Status Code text: ${response.reasonPhrase}');
      return null;
    }

    final credentials = jsonDecode(response.body);
    final localId = credentials['localId'];
    final urlApi = Uri.parse('$apiUrl/users/$localId.json');

    final responseApi = await http.put(urlApi,
        body: jsonEncode({
          'name': name,
          'email': email,
          'age': age,
        }));
    if (responseApi.statusCode != 200) {
      return null;
    }
    return User(
        id: localId,
        name: name,
        email: email,
        age: age,
        credentials: UserCredentials(
            token: credentials['idToken'],
            refreshToken: credentials['refreshToken'],
            expiresIn: int.parse(credentials['expiresIn'])));
  }

  Future<bool> signIn(String email, String password) async {
    final url = Uri.parse('$authApi:signInWithPassword?key=$apiKey');

    final body = jsonEncode({
      'email': email,
      'password': password,
      'returnSecureToken': true,
    });

    final reponse = await http.post(
      url,
      headers: apiHeaders,
      body: body,
    );

    if (reponse.statusCode != 200) {
      return false;
    }
    return true;
  }
}
