import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tescodingprojek/app/data/models/barang_model.dart';
import 'package:flutter_tescodingprojek/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

import '../../../../constant.dart';

class BarangDialogView {

  static void dialogInsert(BuildContext context,HomeController controller){
    late String namaBarang = "";
    late String jenisBarang = "";
    Get.defaultDialog(
        title: "Insert Barang",
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
                validator: (value){
                  if(value == ""){
                    ConstantClass.showToast("Invalid Item !");
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  onChanged: (value){
                    jenisBarang = value.toString();
                  },
                  style: Theme.of(context).textTheme.headline6,
                  decoration: const InputDecoration(
                      labelText: "Jenis Barang",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                  validator: (value){
                    if(value == ""){
                      ConstantClass.showToast("Invalid Item !");
                    }
                  },
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
          if(namaBarang != "" && jenisBarang != ""){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.insertBarang(Barang(namaBarang: namaBarang,jenisBarang: jenisBarang));
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

  static void dialogUpdate(BuildContext context,HomeController controller,Barang barang){
    late String namaBarang = barang.namaBarang!;
    late String jenisBarang = barang.jenisBarang!;
    Get.defaultDialog(
        title: "Update Barang",
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
                initialValue: barang.namaBarang,
                decoration: const InputDecoration(
                    labelText: "Nama Barang",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
                validator: (value){
                  if(value == ""){
                    ConstantClass.showToast("Invalid Item !");
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: TextFormField(
                  onChanged: (value){
                    jenisBarang = value.toString();
                  },
                  style: Theme.of(context).textTheme.headline6,
                  initialValue: barang.jenisBarang,
                  decoration: const InputDecoration(
                      labelText: "Jenis Barang",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )),
                  validator: (value){
                    if(value == ""){
                      ConstantClass.showToast("Invalid Item !");
                    }
                  },
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
          if(namaBarang != "" && jenisBarang != ""){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.updateBarang(barang.barangId!, Barang(namaBarang: namaBarang,jenisBarang: jenisBarang));
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

  static void dialogDelete(BuildContext context,HomeController controller,String barangId) {
    Get.defaultDialog(
        title: "Delete Barang",
        titleStyle: const TextStyle(fontSize: 25),
        content: const Text("Are you sure to delete this item ?"),
        textCancel: "Cancel",
        textConfirm: "Okay",
        buttonColor: Colors.green,
        confirmTextColor: Colors.black,
        cancelTextColor: Colors.black,
        onConfirm: () {
            controller.deleteBarang(barangId);
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
