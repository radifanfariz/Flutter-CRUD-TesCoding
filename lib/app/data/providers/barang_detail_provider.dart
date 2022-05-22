import 'dart:developer';

import 'package:flutter_tescodingprojek/constant.dart';
import 'package:get/get.dart';

import '../models/barang_detail_model.dart';

class BarangDetailProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return BarangDetail.fromJson(map);
      if (map is List)
        return map.map((item) => BarangDetail.fromJson(item)).toList();
    };
    httpClient.baseUrl = ConstantClass.baseUrl;
  }

  Future<List<BarangDetail?>> getBarangDetail() async {
    final response = await get('barang_detail');
    return response.body;
  }

  Future<Response> insertBarangDetail(String barangId,String transaksiId,BarangDetail barangDetail) async =>
      await post('barang_detail/$barangId/$transaksiId', barangDetail.toJson());

  Future<Response> updateBarangDetail(String barangId,String transaksiId, BarangDetail barangDetail) async => await put('barang_detail/$barangId/$transaksiId', barangDetail.toJson());

  Future<Response> deleteBarangDetail(String barangId,String transaksiId,) async => await delete('barang_detail/$barangId/$transaksiId');
}
