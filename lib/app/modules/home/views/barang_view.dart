import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tescodingprojek/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';

import '../../../data/models/barang_model.dart';
import 'barang_dialog_view.dart';

class BarangView extends GetView<HomeController> {
  final _rowPerPage = 8.obs;
  late var barangItem;

  BarangView(this.barangItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: PaginatedDataTable(
      showCheckboxColumn: false,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Barang"),
          GestureDetector(
            child: const Icon(
              Icons.add_circle_outline_rounded,
              size: 35,
            ),
            onTap: () {
              BarangDialogView.dialogInsert(context, controller);
            },
          ),
        ],
      ),
      rowsPerPage: _rowPerPage.value,
      availableRowsPerPage: const [8, 10, 20],
      onRowsPerPageChanged: (value) {
        _rowPerPage.value = value!;
      },
      columns: kTableColumns,
      source: BarangDataSource(context, controller, barangItem),
    ));
  }
}

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
    label: Text("Action"),
  ),
];

class BarangDataSource extends DataTableSource {
  int _selectedCount = 0;
  BuildContext context;
  HomeController controller;
  final List<Barang?> _barangList;

  BarangDataSource(this.context, this.controller, this._barangList);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _barangList.length) return null;
    final Barang? barang = _barangList[index];
    return DataRow.byIndex(
        index: index,
        selected: barang!.selected,
        onSelectChanged: (value) {
          if (barang.selected != value) {
            _selectedCount += value! ? 1 : -1;
            barang.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Text(barang.barangId!)),
          DataCell(Text(barang.namaBarang!)),
          DataCell(Text(barang.jenisBarang!)),
          DataCell(Row(
            children: [
              GestureDetector(
                child: const Icon(Icons.edit),
                onTap: () {
                  BarangDialogView.dialogUpdate(context, controller, barang);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: const Icon(Icons.delete),
                onTap: () {
                  BarangDialogView.dialogDelete(
                      context, controller, barang.barangId!);
                },
              )
            ],
          )),
        ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => _barangList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;
}
