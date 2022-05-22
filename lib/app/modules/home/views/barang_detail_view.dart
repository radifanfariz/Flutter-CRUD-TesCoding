import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tescodingprojek/app/data/models/barang_detail_model.dart';
import 'package:flutter_tescodingprojek/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_tescodingprojek/app/modules/home/views/barang_detail_dialog_view.dart';
import 'package:get/get.dart';

class BarangDetailView extends GetView<HomeController> {
  final _rowPerPage = 8.obs;
  late var barangDetailItem;

  BarangDetailView(this.barangDetailItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SingleChildScrollView(
        child: PaginatedDataTable(
          showCheckboxColumn: false,
      header: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Barang Detail"),
          GestureDetector(
            child: const Icon(
              Icons.add_circle_outline_rounded,
              size: 35,
            ),
            onTap: () {
              BarangDetailDialogView.dialogInsert(context, controller);
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
      source: BarangDetailDataSource(context, controller, barangDetailItem),
    ));
  }
}

const kTableColumns = <DataColumn>[
  DataColumn(
    label: Text("BarangID"),
  ),
  DataColumn(
    label: Text("TransaksiID"),
  ),
  DataColumn(
    label: Text("Stok"),
  ),
  DataColumn(
    label: Text("Action"),
  ),
];

class BarangDetailDataSource extends DataTableSource {
  int _selectedCount = 0;
  BuildContext context;
  HomeController controller;
  final List<BarangDetail?> _barangDetail;

  BarangDetailDataSource(this.context, this.controller, this._barangDetail);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _barangDetail.length) return null;
    final BarangDetail? barangDetail = _barangDetail[index];
    return DataRow.byIndex(
        index: index,
        selected: barangDetail!.selected,
        onSelectChanged: (value) {
          if (barangDetail.selected != value) {
            _selectedCount += value! ? 1 : -1;
            barangDetail.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Text(barangDetail.barangId!)),
          DataCell(Text(barangDetail.transaksiId!)),
          DataCell(Text(barangDetail.stok.toString())),
          DataCell(Row(
            children: [
              GestureDetector(
                child: const Icon(Icons.edit),
                onTap: () {
                  BarangDetailDialogView.dialogUpdate(
                      context, controller, barangDetail);
                },
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: const Icon(Icons.delete),
                onTap: () {
                  BarangDetailDialogView.dialogDelete(context, controller,
                      barangDetail.barangId!, barangDetail.transaksiId!);
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
  int get rowCount => _barangDetail.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;
}
