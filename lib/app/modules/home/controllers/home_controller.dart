import 'dart:developer';

import 'package:flutter_tescodingprojek/app/data/models/barang_detail_model.dart';
import 'package:flutter_tescodingprojek/app/data/models/barang_model.dart';
import 'package:flutter_tescodingprojek/app/data/models/kolektif_model.dart';
import 'package:flutter_tescodingprojek/app/data/providers/barang_detail_provider.dart';
import 'package:flutter_tescodingprojek/app/data/providers/barang_provider.dart';
import 'package:flutter_tescodingprojek/app/data/providers/kolektif_provider.dart';
import 'package:flutter_tescodingprojek/app/data/providers/transaksi_provider.dart';
import 'package:get/get.dart';

import '../../../data/models/transaksi_model.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  var isLoading = false.obs;
  var isError = false.obs;

  var barang = <Barang?>[].obs;
  var transaksi = <Transaksi?>[].obs;
  var barangDetail = <BarangDetail?>[].obs;
  var kolektif = <Kolektif?>[].obs;

  var currentMenuItemTable = "barang".obs;

  late BarangProvider _barangProvider;
  late TransaksiProvider _transaksiProvider;
  late BarangDetailProvider _barangDetailProvider;
  late KolektifProvider _kolektifProvider;

  late Future<dynamic> task;



  @override
  void onInit() {
    super.onInit();
    _barangProvider = BarangProvider();
    _barangProvider.onInit();
    _transaksiProvider = TransaksiProvider();
    _transaksiProvider.onInit();
    _barangDetailProvider = BarangDetailProvider();
    _barangDetailProvider.onInit();
    _kolektifProvider = KolektifProvider();
    _kolektifProvider.onInit();
    task = getBarang();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  //////////////Barang/////////////////////////

  getBarang() async{
    try{
      isLoading(true);
      isError(false);
      barang.value = await _barangProvider.getBarang();
      return barang.value;
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  void insertBarang(Barang barang) async{
    try{
      isLoading(true);
      isError(false);
      await _barangProvider.insertBarang(barang);
      task = getBarang();
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  void updateBarang(String barangId, Barang barang) async{
    try{
      isLoading(true);
      isError(false);
      await _barangProvider.updateBarang(barangId,barang);
      task = getBarang();
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  void deleteBarang(String barangId) async{
    try{
      isLoading(true);
      isError(false);
      await _barangProvider.deleteBarang(barangId);
      task = getBarang();
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  //////////////Transaksi/////////////////////////

  getTransaksi() async{
    try{
      isLoading(true);
      isError(false);
      transaksi.value = await _transaksiProvider.getTransaksi();
      return transaksi.value;
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  void insertTransaksi(Transaksi transaksi) async{
    try{
      isLoading(true);
      isError(false);
      await _transaksiProvider.insertTransaksi(transaksi);
      task = getTransaksi();
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  void updateTransaksi(String transaksiId, Transaksi transaksi) async{
    try{
      isLoading(true);
      isError(false);
      await _transaksiProvider.updateTransaksi(transaksiId,transaksi);
      task = getTransaksi();
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  void deleteTransaksi(String transaksiId) async{
    try{
      isLoading(true);
      isError(false);
      await _transaksiProvider.deleteTransaksi(transaksiId);
      task = getTransaksi();
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  //////////////Barang Detail/////////////////////////

  getBarangDetail() async{
    try{
      isLoading(true);
      isError(false);
      barangDetail.value = await _barangDetailProvider.getBarangDetail();
      return barangDetail.value;
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  void insertBarangDetail(String barangId, String transaksiId, BarangDetail barangDetail) async{
    try{
      isLoading(true);
      isError(false);
      await _barangDetailProvider.insertBarangDetail(barangId,transaksiId,barangDetail);
      task = getBarangDetail();
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  void updateBarangDetail(String barangId, String transaksiId, BarangDetail barangDetail) async{
    try{
      isLoading(true);
      isError(false);
      await _barangDetailProvider.updateBarangDetail(barangId,transaksiId,barangDetail);
      task = getBarangDetail();
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  void deleteBarangDetail(String barangId, String transaksiId) async{
    try{
      isLoading(true);
      isError(false);
      await _barangDetailProvider.deleteBarangDetail(barangId,transaksiId);
      task = getBarangDetail();
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  //////////////Kolektif/////////////////////////

  getKolektif() async{
    try{
      isLoading(true);
      isError(false);
      kolektif.value = await _kolektifProvider.getKolektif();
      return kolektif.value;
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  getKolektifByNama(String nama) async{
    try{
      isLoading(true);
      isError(false);
      kolektif.value = await _kolektifProvider.getKolektifByNama(nama);
      return kolektif.value;
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  getKolektifByTanggal(String tanggal) async{
    try{
      isLoading(true);
      isError(false);
      kolektif.value = await _kolektifProvider.getKolektifByTanggal(tanggal);
      return kolektif.value;
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  getKolektifByTanggalAntara(String dariTgl, String keTgl, String sortResult) async{
    try{
      isLoading(true);
      isError(false);
      kolektif.value = await _kolektifProvider.getKolektifByTanggalAntara(dariTgl, keTgl, sortResult);
      return kolektif.value;
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

  getKolektifByUrutan(String sortResult) async{
    try{
      isLoading(true);
      isError(false);
      kolektif.value = await _kolektifProvider.getKolektifByUrutan(sortResult);
      return kolektif.value;
    }catch(exception){
      log("API Exception: $exception");
      isError(true);
    }finally{
      isLoading(false);
    }
  }

}
