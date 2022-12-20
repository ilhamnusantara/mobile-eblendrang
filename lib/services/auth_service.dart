import 'dart:convert';

import 'package:app_eblendrang/models/models.dart';
import 'package:app_eblendrang/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://103.23.198.126/api';
  Future<User> register({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    var url = '$baseUrl/register';
    var header = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data);
      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<User> login({
    required String username,
    required String password,
  }) async {
    var url = '$baseUrl/login';
    var header = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'username': username,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: header,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      // UserModel user = UserModel.fromJson(data['user']);
      User user = User.fromJson(data);
      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
