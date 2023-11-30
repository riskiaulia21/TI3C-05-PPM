import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Halaman Report'),
        ),
        body: Center(
          child: DataTable(
            columns: [
              DataColumn(label: Text('id_transaksi')),
              DataColumn(label: Text('Nama')),
              DataColumn(label: Text('No Pol')),
              DataColumn(label: Text('Tanggal Penyewaan')),
              DataColumn(label: Text('No Hp')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('01')),
                DataCell(Text('Furqan')),
                DataCell(Text('BL 2132 NY')),
                DataCell(Text('18 Desember 2023')),
                DataCell(Text('082238584400')),
              ]),
              DataRow(cells: [
                DataCell(Text('02')),
                DataCell(Text('Furqan')),
                DataCell(Text('jsnsjsnjs')),
                DataCell(Text('San Francisco')),
                DataCell(Text('San Francisco')),
              ]),
              DataRow(cells: [
                DataCell(Text('Bob')),
                DataCell(Text('28')),
                DataCell(Text('Chicago')),
                DataCell(Text('Chicago')),
                DataCell(Text('Chicago')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
