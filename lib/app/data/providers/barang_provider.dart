import 'dart:developer';

import 'package:flutter_tescodingprojek/app/data/models/transaksi_model.dart';
import 'package:get/get.dart';

import '../../../constant.dart';
import '../models/barang_model.dart';

class BarangProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Barang.fromJson(map);
      if (map is List) return map.map((item) => Barang.fromJson(item)).toList();
    };
    httpClient.baseUrl = ConstantClass.baseUrl;
  }

  Future<List<Barang?>> getBarang() async {
    final response = await get('barang');
    log("Test Response : ${response.bodyString}");
    return response.body;
  }

  // Future<List<Barang?>> getBarangByNama(String nama) async {
  //   var param = {"nama_barang":nama};
  //   final response = await get('barang/search/nama',query: param);
  //   return response.body;
  // }

  Future<Response> insertBarang(Barang barang) async =>
      await post('barang', barang.toJson());

  Future<Response> updateBarang(String barangId, Barang barang) async => await put('barang/$barangId', barang.toJson());

  Future<Response> deleteBarang(String barangId) async => await delete('barang/$barangId');
}
