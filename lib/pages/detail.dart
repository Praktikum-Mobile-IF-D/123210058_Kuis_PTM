import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ifd_kuis_nanang/data/data_buku.dart';

class DetailPage extends StatefulWidget {
  final DataBuku buku;

  DetailPage({required this.buku});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Buku'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  _launchURL(widget.buku.link);
                },
                child: Image.network(
                  widget.buku.imageLink,
                  height: 480,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Judul: ${widget.buku.title}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Penulis: ${widget.buku.author}'),
            Text('Bahasa: ${widget.buku.language}'),
            Text('Negara: ${widget.buku.country}'),
            Text('Jumlah Halaman: ${widget.buku.pages}'),
            Text('Tahun Terbit: ${widget.buku.year}'),
            SizedBox(height: 20),
            _isAvailable
                ? ElevatedButton(
              onPressed: () {
                setState(() {
                  _isAvailable = false;
                });
                _showSnackBar(context, 'Berhasil meminjam buku');
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                'Pinjam',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
                : ElevatedButton(
              onPressed: null,
              child: Text('Tidak Tersedia'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                backgroundColor: MaterialStateProperty.all(Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {   //url launcer
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
