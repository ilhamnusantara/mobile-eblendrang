import 'package:app_eblendrang/models/instansi_model.dart';

class UserModel{
  int id;
  String name;
  String username;
  String email;
  String password;
  int status;
  InstansiModel instansi;
  String token;

  UserModel({
  this.id, this.name, this.username, this.email, this.password, this.instansi, this.token
  });

  UserModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    instansi = InstansiModel.fromJson(json['instansi']);
    token = json['token'];
  }

  Map<String, dynamic> toJson(){
    return{
      'id' : id,
      'name' :name,
      'username' : username,
      'email' : email,
      'password' : password,
      'instansi' : instansi.toJson(),
      'token' : token,
    };
  }
}