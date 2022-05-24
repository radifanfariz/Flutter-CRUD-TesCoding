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
    late var tanggalTransaksi = "".obs;
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
                child: Obx(
                  () {
                    return TextField(
                      focusNode: AlwaysDisableFocusNode(),
                      onTap: () {
                        ConstantClass.showCupertinoSheet(
                            context, initialDateTime: DateTime.now(),
                            onDateTimeChanged: (dateTime) {
                              tanggalTransaksi.value = ConstantClass.formatDateTime(dateTime.toIso8601String());
                            },
                            onClicked: (){
                                Get.back();
                            });
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: Text(tanggalTransaksi.value,style: const TextStyle(fontWeight: FontWeight.bold),),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          )
                      ),
                    );
                  }
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
          if(jumlahBarang != 0 && tanggalTransaksi.value != ""){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.insertTransaksi(Transaksi(jumlahTerjual: jumlahBarang,tanggalTransaksi: tanggalTransaksi.value));
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
    late var tanggalTransaksi = ConstantClass.formatDateTime(transaksi.tanggalTransaksi!).obs;

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
                child: Obx(
                        () {
                      return TextField(
                        focusNode: AlwaysDisableFocusNode(),
                        onTap: () {
                          ConstantClass.showCupertinoSheet(
                              context, initialDateTime: DateTime.parse(tanggalTransaksi.value),
                              onDateTimeChanged: (dateTime) {
                                tanggalTransaksi.value = ConstantClass.formatDateTime(dateTime.toIso8601String());
                              },
                              onClicked: (){
                                Get.back();
                              });
                        },
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            label: Text(tanggalTransaksi.value,style: const TextStyle(fontWeight: FontWeight.bold),),
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            )
                        ),
                      );
                    }
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
          if(jumlahTransaksi != 0 && tanggalTransaksi.value != ""){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.updateTransaksi(transaksi.transaksiId!, Transaksi(jumlahTerjual: jumlahTransaksi,tanggalTransaksi: tanggalTransaksi.value));
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

class AlwaysDisableFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
