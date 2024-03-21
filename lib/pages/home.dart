import 'package:flutter/material.dart';
import 'package:ifd_kuis_nanang/data/data_buku.dart';
import 'package:ifd_kuis_nanang/pages/detail.dart';
import 'package:ifd_kuis_nanang/pages/login.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Buku'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(
              builder: (context) => LoginPage(),
              ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(buku: listBuku[index]),
                ),
              );
            },
            child: Card(
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      child: Image.network(
                        listBuku[index].imageLink,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            listBuku[index].title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,
                            ),
                          ),
                          Text(
                            '${listBuku[index].author} - ${listBuku[index].pages} halaman',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
