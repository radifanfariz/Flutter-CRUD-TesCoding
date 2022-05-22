import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tescodingprojek/app/data/models/barang_detail_model.dart';
import 'package:flutter_tescodingprojek/app/data/models/kolektif_model.dart';
import 'package:flutter_tescodingprojek/app/data/models/transaksi_model.dart';
import 'package:flutter_tescodingprojek/app/modules/home/views/barang_detail_view.dart';
import 'package:flutter_tescodingprojek/app/modules/home/views/barang_view.dart';
import 'package:flutter_tescodingprojek/app/modules/home/views/barang_dialog_view.dart';
import 'package:flutter_tescodingprojek/app/modules/home/views/kolektif_view.dart';
import 'package:flutter_tescodingprojek/app/modules/home/views/transaksi_view.dart';
import 'package:flutter_tescodingprojek/constant.dart';

import 'package:get/get.dart';

import '../../../data/models/barang_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CRUD'),
          centerTitle: true,
        ),
        body: Obx(() {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField<dynamic>(
                    onChanged: (value) {
                      switch (value) {
                        case "barang":
                          {
                            controller.task = controller.getBarang();
                            controller.currentMenuItemTable(value);
                          }
                          break;
                        case "transaksi":
                          {
                            controller.task = controller.getTransaksi();
                            controller.currentMenuItemTable(value);
                          }
                          break;
                        case "barang_detail":
                          {
                            controller.task = controller.getBarangDetail();
                            controller.currentMenuItemTable(value);
                          }
                          break;
                        case "kolektif":
                          {
                            controller.task = controller.getKolektif();
                            controller.currentMenuItemTable(value);
                          }
                          break;
                        default:
                          {
                            controller.task = controller.getBarang();
                            controller.currentMenuItemTable(value);
                          }
                      }
                    },
                    value: "barang",
                    style: Theme.of(context).textTheme.headline6,
                    decoration: const InputDecoration(
                        labelText: "Pilih Tabel",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        )),
                    items: tableMenuItem,
                  ),
                ),
                (controller.currentMenuItemTable.value == "barang")
                    ? FutureBuilder<dynamic>(
                        future: controller.task,
                        builder: (context, snapshot) {
                          if (snapshot.hasData &&
                              !snapshot.hasError &&
                              snapshot.data is List<Barang?>) {
                            return BarangView(snapshot.data);
                          } else {
                            return const Center(
                              child: Text("Something went wrong...!!!"),
                            );
                          }
                        })
                    : (controller.currentMenuItemTable.value == "transaksi")
                        ? FutureBuilder<dynamic>(
                            future: controller.task,
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  !snapshot.hasError &&
                                  snapshot.data is List<Transaksi?>) {
                                return TransaksiView(snapshot.data);
                              } else {
                                return const Center(
                                  child: Text("Something went wrong...!!!"),
                                );
                              }
                            })
                        : (controller.currentMenuItemTable.value ==
                                "barang_detail")
                            ? FutureBuilder<dynamic>(
                                future: controller.task,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      !snapshot.hasError &&
                                      snapshot.data is List<BarangDetail?>) {
                                    return BarangDetailView(snapshot.data);
                                  } else {
                                    return const Center(
                                      child: Text("Something went wrong...!!!"),
                                    );
                                  }
                                })
                            : (controller.currentMenuItemTable.value ==
                                    "kolektif")
                                ? FutureBuilder<dynamic>(
                                    future: controller.task,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          !snapshot.hasError &&
                                          snapshot.data
                                              is List<Kolektif?>) {
                                        return KolektifView(snapshot.data);
                                      } else {
                                        return const Center(
                                          child: Text("Something went wrong...!!!"),
                                        );
                                      }
                                    })
                                : const CircularProgressIndicator(),
              ],
            ),
          );
        }));
  }
}

const tableMenuItem = <DropdownMenuItem>[
  DropdownMenuItem(
    value: "barang",
    child: Text("Tabel Barang"),
  ),
  DropdownMenuItem(
    value: "transaksi",
    child: Text("Tabel Transaksi"),
  ),
  DropdownMenuItem(
    value: "barang_detail",
    child: Text("Tabel Barang Detail"),
  ),
  DropdownMenuItem(
    value: "kolektif",
    child: Text("Tabel Kolektif"),
  )
];
