import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tescodingprojek/app/data/models/barang_detail_model.dart';
import 'package:flutter_tescodingprojek/app/data/models/barang_model.dart';
import 'package:flutter_tescodingprojek/app/data/models/transaksi_model.dart';
import 'package:flutter_tescodingprojek/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

import '../../../../constant.dart';

class BarangDetailDialogView {

  static void dialogInsert(BuildContext context,HomeController controller){
    late String barangId = "";
    late String transaksiId = "";
    late int stok = 0;
    Get.defaultDialog(
        title: "Insert Barang Detail",
        titleStyle: const TextStyle(fontSize: 25),
        content: Form(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value){
                  barangId = value.toString();
                  // log("Test Text : ${namaBarang}");
                },
                style: Theme.of(context).textTheme.headline6,
                decoration: const InputDecoration(
                    labelText: "Barang ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  onChanged: (value){
                    transaksiId = value.toString();
                  },
                  style: Theme.of(context).textTheme.headline6,
                  decoration: const InputDecoration(
                      labelText: "Transaksi ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  onChanged: (value){
                    stok = int.parse(value);
                  },
                  style: Theme.of(context).textTheme.headline6,
                  decoration: const InputDecoration(
                      labelText: "Stok",
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
          if(barangId != "" && transaksiId != "" && stok != 0){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.insertBarangDetail(barangId,transaksiId,BarangDetail(stok: stok));
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

  static void dialogUpdate(BuildContext context,HomeController controller,BarangDetail barangDetail){
    late String barangId = barangDetail.barangId!;
    late String transaksiId = barangDetail.transaksiId!;
    late int stok = barangDetail.stok!;

    Get.defaultDialog(
        title: "Update Barang Detail",
        titleStyle: const TextStyle(fontSize: 25),
        content: Form(
          child: Column(
            children: [
              TextFormField(
                enabled: false,
                onChanged: (value){
                  barangId = value.toString();
                  // log("Test Text : ${namaBarang}");
                },
                style: Theme.of(context).textTheme.headline6,
                initialValue: barangId.toString(),
                decoration: const InputDecoration(
                    labelText: "Barang ID",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  enabled: false,
                  onChanged: (value){
                    transaksiId = value.toString();
                  },
                  style: Theme.of(context).textTheme.headline6,
                  initialValue: transaksiId,
                  decoration: const InputDecoration(
                      labelText: "Transaksi ID",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  onChanged: (value){
                    stok = int.parse(value);
                  },
                  style: Theme.of(context).textTheme.headline6,
                  initialValue: stok.toString(),
                  decoration: const InputDecoration(
                      labelText: "Stok",
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
          if(barangId != "" && transaksiId != "" && stok != 0){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.updateBarangDetail(barangId,transaksiId,BarangDetail(stok: stok));
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

  static void dialogDelete(BuildContext context,HomeController controller,String barangId,String transaksiId) {
    Get.defaultDialog(
        title: "Delete Barang Detail",
        titleStyle: const TextStyle(fontSize: 25),
        content: const Text("Are you sure to delete this item ?"),
        textCancel: "Cancel",
        textConfirm: "Okay",
        buttonColor: Colors.green,
        confirmTextColor: Colors.black,
        cancelTextColor: Colors.black,
        onConfirm: () {
          controller.deleteBarangDetail(barangId,transaksiId);
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
