import 'dart:convert';
import 'package:app_eblendrang/models/dokumen_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DokumenService{
  String baseUrl = 'http://e-blendrang.id/api';
  // String id;

  List dokumens =[];
  // Future getDokumens() async{
  //   try{
  //     final response = await http.get(Uri.parse("http://e-blendrang.id/api/dokumens"));
  //     if(response.statusCode == 200){
  //       final data = jsonDecode(response.body)['data'];
  //       dokumens = data;
  //       print(data);
  //     }
  //   } catch(e){
  //     print(e);
  //   }
  // }
  Future<List<DokumenModel>> getDokumens() async{
    var url = '$baseUrl/dokumens';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);

    print(response.body);
    if(response.statusCode == 200){
      List data = jsonDecode(response.body)['data'];
      print (data);
      List<DokumenModel> dokumens = [];
      for(var item in data){
        dokumens.add(DokumenModel.fromJson(item));
      }
      // print(dokumens);
      return dokumens;
    }else{
      throw Exception('Gagal Get Dokumen!');
    }
  }
}

// List _get = [];
//
// @override
// void initState(){
//   super.initState();
//   _getData();
// }
// Future _getData() async {
//   try{
//     final response = await http.get(Uri.parse(
//       // "http://172.20.10.5/flutter/list.php"
//         "http://e-blendrang.id/api/dokumens"
//     ));
//     if (response.statusCode == 200){
//       final data = jsonDecode(response.body)['data'];
//       setState(() {
//         _get = data;
//         print(data);
//       });
//     }
//   } catch (e){
//     print(e);
//   }
// }