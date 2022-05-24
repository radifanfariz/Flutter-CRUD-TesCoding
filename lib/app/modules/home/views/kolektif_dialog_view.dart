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
    late var tanggalTransaksi = "".obs;
    Get.defaultDialog(
        title: "Search By Tanggal",
        titleStyle: const TextStyle(fontSize: 25),
        content: Form(
          child: Column(
            children: [
              Obx(
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
            ],
          ),
        ),
        textCancel: "Cancel",
        textConfirm: "Search",
        buttonColor: Colors.green,
        confirmTextColor: Colors.black,
        cancelTextColor: Colors.black,
        onConfirm: () {
          if(tanggalTransaksi.value != ""){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.task = controller.getKolektifByTanggal(tanggalTransaksi.value);
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
    late var daritgl = "".obs;
    late var keTgl = "".obs;
    late String sortResult = "DESC";
    Get.defaultDialog(
        title: "Search By Tanggal Antara",
        titleStyle: const TextStyle(fontSize: 25),
        content: Form(
          child: Column(
            children: [
              Obx(
                      () {
                    return TextField(
                      focusNode: AlwaysDisableFocusNode(),
                      onTap: () {
                        ConstantClass.showCupertinoSheet(
                            context, initialDateTime: DateTime.now(),
                            onDateTimeChanged: (dateTime) {
                              daritgl.value = ConstantClass.formatDateTime(dateTime.toIso8601String());
                            },
                            onClicked: (){
                              Get.back();
                            });
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: Text(daritgl.value,style: const TextStyle(fontWeight: FontWeight.bold),),
                          border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          )
                      ),
                    );
                  }
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Obx(() {
                  return TextField(
                    focusNode: AlwaysDisableFocusNode(),
                    onTap: () {
                      ConstantClass.showCupertinoSheet(context,
                          initialDateTime: DateTime.now(),
                          onDateTimeChanged: (dateTime) {
                        keTgl.value = ConstantClass.formatDateTime(
                            dateTime.toIso8601String());
                      }, onClicked: () {
                        Get.back();
                      });
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        label: Text(
                          keTgl.value,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  );
                }),
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
          if(daritgl.value != "" && keTgl.value != ""){
            // log("Test Text : ${namaBarang} ${jenisBarang}");
            controller.task = controller.getKolektifByTanggalAntara(daritgl.value, keTgl.value, sortResult);
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

class AlwaysDisableFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}