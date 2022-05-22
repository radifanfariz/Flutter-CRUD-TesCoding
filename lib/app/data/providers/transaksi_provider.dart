import 'package:flutter_tescodingprojek/constant.dart';
import 'package:get/get.dart';

import '../models/transaksi_model.dart';

class TransaksiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Transaksi.fromJson(map);
      if (map is List)
        return map.map((item) => Transaksi.fromJson(item)).toList();
    };
    httpClient.baseUrl = ConstantClass.baseUrl;
  }

  Future<List<Transaksi?>> getTransaksi() async {
    final response = await get('transaksi/');
    return response.body;
  }

  // Future<List<Transaksi?>> getTransaksiByTanggal(String tanggal) async {
  //   var param = {"tanggal_transaksi":tanggal};
  //   final response = await get('transaksi/search/tanggal',query: param);
  //   return response.body;
  // }

  Future<Response> insertTransaksi(Transaksi transaksi) async =>
      await post('transaksi', transaksi.toJson());

  Future<Response> updateTransaksi(String transaksiId, Transaksi transaksi) async => await put('transaksi/$transaksiId', transaksi.toJson());

  Future<Response> deleteTransaksi(String transaksiId) async => await delete('transaksi/$transaksiId');
}
