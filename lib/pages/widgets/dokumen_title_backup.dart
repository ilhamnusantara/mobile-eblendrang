import 'package:app_eblendrang/models/dokumen_model_backup2.dart';
import 'package:app_eblendrang/themes.dart';
import 'package:flutter/material.dart';

class DataTitle extends StatelessWidget{
  final DokumenModel dokumen;
  DataTitle(this.dokumen);
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: backgroundColor13,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon_data.png',
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
                  dokumen.keterangan_belanja,
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                    'Kelurahan Kalijaten',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: reguler,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            child : Ink(
              decoration: ShapeDecoration(
                color: Colors.black,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Container(
                  // margin: EdgeInsets.only(top: 50, bottom: 50),
                  child: Image.asset(
                    'assets/icon_information.png',
                    width: 27,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/detailDokumen');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}