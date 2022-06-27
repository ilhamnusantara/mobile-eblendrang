class InstansiModel{
  int id_instansi;
  String nama_instansi;


  InstansiModel({
    this.id_instansi,
    this.nama_instansi,
  });

  InstansiModel.fromJson(Map<String, dynamic> json){
    id_instansi = json['id_instansi'];
    nama_instansi = json['nama_instansi'];
  }

  Map<String, dynamic> toJson(){
    return{
      'id_instansi': id_instansi,
      'nama_instansi': nama_instansi,
    };
  }
}