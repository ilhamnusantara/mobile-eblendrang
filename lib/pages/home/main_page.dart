import 'package:app_eblendrang/pages/home/dokumen_page.dart';
import 'package:app_eblendrang/pages/home/home_page.dart';
import 'package:app_eblendrang/themes.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget addButton() {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addAll');
        },
        backgroundColor: Colors.white,
        child: Image.asset(
          'assets/icon_add.png',
          width: 38,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 14,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                print(value);
                setState(() {
                  currentIndex = value;
                });
              },
              backgroundColor: backgroundColor10,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_home3.png',
                      width: 25,
                      color: currentIndex == 0 ? goldChoose : grayChoose,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_dokumen2.png',
                      width: 25,
                      color: currentIndex == 1 ? goldChoose : grayChoose,
                    ),
                  ),
                  label: '',
                ),
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return DokumenPage();
          break;
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor15,
      floatingActionButton: addButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
