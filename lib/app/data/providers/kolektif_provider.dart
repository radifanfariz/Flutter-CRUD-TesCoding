import 'package:flutter_tescodingprojek/constant.dart';
import 'package:get/get.dart';

import '../models/kolektif_model.dart';

class KolektifProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Kolektif.fromJson(map);
      if (map is List)
        return map.map((item) => Kolektif.fromJson(item)).toList();
    };
    httpClient.baseUrl = ConstantClass.baseUrl;
  }

  Future<List<Kolektif?>> getKolektif() async {
    final response = await get('kolektif');
    return response.body;
  }

  Future<List<Kolektif?>> getKolektifByTanggal(String tanggal) async {
    var param = {"tanggal_transaksi":tanggal};
    final response = await get('kolektif/search/tanggal',query: param);
    return response.body;
  }

  Future<List<Kolektif?>> getKolektifByTanggalAntara(String dariTgl, String keTgl, String sortResult) async {
    var param = {"dari_tanggal":dariTgl, "ke_tanggal":keTgl, "sort_result":sortResult};
    final response = await get('kolektif/search/tanggal-antara',query: param);
    return response.body;
  }

  Future<List<Kolektif?>> getKolektifByNama(String nama) async {
    var param = {"nama_barang":nama};
    final response = await get('kolektif/search/nama', query: param);
    return response.body;
  }

  Future<List<Kolektif?>> getKolektifByUrutan(String sortResult) async {
    final response = await get('kolektif/urutkan/$sortResult');
    return response.body;
  }
}
