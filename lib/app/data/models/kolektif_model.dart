class Kolektif {
  String? barangId;
  String? namaBarang;
  String? jenisBarang;
  int? stok;
  int? jumlahTerjual;
  String? tanggalTransaksi;
  String? transaksiId;
  bool selected = false;

  Kolektif(
      {this.barangId,
      this.namaBarang,
      this.jenisBarang,
      this.stok,
      this.jumlahTerjual,
      this.tanggalTransaksi,
      this.transaksiId});

  Kolektif.fromJson(Map<String, dynamic> json) {
    barangId = json['barang_id'];
    namaBarang = json['nama_barang'];
    jenisBarang = json['jenis_barang'];
    stok = json['stok'];
    jumlahTerjual = json['jumlah_terjual'];
    tanggalTransaksi = json['tanggal_transaksi'];
    transaksiId = json['transaksi_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['barang_id'] = barangId;
    data['nama_barang'] = namaBarang;
    data['jenis_barang'] = jenisBarang;
    data['stok'] = stok;
    data['jumlah_terjual'] = jumlahTerjual;
    data['tanggal_transaksi'] = tanggalTransaksi;
    data['transaksi_id'] = transaksiId;
    return data;
  }
}
