import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:nb_utils/nb_utils.dart';

Widget listTileAppointment(BuildContext context,
    String contactName,
    String time,
    Function onTap,
    ){
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
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 2,
          ),
          Container(
            width: SizeConfig.screenWidth * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(contactName,style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w400
                ),),
                Text("Today",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                  fontSize: SizeConfig.blockSizeVertical * 1.5
                ),),
              ],
            ),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/icons/Ellipse 3.png'),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Image.asset('assets/icons/call.png',
                      scale: SizeConfig.blockSizeVertical * 0.5,),
                    padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.5),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    toast("In Progress");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/icons/Ellipse 3.png'),
                            fit: BoxFit.cover
                        )
                    ),
                    child: Image.asset('assets/icons/video call.png',
                      scale: SizeConfig.blockSizeVertical * 0.5,),
                    padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 1.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}