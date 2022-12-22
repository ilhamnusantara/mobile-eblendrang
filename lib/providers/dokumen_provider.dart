import 'package:app_eblendrang/models/models.dart';
import 'package:app_eblendrang/services/dokumen_service.dart';
import 'package:flutter/material.dart';

class DokumenProvider with ChangeNotifier {
  List<Instansi> _dokumens = [];

  List<Instansi> get dokumens => _dokumens;

  set dokumens(List<Instansi> dokumens) {
    _dokumens = dokumens;
    notifyListeners();
  }
  // Future<void> getDokumens() async{
  //   return await DokumenService().getDokumens().toString();
  // }

  Future<List<Instansi>> getDokumens() async {
    try {
      List<Instansi> dokumens = await DokumenService().getDokumens();
      var _dokumens = dokumens;
      print(_dokumens);
      return _dokumens;
    } catch (e) {
      print(e);
    }
    return [];
  }
}
