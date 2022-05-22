class Barang {
  String? barangId;
  String? namaBarang;
  String? jenisBarang;
  bool selected = false;

  Barang({this.barangId, this.namaBarang, this.jenisBarang});

  Barang.fromJson(Map<String, dynamic> json) {
    barangId = json['barang_id'];
    namaBarang = json['nama_barang'];
    jenisBarang = json['jenis_barang'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['barang_id'] = barangId;
    data['nama_barang'] = namaBarang;
    data['jenis_barang'] = jenisBarang;
    return data;
  }
}
