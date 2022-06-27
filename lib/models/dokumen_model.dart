import 'package:app_eblendrang/models/instansi_model.dart';
import 'dart:convert';

List<DokumenModel> modelDokumenFromJson (String str) =>
    List<DokumenModel>.from(json.decode(str).map((x) => DokumenModel.fromJson(x)));
String modelDokumenToJson(List<DokumenModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DokumenModel{
  int id_dokumen;
  String keterangan_belanja;
  String no_spk;
  String no_bast;
  String alamat;
  Instansi instansi;
  // DateTime createdAt;
  // DateTime updateAt;

  DokumenModel({
    this.id_dokumen,
    this.keterangan_belanja,
    this.no_spk,
    this.no_bast,
    this.alamat,
    this.instansi,
    // this.createdAt,
    // this.updateAt,
  });

  factory DokumenModel.fromJson(Map<String, dynamic> json) => DokumenModel(
    id_dokumen: json["id_dokumen"],
    keterangan_belanja: json["keterangan_belanja"],
    no_spk: json["no_spk"],
    no_bast: json["no_bast"],
    alamat: json["alamat"],
    instansi: Instansi.fromJson(json["instansi"]),
    // createdAt: DateTime.parse(json["created_at"]),
    // updateAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id_dokumen": id_dokumen,
    "keterangan_belanja": keterangan_belanja,
    "no_spk" : no_spk,
    "no_bast" : no_bast,
    "alamat" : alamat,
    "instansi": instansi.toJson(),
    // "created_at": createdAt.toString(),
  };
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