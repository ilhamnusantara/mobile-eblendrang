import 'dart:convert';

import 'package:app_eblendrang/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService{
  String baseUrl = 'http://http://103.139.192.186//api';
  Future<UserModel> register({
    String name,
    String username,
    String email,
    String password,
  }) async{
    var url = '$baseUrl/register';
    var header = {'Content-Type' : 'application/json'};
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

    if(response.statusCode == 200){
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'bearer ' + data['access_token'];
      return user;
    }else{
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String username,
    String password,
  }) async{
    var url = '$baseUrl/login';
    var header = {'Content-Type' : 'application/json'};
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

    if(response.statusCode == 200){
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'bearer ' + data['access_token'];
      return user;
    }else{
      throw Exception('Gagal Login');
    }
  }
}