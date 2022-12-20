import 'dart:convert';
import 'package:app_eblendrang/models/dokumen_model_backup2.dart';
import 'package:http/http.dart' as http;

class DokumenService {
  String baseUrl = 'http://e-blendrang.id/api';
  late String id;
  Future<List<DokumenModel>> getDokumens() async {
    var url = '$baseUrl/dokumens';
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);

    print(response.body);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      print(data);
      List<DokumenModel> dokumens = [];
      for (var item in data) {
        dokumens.add(DokumenModel.fromJson(item));
      }
      print(dokumens);
      return dokumens;
    } else {
      throw Exception('Gagal Get Dokumen!');
    }
  }
}
