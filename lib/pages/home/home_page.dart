import 'dart:convert';
import 'package:app_eblendrang/models/instansi_model.dart';
import 'package:app_eblendrang/models/models.dart';
import 'package:app_eblendrang/models/user_model.dart';
import 'package:app_eblendrang/pages/page.dart';
import 'package:app_eblendrang/pages/widgets/instansi_title.dart';
import 'package:app_eblendrang/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_eblendrang/themes.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../blocs/blocs_exports.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   _getInstansi();
  // }

  // List<Instansi> allinstansis = [];

  // Future<void> _getInstansi() async {
  //   try {
  //     final response =
  //         await http.get(Uri.parse("http://103.23.198.126/api/dokumenValue"));
  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body)['data'] as List<dynamic>;
  //       setState(() {
  //         allinstansis = data.map((e) => Instansi.fromJson(e)).toList();
  //         // filteredDokumens = allDokumens;
  //         // _get = data;
  //         print(data);
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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

    Widget item() {
      return Container(
        margin: EdgeInsets.only(
          top: 8,
          left: marginLogin,
          right: marginLogin,
        ),
        child:
            BlocBuilder<DokumenBloc, DokumenState>(builder: (context, state) {
          if (state is DokumenLoadingState) {
            return CircularProgressIndicator();
          } else if (state is DokumenLoadedState) {
            List<Instansi> dokumen = state.dokumenList;
            if (dokumen.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: dokumen.length,
                padding: new EdgeInsets.only(
                  top: 10,
                ),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DokumenInstansi(
                                docList: dokumen[index].dokumenList,
                                namaInstansi: dokumen[index].namaInstansi,
                              )));
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
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${dokumen[index].namaInstansi}',
                                  style: primaryTextStyle.copyWith(
                                    fontWeight: semiBold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '${dokumen[index].data_null} Item',
                            style: inputStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: primaryTextStyle,
                ),
              );
            }
          } else {
            return const Center(
              child: Text("ERROR"),
            );
          }
        }),
      );
    }

    return ListView(
      children: [
        header(),
        titlePage(),
        item(),
      ],
    );
  }
}
