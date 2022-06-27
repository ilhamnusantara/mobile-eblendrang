import 'package:app_eblendrang/models/instansi_model.dart';

class DokumenModel{
  int id_dokumen;
  String keterangan_belanja;
  String no_spk;
  String no_bast;
  String alamat;
  InstansiModel instansi;
  DateTime createdAt;
  DateTime updateAt;
  DokumenModel({
    this.id_dokumen,
    this.keterangan_belanja,
    this.no_spk,
    this.no_bast,
    this.alamat,
    this.instansi,
    this.createdAt,
    this.updateAt,
  });

  DokumenModel.fromJson(Map<String, dynamic> json){
    id_dokumen = json['id_dokumen'];
    keterangan_belanja = json['keterangan_belanja'];
    no_spk = json['no_spk'];
    no_bast = json['no_bast'];
    alamat = json['alamat'];
    instansi = InstansiModel.fromJson(json['instansi']);
    createdAt = DateTime.parse(json['created_at']);
    updateAt = DateTime.parse(json['updated_at']);

  }

  Map<String, dynamic> toJson(){
    return{
      'id_dokumen': id_dokumen,
      'keterangan_belanja': keterangan_belanja,
      'no_spk' : no_spk,
      'no_bast' : no_bast,
      'alamat' : alamat,
      'instansi': instansi.toJson(),
      'created_at': createdAt.toString(),
      'updated_at': updateAt.toString(),
    };
  }
}

class UninitializedDokumenModel extends DokumenModel {}