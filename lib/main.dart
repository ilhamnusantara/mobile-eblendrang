// @dart=2.9

import 'package:app_eblendrang/pages/addData_page.dart';
import 'package:app_eblendrang/pages/detail_dokumen.dart';
import 'package:app_eblendrang/pages/edit_profile.dart';
import 'package:app_eblendrang/pages/home/dokumen_page.dart';
import 'package:app_eblendrang/pages/home/main_page.dart';
import 'package:app_eblendrang/pages/splash_page.dart';
import 'package:app_eblendrang/pages/sign_in_page.dart';
import 'package:app_eblendrang/providers/auth_provider.dart';
import 'package:app_eblendrang/providers/dokumen_provider.dart';
import 'package:flutter/material.dart';
import 'package:app_eblendrang/pages/splash_screen_page.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
            create: (context) => DokumenProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SpashScreenPage(),
          // '/': (context) => SplashScreen(),
          '/sign-in': (context) => SigninPage(),
          '/home': (context) => MainPage(),
          // '/detailDokumen' : (context) => DetailPage(),
          '/edit-profile' : (context) => EditProfilePage(),
          '/addAll' : (context) => AddData(),
          // '/coba' : (context) => coba(),
        },
      ),
    );
  }
}