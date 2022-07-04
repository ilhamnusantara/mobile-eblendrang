// import 'dart:js';
import 'dart:convert';
import 'dart:math';

import 'package:app_eblendrang/models/dokumen_model.dart';
import 'package:app_eblendrang/models/user_model.dart';
import 'package:app_eblendrang/pages/detail_dokumen.dart';
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
  // final List<DokumenModel> dokumens;
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
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget header(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: marginLogin,
          right: marginLogin,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ${user.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@${user.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(
                  context,
                  '/edit-profile',
                );
              },
              child: Container (
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/icon_email.png'),),
                ),
              ),
            ),
          ],
        ),
      );
    }
    Widget titlePage(){
      return Container(
        margin : EdgeInsets.only(
          top: 50,
          left: marginLogin,
          right: marginLogin,
          bottom: 14,
        ),
        child: Text(
          'Informasi Instansi belum upload file',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      );
    }
    Widget item(){
      return Container(
        margin: EdgeInsets.only(
          top :14,
          left: marginLogin,
          right: marginLogin,
        ),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _get.length,
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: () {
                  // Navigator.pushNamed(
                  //     context, '/detailDokumen'
                  // );
                  print(_get[index]);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> DetailPage(dokumen : _get[index])),
                  );
                },
                child: new Card(
                  // margin: EdgeInsets.symmetric(
                  //   vertical: 20,
                  //   horizontal: 12,
                  // ),
                  // child: new Text(
                  //     'id Doc = ${_get[index]['id_dokumen']}'
                  // ),
                  elevation: 12,
                  color: backgroundColor13,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  // child: Padding(
                  //   padding: EdgeInsets.all(35.0),
                  //
                  // ),
                  // child : SizedBox(
                  //   width: 300,
                  //   height: 80,
                  // ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icon_goverment.png',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${_get[index]['keterangan_belanja']}',
                              style: primaryTextStyle.copyWith(
                                fontWeight: semiBold,
                              ),
                            ),
                            Text(
                              '${_get[index]['instansi']['nama_instansi']}',
                              style: subtitleTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '3 Item',
                        style: inputStyle.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),

      );
    }
    return ListView(
      children: [
        header(),
        // categories(),
        // popularProductsTitle(),
        // popularProducts(),
        titlePage(),
        item(),
      ],
    );
  }
}