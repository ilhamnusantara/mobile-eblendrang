import 'package:app_eblendrang/models/dokumen_model.dart';
import 'package:app_eblendrang/services/dokumen_service.dart';
import 'package:flutter/material.dart';

class DokumenProvider with ChangeNotifier {
  List<DokumenModel> _dokumens = [];

  List<DokumenModel> get dokumens => _dokumens;

  set dokumens(List<DokumenModel> dokumens) {
    _dokumens = dokumens;
    notifyListeners();
  }
  // Future<void> getDokumens() async{
  //   return await DokumenService().getDokumens().toString();
  // }

  Future<void> getDokumens() async {
    try {
      List<DokumenModel> dokumens = await DokumenService().getDokumens();
      _dokumens = dokumens;
      print(_dokumens);
      return _dokumens;
    } catch (e) {
      print(e);
    }
  }
}
