class Transaksi {
  String? transaksiId;
  int? jumlahTerjual;
  String? tanggalTransaksi;
  bool selected = false;

  Transaksi({this.transaksiId, this.jumlahTerjual, this.tanggalTransaksi});

  Transaksi.fromJson(Map<String, dynamic> json) {
    transaksiId = json['transaksi_id'];
    jumlahTerjual = json['jumlah_terjual'];
    tanggalTransaksi = json['tanggal_transaksi'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['transaksi_id'] = transaksiId;
    data['jumlah_terjual'] = jumlahTerjual;
    data['tanggal_transaksi'] = tanggalTransaksi;
    return data;
  }
}
