import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tescodingprojek/app/data/models/kolektif_model.dart';
import 'package:flutter_tescodingprojek/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_tescodingprojek/app/modules/home/views/kolektif_dialog_view.dart';
import 'package:flutter_tescodingprojek/constant.dart';
import 'package:get/get.dart';

import '../../../data/models/barang_model.dart';
import 'barang_dialog_view.dart';

class KolektifView extends GetView<HomeController> {
  final _rowPerPage = 8.obs;
  late var kolektifItem;

  KolektifView(this.kolektifItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 5),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10,left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Search By :" , style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: const BorderSide(color: Colors.blue)
                            ))
                          ),
                            onPressed: (){
                                KolektifDialogView.dialogSearchByNama(context, controller);
                            },
                            child: const Text("Nama")
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: const BorderSide(color: Colors.blue)
                                ))
                            ),
                            onPressed: (){
                                KolektifDialogView.dialogSearchByTanggal(context, controller);
                            },
                            child: const Text("Tanggal")
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: const BorderSide(color: Colors.blue)
                                ))
                            ),
                            onPressed: (){
                              KolektifDialogView.dialogSearchByTanggalAntara(context, controller);
                            },
                            child: const Text("Tanggal Antara")
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: PaginatedDataTable(
                showCheckboxColumn: false,
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      flex: 2,
                        child: Text("Kolektif")
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<dynamic>(
                              onChanged: (value) {
                                if(value.toString() == "besar"){
                                  controller.task = controller.getKolektifByUrutan("DESC");
                                }else{
                                  controller.task = controller.getKolektifByUrutan("ASC");
                                }
                              },
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
                  ],
                ),
                rowsPerPage: _rowPerPage.value,
                availableRowsPerPage: const [8, 10, 20],
                onRowsPerPageChanged: (value) {
                  _rowPerPage.value = value!;
                },
                columns: kTableColumns,
                source: KolektifDataSource(context, controller, kolektifItem),
              ),
            ),
          ],
        ));
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

const kTableColumns = <DataColumn>[
  DataColumn(
    label: Text("BarangID"),
  ),
  DataColumn(
    label: Text("Nama Barang"),
  ),
  DataColumn(
    label: Text("Jenis Barang"),
  ),
  DataColumn(
    label: Text("Stok"),
  ),
  DataColumn(
    label: Text("Jumlah Transaksi"),
  ),
  DataColumn(
    label: Text("Tanggal Transaksi"),
  ),
  DataColumn(
    label: Text("TransaksiID"),
  ),
];

class KolektifDataSource extends DataTableSource {
  int _selectedCount = 0;
  BuildContext context;
  HomeController controller;
  final List<Kolektif?> _kolektifList;

  KolektifDataSource(this.context, this.controller, this._kolektifList);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _kolektifList.length) return null;
    final Kolektif? kolektif = _kolektifList[index];
    return DataRow.byIndex(
        index: index,
        selected: kolektif!.selected,
        onSelectChanged: (value) {
          if (kolektif.selected != value) {
            _selectedCount += value! ? 1 : -1;
            kolektif.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Text(kolektif.barangId!)),
          DataCell(Text(kolektif.namaBarang!)),
          DataCell(Text(kolektif.jenisBarang!)),
          DataCell(Text(kolektif.stok.toString())),
          DataCell(Text(kolektif.jumlahTerjual.toString())),
          DataCell(Text(ConstantClass.formatDateTime(kolektif.tanggalTransaksi!))),
          DataCell(Text(kolektif.transaksiId!)),
        ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _kolektifList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;
}
