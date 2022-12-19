import 'dart:convert';
import 'package:app_eblendrang/models/instansi_model.dart';
import 'package:app_eblendrang/models/user_model.dart';
import 'package:app_eblendrang/pages/widgets/instansi_title.dart';
import 'package:app_eblendrang/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_eblendrang/themes.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _getInstansi();
  }

  List<InstansiModel> allinstansis = [];

  Future<void> _getInstansi() async {
    try {
      final response =
          await http.get(Uri.parse("http://e-blendrang.id/api/dokumenValue"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['data'] as List<dynamic>;
        setState(() {
          allinstansis = [];
          allinstansis = data.map((e) => InstansiModel.fromJson(e)).toList();
          // filteredDokumens = allDokumens;
          // _get = data;
          print(data);
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

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
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: allinstansis.length,
          padding: new EdgeInsets.only(
            top: 10,
          ),
          itemBuilder: (BuildContext context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/detailDokumen',
                    arguments: jsonEncode(allinstansis[index]));
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
                            '${allinstansis[index].nama_instansi}',
                            style: primaryTextStyle.copyWith(
                              fontWeight: semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${allinstansis[index].data_null} Item',
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
        ),
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
