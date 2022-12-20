part of 'models.dart';

class Instansi {
  Instansi({
    required this.idInstansi,
    required this.namaInstansi,
    required this.alamat,
    required this.noTelp,
    required this.createdAt,
    required this.updatedAt,
  });

  final int idInstansi;
  final String namaInstansi;
  final String alamat;
  final String noTelp;
  final dynamic createdAt;
  final dynamic updatedAt;

  Instansi copyWith({
    required int idInstansi,
    required String namaInstansi,
    required String alamat,
    required String noTelp,
    required dynamic createdAt,
    required dynamic updatedAt,
  }) =>
      Instansi(
        idInstansi: idInstansi ?? this.idInstansi,
        namaInstansi: namaInstansi ?? this.namaInstansi,
        alamat: alamat ?? this.alamat,
        noTelp: noTelp ?? this.noTelp,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Instansi.fromJson(Map<String, dynamic> json) => Instansi(
        idInstansi: json["id_instansi"],
        namaInstansi: json["nama_instansi"],
        alamat: json["alamat"],
        noTelp: json["no_telp"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id_instansi": idInstansi,
        "nama_instansi": namaInstansi,
        "alamat": alamat,
        "no_telp": noTelp,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
