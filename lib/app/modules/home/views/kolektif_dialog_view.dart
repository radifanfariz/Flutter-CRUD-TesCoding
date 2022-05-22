import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constant.dart';
import '../controllers/home_controller.dart';

class KolektifDialogView {
  static void dialogSearchByNama(BuildContext context,HomeController controller){
    late String namaBarang = "";
    Get.defaultDialog(
        title: "Search By Nama",
        titleStyle: const TextStyle(fontSize: 25),
        content: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value){
                  namaBarang = value.toString();
                  // log("Test Text : ${namaBarang}");
                },
                style: Theme.of(context).textTheme.headline6,
                decoration: const InputDecoration(
                    labelText: "Nama Barang",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
            ],
          ),
        ),
        textCancel: "Cancel",
        textConfirm: "Search",
        buttonColor: Colors.green,
        confirmTextColor: Colors.black,
        cancelTextColor: Colors.black,
        onConfirm: () {
          if(namaBarang != ""){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.task = controller.getKolektifByNama(namaBarang);
          ConstantClass.showToast("Searching... !",
              color: Colors.green);
            Get.back();
          }else{
            ConstantClass.showToast("Invalid Parameter !",
                color: Colors.green);
            Get.back();
          }
        }
    );
  }

  static void dialogSearchByTanggal(BuildContext context,HomeController controller){
    late String tanggalTransaksi = "";
    Get.defaultDialog(
        title: "Search By Tanggal",
        titleStyle: const TextStyle(fontSize: 25),
        content: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value){
                  tanggalTransaksi = value.toString();
                  // log("Test Text : ${namaBarang}");
                },
                style: Theme.of(context).textTheme.headline6,
                decoration: const InputDecoration(
                    labelText: "Tanggal Transaksi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
            ],
          ),
        ),
        textCancel: "Cancel",
        textConfirm: "Search",
        buttonColor: Colors.green,
        confirmTextColor: Colors.black,
        cancelTextColor: Colors.black,
        onConfirm: () {
          if(tanggalTransaksi != ""){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.task = controller.getKolektifByTanggal(tanggalTransaksi);
            ConstantClass.showToast("Searching... !",
                color: Colors.green);
            Get.back();
          }else{
            ConstantClass.showToast("Invalid Parameter !",
                color: Colors.green);
            Get.back();
          }
        }
    );
  }

  static void dialogSearchByTanggalAntara(BuildContext context,HomeController controller){
    late String daritgl = "";
    late String keTgl = "";
    late String sortResult = "DESC";
    Get.defaultDialog(
        title: "Search By Tanggal Antara",
        titleStyle: const TextStyle(fontSize: 25),
        content: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value){
                  daritgl = value.toString();
                  // log("Test Text : ${namaBarang}");
                },
                style: Theme.of(context).textTheme.headline6,
                decoration: const InputDecoration(
                    labelText: "Dari Tanggal Transaksi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: TextFormField(
                  onChanged: (value){
                    keTgl = value.toString();
                    // log("Test Text : ${namaBarang}");
                  },
                  style: Theme.of(context).textTheme.headline6,
                  decoration: const InputDecoration(
                      labelText: "Ke Tanggal Transaksi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: DropdownButtonFormField<dynamic>(
                  onChanged: (value) {
                    if(value.toString() == "besar"){
                      sortResult = "DESC";
                    }else{
                      sortResult = "ASC";
                    }
                  },
                  style: Theme.of(context).textTheme.headline6,
                  decoration: const InputDecoration(
                      labelText: "Urutkan Transaksi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                  items: urutanMenuItem,
                ),
              ),
            ],
          ),
        ),
        textCancel: "Cancel",
        textConfirm: "Search",
        buttonColor: Colors.green,
        confirmTextColor: Colors.black,
        cancelTextColor: Colors.black,
        onConfirm: () {
          if(daritgl != "" && keTgl != ""){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.task = controller.getKolektifByTanggalAntara(daritgl, keTgl, sortResult);
            ConstantClass.showToast("Searching... !",
                color: Colors.green);
            Get.back();
          }else{
            ConstantClass.showToast("Invalid Parameter !",
                color: Colors.green);
            Get.back();
          }
        }
    );
  }
}

const urutanMenuItem = <DropdownMenuItem>[
  DropdownMenuItem(
    value: "besar",
    child: Text("Paling Besar"),
  ),
  DropdownMenuItem(
    value: "kecil",
    child: Text("Paling Kecil"),
  ),
];