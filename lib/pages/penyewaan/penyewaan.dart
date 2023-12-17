import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Rental Mobil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _kodeMobil = "";
  String _tanggalSewa = "";
  String _lamaSewa = "";
  String _namaPeminjam = "";
  String _nikPeminjam = "";
  String _noHpPeminjam = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Rental Mobil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Kode Mobil',
              ),
              onChanged: (value) {
                _kodeMobil = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Tanggal Sewa',
              ),
              onChanged: (value) {
                _tanggalSewa = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Lama Sewa',
              ),
              onChanged: (value) {
                _lamaSewa = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nama Peminjam',
              ),
              onChanged: (value) {
                _namaPeminjam = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'NIK Peminjam',
              ),
              onChanged: (value) {
                _nikPeminjam = value;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nomor HP Peminjam',
              ),
              onChanged: (value) {
                _noHpPeminjam = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Button(
              onPressed: () {
                // TODO: Kirim data ke API
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
