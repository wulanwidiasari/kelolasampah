import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:kelolasampah/Screens/tambah_kategori.dart';
import 'package:kelolasampah/constants.dart';

class Kategori extends StatefulWidget {
  const Kategori({Key? key}) : super(key: key);

  @override
  _KategoriState createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  List data = ['Coba', 'Coba', 'Coba', 'Coba'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              ),
              onPressed: () => Navigator.of(context).pop()),
          title: Text("List Kategori"),
          elevation: 0,
          backgroundColor: kPrimaryColor),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: GridView.builder(
            itemCount: data.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (MediaQuery.of(context).orientation == Orientation.portrait)
                        ? 2
                        : 3),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Center(
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              color: Colors.white,
                            ),
                            child: Center(child: Text('Coba')),
                          ),
                        );
                      },
                    );
                  },
                  child: new Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: new GridTile(
                      // footer: new Text(data[index].toString()),
                      child: new Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Container(
                              width: MediaQuery.of(context).size.longestSide,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  data[index].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ), //just for testing, will fill with image later
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          height: 20,
          color: kPrimaryColor,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    color: Colors.black26,
                    offset: Offset(0, 1),
                    spreadRadius: 1)
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                  style: TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        size: 14,
                      ),
                      hintText: 'Masukkan pencarian',
                      focusedBorder: InputBorder.none)),
            ),
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TambahKategori(),
              ));
        },
        elevation: 0,
        child: Icon(Icons.addchart_sharp),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
