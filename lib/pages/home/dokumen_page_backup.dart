// import 'dart:js';
import 'dart:convert';
import 'dart:math';

import 'package:app_eblendrang/models/dokumen_model_backup2.dart';
import 'package:app_eblendrang/models/user_model.dart';
import 'package:app_eblendrang/pages/widgets/dokumen_title.dart';
import 'package:app_eblendrang/providers/dokumen_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_eblendrang/themes.dart';
import 'package:app_eblendrang/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class DokumenPage extends StatefulWidget{
  DokumenPage({Key key}) : super(key: key);
  @override
  State<DokumenPage> createState()=> _DokumenPageState();
}

class _DokumenPageState extends State<DokumenPage>{
  // bool fileSpk = false;
  // bool fileBast = false;
  // bool foto = false;
  List _get = [];

  final _lightColors = [
    backgroundColor16,
    backgroundColor13,
    backgroundColor12,
    Colors.pinkAccent.shade100,
  ];

  @override
  void initState(){
    super.initState();
    _getData();
  }
  Future _getData() async {
    try{
      final response = await http.get(Uri.parse(
        // "http://172.20.10.5/flutter/list.php"
          "http://e-blendrang.id/api/dokumens"
      ));
      if (response.statusCode == 200){
        final data = jsonDecode(response.body)['data'];
        setState(() {
          _get = data;
          print(data);
        });
      }
    } catch (e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:
      Colors.orange.shade200,
      body: _get.length != 0
      //we use masonry grid to make masonry card style
          ? MasonryGridView.count(
        crossAxisCount: 2,
        itemCount: _get.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            // onTap: () {
            //   Navigator.push(
            //       context,
            //       //routing into edit page
            //       //we pass the id note
            //       MaterialPageRoute(builder: (context) => Edit(id: _get[index]['id'],)));
            // },
            child: Card(
              //make random color to eveery card
              color: _lightColors[index % _lightColors.length],
              child: Container(
                //make 2 different height
                constraints:
                BoxConstraints(minHeight: 15),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'id Doc = ${_get[index]['id_dokumen']}',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'keterangan Belanja = ${_get[index]['keterangan_belanja']}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'update at = ${_get[index]['updated_at']}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'instansi = ${_get[index]['instansi']['nama_instansi']}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
          : Center(
        child: Text(
          "No Data Available",
          style: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: primaryColor,
      //   child: Icon(Icons.arrow_back),
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         //routing into home page
      //         MaterialPageRoute(builder: (context) => HomePage()));
      //   },
      // ),
    );
  }
}