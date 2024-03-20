import 'package:flutter/material.dart';
import 'package:ifd_kuis_nanang/data/data_buku.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DataBuku place = ModalRoute.of(context)!.settings.arguments as DataBuku;

    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 200,
                backgroundImage: NetworkImage(place.imageLink),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Penulis: ${place.author}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Bahasa: ${place.language}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Jumlah halaman: ${place.pages}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Tahun Terbit: ${place.year} cm',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Status: ${place.isAvailable}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/pilih');
              },
              child: Text('pilih'),
            ),
          ],
        ),
      ),
    );
  }
}

