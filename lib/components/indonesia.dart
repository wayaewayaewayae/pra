import 'package:flutter/material.dart';
import '../widgets/summary_card.dart';

class Indonesia extends StatelessWidget {
  final double height;
  final data;

  Indonesia(
      {this.height,
      this.data}); //TERIMA DATA YANG DIKIRIMKAN KETIKA COMPONENT INDONESIA DIGUNAKAN OLEH HOME.DART

  @override
  Widget build(BuildContext context) {
    //PISAHKAN LAGI MENJADI DUA BUAH KOLOM
    return Column(
      children: <Widget>[
        //BAGIAN PERTAMA ADALAH HEADINGNYA
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
          child: const Text(
            'LAPORAN JUMLAH KASUS DI INDONESIA',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Divider(),
        //Bagian masing masing data
        Expanded(
          flex: 2,
          //akan ditampilkan menggunakan Gridview
          child: GridView.count(
            childAspectRatio: height / 350, //DENGAN RASIO TINGGI LAYAR BAGI 350
            crossAxisCount: 2, //HANYA ADA DUA WIDGET DALAM SATU DERETAN
            crossAxisSpacing: 10, //INI UNTUK JARAK MASING-MASING WIDGET
            mainAxisSpacing: 10,
            children: <Widget>[
              SummaryCard(
                total: data.summary.confirmed.toString(),
                label: 'Terkominasi',
                color: Colors.yellowAccent[100],
                size: 35,
              ),
              SummaryCard(
                total: data.summary.activeCare.toString(),
                label: 'Dalam Perawatan',
                color: Colors.purple[100],
                size: 35,
              ),
              SummaryCard(
                total: data.summary.deaths.toString(),
                label: 'Meninggal',
                color: Colors.red[300],
                size: 35,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
