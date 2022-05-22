import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tescodingprojek/app/data/models/barang_model.dart';
import 'package:flutter_tescodingprojek/app/data/models/transaksi_model.dart';
import 'package:flutter_tescodingprojek/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

import '../../../../constant.dart';

class TransaksiDialogView {

  static void dialogInsert(BuildContext context,HomeController controller){
    late int jumlahBarang = 0;
    late String tanggalTransaksi = "";
    Get.defaultDialog(
        title: "Insert Transaksi",
        titleStyle: const TextStyle(fontSize: 25),
        content: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value){
                  jumlahBarang = int.parse(value);
                  // log("Test Text : ${namaBarang}");
                },
                style: Theme.of(context).textTheme.headline6,
                decoration: const InputDecoration(
                    labelText: "Jumlah Transaksi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  onChanged: (value){
                    tanggalTransaksi = value.toString();
                  },
                  style: Theme.of(context).textTheme.headline6,
                  decoration: const InputDecoration(
                      labelText: "Tanggal Transaksi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
            ],
          ),
        ),
        textCancel: "Cancel",
        textConfirm: "Okay",
        buttonColor: Colors.green,
        confirmTextColor: Colors.black,
        cancelTextColor: Colors.black,
        onConfirm: () {
          if(jumlahBarang != 0 && tanggalTransaksi != ""){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.insertTransaksi(Transaksi(jumlahTerjual: jumlahBarang,tanggalTransaksi: tanggalTransaksi));
            ConstantClass.showToast("Item Inserted !",
                color: Colors.green);
            Get.back();
          }else{
            ConstantClass.showToast("Invalid Item !",
                color: Colors.green);
            Get.back();
          }
        }
    );
  }

  static void dialogUpdate(BuildContext context,HomeController controller,Transaksi transaksi){
    late int jumlahTransaksi = transaksi.jumlahTerjual!;
    late String tanggalTransaksi = ConstantClass.formatDateTime(transaksi.tanggalTransaksi!);

    Get.defaultDialog(
        title: "Update Transaksi",
        titleStyle: const TextStyle(fontSize: 25),
        content: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value){
                  jumlahTransaksi = int.parse(value);
                  // log("Test Text : ${namaBarang}");
                },
                style: Theme.of(context).textTheme.headline6,
                initialValue: jumlahTransaksi.toString(),
                decoration: const InputDecoration(
                    labelText: "Jumlah Transaksi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  onChanged: (value){
                    tanggalTransaksi = value.toString();
                  },
                  style: Theme.of(context).textTheme.headline6,
                  initialValue: tanggalTransaksi,
                  decoration: const InputDecoration(
                      labelText: "Tanggal Transaksi",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
            ],
          ),
        ),
        textCancel: "Cancel",
        textConfirm: "Okay",
        buttonColor: Colors.green,
        confirmTextColor: Colors.black,
        cancelTextColor: Colors.black,
        onConfirm: () {
          if(jumlahTransaksi != 0 && tanggalTransaksi != ""){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.updateTransaksi(transaksi.transaksiId!, Transaksi(jumlahTerjual: jumlahTransaksi,tanggalTransaksi: tanggalTransaksi));
            ConstantClass.showToast("Item Updated !",
                color: Colors.green);
            Get.back();
          }else{
            ConstantClass.showToast("Invalid Item !",
                color: Colors.green);
            Get.back();
          }
        }
    );
  }

  static void dialogDelete(BuildContext context,HomeController controller,String transaksiId) {
    Get.defaultDialog(
        title: "Delete Transaksi",
        titleStyle: const TextStyle(fontSize: 25),
        content: const Text("Are you sure to delete this item ?"),
        textCancel: "Cancel",
        textConfirm: "Okay",
        buttonColor: Colors.green,
        confirmTextColor: Colors.black,
        cancelTextColor: Colors.black,
        onConfirm: () {
          controller.deleteTransaksi(transaksiId);
          ConstantClass.showToast("Item Deleted !");
          Get.back();
        }
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('DialogviewView'),
//       centerTitle: true,
//     ),
//     body: Center(
//       child: Text(
//         'DialogviewView is working',
//         style: TextStyle(fontSize: 20),
//       ),
//     ),
//   );
// }
}
