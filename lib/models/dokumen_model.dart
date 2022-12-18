// import 'package:app_eblendrang/models/instansi_model.dart';
import 'dart:convert';

// List<DokumenModel> modelDokumenFromJson (String str) =>
//     List<DokumenModel>.from(json.decode(str).map((x) => DokumenModel.fromJson(x)));
// String modelDokumenToJson(List<DokumenModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DokumenModel{
  int id_dokumen;
  String keterangan_belanja;
  String no_spk;
  DateTime tanggal_spk;
  String no_bast;
  String alamat;
  Instansi instansi;
  // DateTime createdAt;
  // DateTime updateAt;

  DokumenModel({
    this.id_dokumen,
    this.keterangan_belanja,
    this.no_spk,
    this.tanggal_spk,
    this.no_bast,
    this.alamat,
    this.instansi,
    // this.createdAt,
    // this.updateAt,
  });

  factory DokumenModel.fromJson(Map<String, dynamic> json){
  return DokumenModel(
    id_dokumen: json['id_dokumen'],
    keterangan_belanja: json['keterangan_belanja'],
    no_spk: json['no_spk'],
    tanggal_spk: DateTime.parse(json['tgl_spk']),
    no_bast: json['no_bast'],
    alamat: json['alamat'],
    instansi: Instansi.fromJson(json['instansi']),
    // createdAt: DateTime.parse(json["created_at"]),
    // updateAt: DateTime.parse(json["updated_at"]),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data= new Map<String, dynamic>();
    data['id_dokumen'] = this.id_dokumen;
    data ['keterangan_belanja'] = this.keterangan_belanja;
    data['no_spk'] = this.no_spk;
    data['tgl_spk'] = this.tanggal_spk.toString();
    data['no_bast'] = this.no_bast;
    data['alamat'] = this.alamat;
    data['instansi']= this.instansi.toJson();
    // "created_at": createdAt.toString(),
    return data;
  }
}

class Instansi{
  int id_instansi;
  String nama_instansi;

  Instansi({
    this.id_instansi,
    this.nama_instansi,
  });

  factory Instansi.fromJson(Map<String, dynamic> json) => Instansi(
    nama_instansi: json["nama_instansi"],
  );

  Map<String, dynamic> toJson() => {
    "nama_instansi": nama_instansi,
  };
}

class UninitializedDokumenModel extends DokumenModel {}