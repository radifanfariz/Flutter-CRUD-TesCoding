import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tescodingprojek/app/data/models/transaksi_model.dart';
import 'package:flutter_tescodingprojek/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_tescodingprojek/app/modules/home/views/transaksi_dialog_view.dart';
import 'package:flutter_tescodingprojek/constant.dart';
import 'package:get/get.dart';

import '../../../data/models/barang_model.dart';
import 'barang_dialog_view.dart';

class TransaksiView extends GetView<HomeController> {
  final _rowPerPage = 8.obs;
  late var transaksiItem;

  TransaksiView(this.transaksiItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: PaginatedDataTable(
          showCheckboxColumn: false,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Transaksi"),
          GestureDetector(
            child: const Icon(
              Icons.add_circle_outline_rounded,
              size: 35,
            ),
            onTap: () {
              TransaksiDialogView.dialogInsert(context, controller);
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
      source: TransaksiDataSource(context, controller, transaksiItem),
    ));
  }
}

const kTableColumns = <DataColumn>[
  DataColumn(
    label: Text("TransaksiID"),
  ),
  DataColumn(
    label: Text("Jumlah Terjual"),
  ),
  DataColumn(
    label: Text("Tanggal Terjual"),
  ),
  DataColumn(
    label: Text("Action"),
  ),
];

class TransaksiDataSource extends DataTableSource {
  int _selectedCount = 0;
  BuildContext context;
  HomeController controller;
  final List<Transaksi?> _transaksiList;

  TransaksiDataSource(this.context, this.controller, this._transaksiList);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _transaksiList.length) return null;
    final Transaksi? transaksi = _transaksiList[index];
    return DataRow.byIndex(
        index: index,
        selected: transaksi!.selected,
        onSelectChanged: (value) {
          if (transaksi.selected != value) {
            _selectedCount += value! ? 1 : -1;
            transaksi.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Text(transaksi.transaksiId!)),
          DataCell(Text(transaksi.jumlahTerjual.toString())),
          DataCell(Text(ConstantClass.formatDateTime(transaksi.tanggalTransaksi!))),
          DataCell(Row(
            children: [
              GestureDetector(
                child: const Icon(Icons.edit),
                onTap: () {
                  TransaksiDialogView.dialogUpdate(
                      context, controller, transaksi);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: const Icon(Icons.delete),
                onTap: () {
                  TransaksiDialogView.dialogDelete(
                      context, controller, transaksi.transaksiId!);
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
  int get rowCount => _transaksiList.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;
}
