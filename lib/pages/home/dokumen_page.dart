// import 'dart:js';
import 'dart:convert';
import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:app_eblendrang/models/dokumen_model.dart';
import 'package:app_eblendrang/models/models.dart';
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

class DokumenPage extends StatefulWidget {
  @override
  State<DokumenPage> createState() => _DokumenPageState();
}

class _DokumenPageState extends State<DokumenPage> {
  // bool fileSpk = false;
  // bool fileBast = false;
  // bool foto = false;
  // final List<DokumenModel> dokumens;

  List<DokumenModel> allDokumens = [];
  List<DokumenModel> filteredDokumens = [];
  Future<void> _getData() async {
    try {
      final response =
          await http.get(Uri.parse("http://103.23.198.126/api/dokumens"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'] as List<dynamic>;
        setState(() {
          allDokumens = [];
          allDokumens = data.map((e) => DokumenModel.fromJson(e)).toList();
          // _get = data;
          print(data);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _runFilter(String text) {
    filteredDokumens.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    allDokumens.forEach((data) {
      if (data.keterangan_belanja
          .toString()
          .toLowerCase()
          .contains(text.toLowerCase().toString())) {
        filteredDokumens.add(data);
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user;

    Widget header() {
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
                    'Hallo, ${user.user.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@${user.user.username}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/edit-profile',
                );
              },
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/icon_email.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget titlePage() {
      return Container(
        margin: EdgeInsets.only(
          top: 50,
          left: marginLogin,
          right: marginLogin,
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

    Widget search() {
      return Container(
        margin: EdgeInsets.only(
          top: 8,
          left: marginLogin,
          right: marginLogin,
        ),
        child: TextField(
          onChanged: _runFilter,
          decoration: const InputDecoration(
              labelText: 'Search Pekerjaan', suffixIcon: Icon(Icons.search)),
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: TextButton(
          onPressed: () {
            filtered(context);
          },
          // (){Navigator.pushNamed(context, '/home');},
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'FILTER',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    Widget item() {
      return Container(
          margin: EdgeInsets.only(
            top: 10,
            left: marginLogin,
            right: marginLogin,
          ),
          child: filteredDokumens.length == 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: allDokumens.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/detailDokumen',
                            arguments: jsonEncode(allDokumens[index]));
                      },
                      child: new Card(
                        elevation: 12,
                        color: backgroundColor13,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
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
                                    '${allDokumens[index].keterangan_belanja}',
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Text(
                                    '${allDokumens[index].instansi.nama_instansi}',
                                    style: subtitleTextStyle.copyWith(
                                      fontWeight: light,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icon_information.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: filteredDokumens.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/detailDokumen',
                            arguments: jsonEncode(filteredDokumens[index]));
                      },
                      child: new Card(
                        elevation: 12,
                        color: backgroundColor13,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
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
                                    '${filteredDokumens[index].keterangan_belanja}',
                                    style: primaryTextStyle.copyWith(
                                      fontWeight: semiBold,
                                    ),
                                  ),
                                  Text(
                                    '${filteredDokumens[index].instansi.nama_instansi}',
                                    style: subtitleTextStyle.copyWith(
                                      fontWeight: light,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/icon_information.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      ),
                    );
                  })
          // child: ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: filteredDokumens.length,
          //     itemBuilder: (BuildContext context, index){
          //       return GestureDetector(
          //         onTap: () {
          //           Navigator.of(context).pushNamed('/detailDokumen', arguments: jsonEncode(filteredDokumens[index]));
          //         },
          //         child: new Card(
          //           elevation: 12,
          //           color: backgroundColor13,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(12),
          //           ),
          //           child: Row(
          //             children: [
          //               SizedBox(
          //                 width: 15,
          //               ),
          //               Container(
          //                 width: 40,
          //                 height: 80,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(5),
          //                   image: DecorationImage(
          //                     image: AssetImage(
          //                       'assets/icon_goverment.png',
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: 12,
          //               ),
          //               Expanded(
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       '${filteredDokumens[index].keterangan_belanja}',
          //                       style: primaryTextStyle.copyWith(
          //                         fontWeight: semiBold,
          //                       ),
          //                     ),
          //                     Text(
          //                       '${filteredDokumens[index].instansi.nama_instansi}',
          //                       style: subtitleTextStyle.copyWith(
          //                         fontWeight: light,
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //               Container (
          //                 width: 23,
          //                 height: 23,
          //                 decoration: BoxDecoration(
          //                   shape: BoxShape.circle,
          //                   image: DecorationImage(image: AssetImage('assets/icon_information.png'),),
          //                 ),
          //               ),
          //               SizedBox(
          //                 width: 15,
          //               ),
          //             ],
          //           ),
          //         ),
          //       );
          //     }
          // ),

          );
    }

    return ListView(
      children: [
        header(),
        titlePage(),
        search(),
        signInButton(),
        item(),
      ],
    );
  }
}

Future<AwesomeDialog> filtered(BuildContext context) async {
  return AwesomeDialog(
    context: context,
    animType: AnimType.scale,
    dialogType: DialogType.question,
    body: Center(
      child: Text(
        'If the body is specified, then title and description will be ignored, this allows to 											further customize the dialogue.',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
    ),
    title: 'This is Ignored',
    desc: 'This is also Ignored',
    btnOkOnPress: () {},
    btnCancelOnPress: () {},
  )..show();
}
