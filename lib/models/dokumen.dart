part of 'models.dart';

class Dokumen extends Equatable {
  Dokumen({
    required this.idDokumen,
    required this.idJenis,
    required this.idInstansi,
    required this.keteranganBelanja,
    required this.rincianBelanja,
    required this.noSpk,
    required this.tglSpk,
    required this.fileSpk,
    required this.noBast,
    required this.tglBast,
    required this.fileBast,
    required this.merk,
    required this.bahan,
    required this.type,
    required this.ukuran,
    required this.alamat,
    required this.foto,
    required this.status,
    required this.statusBelanja,
    required this.tahun,
    required this.createdAt,
    required this.updatedAt,
  });

  final int idDokumen;
  final int idJenis;
  final int idInstansi;
  final String keteranganBelanja;
  final dynamic rincianBelanja;
  final dynamic noSpk;
  final dynamic tglSpk;
  final dynamic fileSpk;
  final dynamic noBast;
  final dynamic tglBast;
  final dynamic fileBast;
  final dynamic merk;
  final dynamic bahan;
  final dynamic type;
  final dynamic ukuran;
  final dynamic alamat;
  final dynamic foto;
  final String status;
  final String statusBelanja;
  final String tahun;
  final DateTime createdAt;
  final DateTime updatedAt;

  Dokumen copyWith({
    required int idDokumen,
    required int idJenis,
    required int idInstansi,
    required String keteranganBelanja,
    required dynamic rincianBelanja,
    required dynamic noSpk,
    required dynamic tglSpk,
    required dynamic fileSpk,
    required dynamic noBast,
    required dynamic tglBast,
    required dynamic fileBast,
    required dynamic merk,
    required dynamic bahan,
    required dynamic type,
    required dynamic ukuran,
    required dynamic alamat,
    required dynamic foto,
    required String status,
    required String statusBelanja,
    required String tahun,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) =>
      Dokumen(
        idDokumen: idDokumen ?? this.idDokumen,
        idJenis: idJenis ?? this.idJenis,
        idInstansi: idInstansi ?? this.idInstansi,
        keteranganBelanja: keteranganBelanja ?? this.keteranganBelanja,
        rincianBelanja: rincianBelanja ?? this.rincianBelanja,
        noSpk: noSpk ?? this.noSpk,
        tglSpk: tglSpk ?? this.tglSpk,
        fileSpk: fileSpk ?? this.fileSpk,
        noBast: noBast ?? this.noBast,
        tglBast: tglBast ?? this.tglBast,
        fileBast: fileBast ?? this.fileBast,
        merk: merk ?? this.merk,
        bahan: bahan ?? this.bahan,
        type: type ?? this.type,
        ukuran: ukuran ?? this.ukuran,
        alamat: alamat ?? this.alamat,
        foto: foto ?? this.foto,
        status: status ?? this.status,
        statusBelanja: statusBelanja ?? this.statusBelanja,
        tahun: tahun ?? this.tahun,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Dokumen.fromJson(Map<String, dynamic> json) => Dokumen(
        idDokumen: json["id_dokumen"],
        idJenis: json["id_jenis"],
        idInstansi: json["id_instansi"],
        keteranganBelanja: json["keterangan_belanja"],
        rincianBelanja: json["rincian_belanja"],
        noSpk: json["no_spk"],
        tglSpk: json["tgl_spk"],
        fileSpk: json["file_spk"],
        noBast: json["no_bast"],
        tglBast: json["tgl_bast"],
        fileBast: json["file_bast"],
        merk: json["merk"],
        bahan: json["bahan"],
        type: json["type"],
        ukuran: json["ukuran"],
        alamat: json["alamat"],
        foto: json["foto"],
        status: json["status"],
        statusBelanja: json["status_belanja"],
        tahun: json["tahun"],
        createdAt: (json["created_at"] == null)
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: (json["updated_at"] == null)
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id_dokumen": idDokumen,
        "id_jenis": idJenis,
        "id_instansi": idInstansi,
        "keterangan_belanja": keteranganBelanja,
        "rincian_belanja": rincianBelanja,
        "no_spk": noSpk,
        "tgl_spk": tglSpk,
        "file_spk": fileSpk,
        "no_bast": noBast,
        "tgl_bast": tglBast,
        "file_bast": fileBast,
        "merk": merk,
        "bahan": bahan,
        "type": type,
        "ukuran": ukuran,
        "alamat": alamat,
        "foto": foto,
        "status": status,
        "status_belanja": statusBelanja,
        "tahun": tahun,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };

  @override
  List<Object?> get props => [idDokumen, idJenis, idInstansi, noSpk, noBast];
}
