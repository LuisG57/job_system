import 'package:flutter/material.dart';
import 'package:jos_search_app/View/Screens/job_detail_screen.dart';
import 'package:jos_search_app/providers/puesto.dart';
import 'package:provider/provider.dart';

import 'custom_paginated_data_table.dart' as pdt;

class TableItem extends StatefulWidget {
  const TableItem({required this.rowsperpage, required this.category, Key? key})
      : super(key: key);
  final int rowsperpage;
  final String category;
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
      return 330;

      // if (MediaQuery.of(context).size.width * 0.22 < 175) {
      //   return MediaQuery.of(context).size.width * 0.16;
      // } else if (MediaQuery.of(context).size.width * 0.22 < 250) {
      //   return MediaQuery.of(context).size.width * 0.22;
      // } else if (MediaQuery.of(context).size.width * 0.22 < 275) {
      //   return MediaQuery.of(context).size.width * 0.235;
      // } else if (MediaQuery.of(context).size.width * 0.22 < 300) {
      //   return MediaQuery.of(context).size.width * 0.25;
      // } else if (MediaQuery.of(context).size.width * 0.22 < 330) {
      //   return MediaQuery.of(context).size.width * 0.255;
      // } else if (MediaQuery.of(context).size.width * 0.22 < 375) {
      //   return MediaQuery.of(context).size.width * 0.26;
      // } else if (MediaQuery.of(context).size.width * 0.22 < 500) {
      //   return MediaQuery.of(context).size.width * 0.265;
      // } else {
      //   return MediaQuery.of(context).size.width * 0.28;
      // }
    }

    //Obtain the data to be displayed from the Derived DataTableSource
    final provedor = Provider.of<Puesto>(context, listen: true);

    var dts =
        DTS(category: widget.category, provedor: provedor, context: context);
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
            DataColumn(label: Text('Ubicación')),
            DataColumn(label: Text('Posición')),
            DataColumn(label: Text('Compañía')),
            DataColumn(label: Text('Tipo Jornada')),
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
  final String category;
  final Puesto provedor;
  final BuildContext context;
  DTS({required this.category, required this.provedor, required this.context}) {
    lista = provedor.getAllPosts();
    lista.removeWhere((element) {
      print(element.categoria);
      print(element.categoria.toString().trim().toUpperCase() !=
          category.toString().trim().toUpperCase());
      print(category);
      print(element.categoria);
      return element.categoria.toString().trim().toUpperCase() !=
          category.toString().trim().toUpperCase();
    });
    print('print = ${lista.length}');
  }
  late List<PuestoItem> lista;
  @override
  DataRow? getRow(int index) {
    print(lista.first.compania);
    return DataRow.byIndex(
        index: index,
        cells: [
          DataCell(Text('${lista[index].ubicacion}')),
          DataCell(Text('${lista[index].posicion}')),
          DataCell(Text('${lista[index].compania}')),
          DataCell(Text('${lista[index].tipoJornada}')),
        ],
        onSelectChanged: (selected) {
          print(index);
          Navigator.pushNamed(context, JobDetailScreen.routeName,
              arguments: lista[index].idPuesto);
        });
  }

  Future<int> getRC() async {
    await lista.length;
    throw lista.length;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => lista.length;

  @override
  int get selectedRowCount => 0;
}
