import 'package:flutter/material.dart';

import 'custom_paginated_data_table.dart' as pdt;

class TableItem extends StatefulWidget {
  const TableItem({required this.rowsperpage, Key? key}) : super(key: key);
  final int rowsperpage;
  @override
  _TableItemState createState() => _TableItemState();
}

class _TableItemState extends State<TableItem> {
  var _rowsPerPage1 = 1;
  @override
  void initState() {
    _rowsPerPage1 = widget.rowsperpage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double getWidth() {
      // print(MediaQuery.of(context).size.width * 0.22);
      if (MediaQuery.of(context).size.width * 0.22 < 175) {
        return MediaQuery.of(context).size.width * 0.16;
      } else if (MediaQuery.of(context).size.width * 0.22 < 250) {
        return MediaQuery.of(context).size.width * 0.22;
      } else if (MediaQuery.of(context).size.width * 0.22 < 275) {
        return MediaQuery.of(context).size.width * 0.235;
      } else if (MediaQuery.of(context).size.width * 0.22 < 300) {
        return MediaQuery.of(context).size.width * 0.25;
      } else if (MediaQuery.of(context).size.width * 0.22 < 330) {
        return MediaQuery.of(context).size.width * 0.255;
      } else if (MediaQuery.of(context).size.width * 0.22 < 375) {
        return MediaQuery.of(context).size.width * 0.26;
      } else if (MediaQuery.of(context).size.width * 0.22 < 500) {
        return MediaQuery.of(context).size.width * 0.265;
      } else {
        return MediaQuery.of(context).size.width * 0.28;
      }
    }

    //Obtain the data to be displayed from the Derived DataTableSource
    var dts = DTS();
    // dts.rowcount provides the actual data length, ForInstance, If we have 7 data stored in the DataTableSource Object, then we will get 12 as dts.rowCount
    var tableItemsCount = dts.rowCount;
    // PaginatedDataTable.defaultRowsPerPage provides value as 10
    var defaultRowsPerPage = PaginatedDataTable.defaultRowsPerPage;
    // We are checking whether tablesItemCount is less than the defaultRowsPerPage which means we are actually checking the length of the data in DataTableSource with default PaginatedDataTable.defaultRowsPerPage i.e, 10
    var isRowCountLessDefaultRowsPerPage = tableItemsCount < defaultRowsPerPage;
    // Assigning rowsPerPage as 10 or acutal length of our data in stored in the DataTableSource Object

    return SafeArea(
      child: SingleChildScrollView(
        child: pdt.PaginatedDataTable(
          //header: Text('Data Table Header'),
          columns: const [
            DataColumn(label: Text('col#1')),
            DataColumn(label: Text('col#2')),
            DataColumn(label: Text('col#3')),
            DataColumn(label: Text('col#4')),
          ],
          source: dts,
          // comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage and then assigning it to _rowPerPage1 variable which then set using the setsState()
          onRowsPerPageChanged:
              isRowCountLessDefaultRowsPerPage // The source of problem!
                  ? null
                  : (rowCount) {
                      setState(() {
                        _rowsPerPage1 = rowCount as int;
                      });
                    },
          //Set Value for rowsPerPage based on comparing the actual data length with the PaginatedDataTable.defaultRowsPerPage
          rowsPerPage: isRowCountLessDefaultRowsPerPage ? 1 : _rowsPerPage1,
          columnSpacing: getWidth(),
        ),
      ),
    );
  }
}

class DTS extends DataTableSource {
  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('#cel1-$index')),
      DataCell(Text('#cel2-$index')),
      DataCell(Text('#cel3-$index')),
      DataCell(Text('#cel4-$index')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
