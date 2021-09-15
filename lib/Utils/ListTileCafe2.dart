import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/SizeConfig.dart';

import 'Colors.dart';

Widget listTileCafe2(BuildContext context,
    String contactName,
    String time,){
  SizeConfig().init(context);
  return InkWell(
    onTap: (){
      Navigator.of(context).pushNamed('/Cafe3');
    },
    child: Container(
      //color: Colors.blue[900],
      margin: EdgeInsets.only(
          bottom: SizeConfig.blockSizeVertical * 2,
          right: SizeConfig.screenWidth * 0.05
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: SizeConfig.screenWidth * 0.1,
            child: Text(time,style: GoogleFonts.openSans(
                color: Color(fontColorGray),
                fontWeight: FontWeight.w400
            ),),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.45,
            child: Text(contactName,style: GoogleFonts.openSans(
                color: Color(fontColorGray),
                fontWeight: FontWeight.w400
            ),),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.25,
            height: SizeConfig.blockSizeVertical * 5,
            alignment: Alignment.center,
            child:Text("RATE",style: GoogleFonts.openSans(
              color: Colors.blue
            ),),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical),
              shape: BoxShape.rectangle,
              border: Border.all(
                color: Colors.blue,
                width: 1.0
              )
            ),
          ),
        ],
      ),
    ),
  );
}