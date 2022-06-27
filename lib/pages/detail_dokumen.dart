import 'package:flutter/material.dart';
import 'package:app_eblendrang/themes.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _DetailPage();
  }
}

class _DetailPage extends State<DetailPage>{
  TextEditingController dateInput = TextEditingController();
  TextEditingController dateInput2 = TextEditingController();
  @override
  void initState() {
    dateInput.text = "";
    dateInput2.text = "";//set the initial value of text field
    // super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget header(){
      return AppBar(
        backgroundColor: backgroundColor2,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.white,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Detail Dokumen',
          style: secondTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: primaryColor,
            ),
            onPressed: (){},
          ),
        ],
        foregroundColor: blck,
      );
    }
    Widget tesnameInput(){
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Nama Instansi',
              style: primaryTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Kelurahan Kalijaten',
                hintStyle: subtitleTextStyle,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: grayChoose,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget nameInstansi(){
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Instansi',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height:12,
            ),
            Container(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                          readOnly: true,
                          style: primaryTextStyle,
                          decoration: InputDecoration(
                            hintText: 'Kelurahan Kalijaten',
                            hintStyle: inputStyle,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: grayChoose,
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    Widget noSPK(){
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor Surat Perjanjian Kerja',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height:12,
            ),
            Container(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_code.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                          style: primaryTextStyle,
                          decoration: InputDecoration(
                            hintText: '027/4.3.2.1/PPKom.438.7.7.7/2022',
                            hintStyle: inputStyle,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: grayChoose,
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    Widget dateSPK(){
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal Surat Perjanjian Kerja',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height:12,
            ),
            Container(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_date.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                          controller: dateInput,
                          style: primaryTextStyle,
                          readOnly: true,
                          onTap: () async{
                            DateTime dateSPK = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                            );
                            if(dateSPK != null){
                              print(dateSPK);
                              String formattedDate = DateFormat('dd-MM-yyyy').format(dateSPK);
                              print(formattedDate);
                              setState((){
                                dateInput.text = formattedDate;
                              });
                            }else{
                              print("Tanggal Kosong");
                            }
                          },
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    Widget noBAST(){
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nomor Berita Acara Serah Terima',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height:12,
            ),
            Container(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_code.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                          style: primaryTextStyle,
                          decoration: InputDecoration(
                            hintText: '027/4.3.2.4/PPKom.438.7.7.7/2022',
                            hintStyle: inputStyle,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: grayChoose,
                              ),
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    Widget dateBAST(){
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tanggal Berita Acara Serah Terima',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height:12,
            ),
            Container(
              height: 40,
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_date.png',
                      width: 25,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                          controller: dateInput2,
                          style: primaryTextStyle,
                          readOnly: true,
                          onTap: () async{
                            DateTime dateBAST = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if(dateBAST != null){
                              print(dateBAST);
                              String formattedDate = DateFormat('dd-MM-yyyy').format(dateBAST);
                              print(formattedDate);
                              setState((){
                                dateInput2.text = formattedDate;
                              });
                            }else{
                              print("Tanggal Kosong");
                            }
                          },
                        )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content(){
      return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: marginLogin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                children: [
                  Text('VacumCleaner', style: primaryTextStyle.copyWith(
                    fontSize: 25,
                    fontWeight: reguler,
                  ),),
                ],
              ),
            ),
            // tesnameInput(),
            nameInstansi(),
            noSPK(),
            dateSPK(),
            noBAST(),
            dateBAST(),
          ],
        ),
      );
    }
    return Scaffold(
      backgroundColor: backgroundColor15,
      appBar: header(),
      body :content(),
    );
  }
}