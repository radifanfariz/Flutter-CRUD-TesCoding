class BarangDetail {
  String? barangId;
  String? transaksiId;
  int? stok;
  bool selected = false;

  BarangDetail({this.barangId, this.transaksiId, this.stok});

  BarangDetail.fromJson(Map<String, dynamic> json) {
    barangId = json['barang_id'];
    transaksiId = json['transaksi_id'];
    stok = json['stok'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['barang_id'] = barangId;
    data['transaksi_id'] = transaksiId;
    data['stok'] = stok;
    return data;
  }
}
