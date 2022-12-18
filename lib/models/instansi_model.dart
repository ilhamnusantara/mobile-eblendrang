class InstansiModel{
  int id_instansi;
  String nama_instansi;
  int data_null;


  InstansiModel({
    this.id_instansi,
    this.nama_instansi,
    this.data_null,
  });

  factory InstansiModel.fromJson(Map<String, dynamic> json){
    return InstansiModel(
      id_instansi: json['id_instansi'],
      nama_instansi: json['nama_instansi'],
      data_null: json['data_null'],
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data= new Map<String, dynamic>();
    data['id_instansi'] = this.id_instansi;
    data['nama_instansi'] = this.nama_instansi;
    data['data_null'] = this.data_null;
    return data;
  }
}