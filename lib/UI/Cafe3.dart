import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/Utils/CommonWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class Cafe3 extends StatefulWidget {
  const Cafe3({Key key}) : super(key: key);
  @override
  _Cafe3State createState() => _Cafe3State();
}

class _Cafe3State extends State<Cafe3> {
  Future<void> _launched;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text("Details",style: GoogleFonts.openSans(
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),),
        leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
      ),
      bottomSheet:  Container(
        padding: EdgeInsets.only(
          left: SizeConfig.screenWidth * 0.05,
          right: SizeConfig.screenWidth * 0.05,
          top: SizeConfig.blockSizeVertical * 3,
        ),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.5,
              blurRadius: 0.9,
              offset: Offset.fromDirection(2,1),
            )],
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/CancelAppointment');
              },
              color: Colors.white,
              minWidth: SizeConfig.screenWidth * 0.4,
              child: Text("CANCEL",style: GoogleFonts.openSans(
                color: Color(fontColorGray),
              ),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Color(fontColorGray)
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                setState(() {
                  _launched = makePhoneCall();
                });
           //     Navigator.of(context).pushNamed('/');
              },
              color: Colors.blue,
              minWidth: SizeConfig.screenWidth * 0.4,
              child: Text("CALL",style: GoogleFonts.openSans(
                color: Colors.white,
              ),),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Colors.blue
                ),
              ),
            ),
          ],
        ),),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.screenWidth,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 3,
              ),
              child: CircleAvatar(
                radius: SizeConfig.blockSizeVertical * 8,
                backgroundImage: AssetImage('assets/bg/profile.png'),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                top: SizeConfig.blockSizeVertical * 1.5,
              ),
              child: Text("Suman Aggarwal",
              style: GoogleFonts.openSans(
                color: Color(fontColorSteelGrey),
                fontWeight: FontWeight.w600,
              ),),
            ),
            Center(
              child: Container(
                width: SizeConfig.screenWidth * 0.25,
                margin: EdgeInsets.only(
                  top: SizeConfig.blockSizeVertical * 1.5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:(){
                        setState(() {
                          _launched = makePhoneCall();
                        });
                      },
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
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.05,
                top: SizeConfig.blockSizeVertical * 1.5,
                right: SizeConfig.screenWidth * 0.05,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ABOUT THE CLIENT",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("AGE:",style: GoogleFonts.openSans(
                            color: Color(fontColorGray),
                            fontWeight: FontWeight.w600,
                          ),),
                          Text(" 28",style: GoogleFonts.openSans(
                            color: Color(fontColorGray),
                            fontWeight: FontWeight.w400,
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          Text("GENDER:",style: GoogleFonts.openSans(
                            color: Color(fontColorGray),
                            fontWeight: FontWeight.w600,
                          ),),
                          Text(" Female",style: GoogleFonts.openSans(
                            color: Color(fontColorGray),
                            fontWeight: FontWeight.w400,
                          ),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2.5,
                  ),
                  Text("APPOINTMENT DETAILS",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2.5,
                  ),
                  Row(
                    children: [
                      Text("DATE:",style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w600,
                      ),),
                      Text(" 10 July",style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w400,
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2.5,
                  ),
                  Row(
                    children: [
                      Text("TIME:",style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w600,
                      ),),
                      Text(" 08:00 AM - 09:00 AM",style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w400,
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2.5,
                  ),
                  Row(
                    children: [
                      Text("COMMENTS:",style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w600,
                      ),),
                      Text(" \t Edit",style: GoogleFonts.openSans(
                        color: Color(backgroundColorBlue),
                        fontWeight: FontWeight.w400,
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  Text("Not Available",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w400,
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2.5,
                  ),
                  Row(
                    children: [
                      Text("ATTACHMENTS:",style: GoogleFonts.openSans(
                        color: Color(fontColorGray),
                        fontWeight: FontWeight.w600,
                      ),),
                      Text(" \t Edit",style: GoogleFonts.openSans(
                        color: Color(backgroundColorBlue),
                        fontWeight: FontWeight.w400,
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical,
                  ),
                  Text("Not Available",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w400,
                  ),),
                  SizedBox(
                    height: SizeConfig.blockSizeVertical * 2.5,
                  ),
                  Text("ASSESSMENTS TAKEN:",style: GoogleFonts.openSans(
                    color: Color(fontColorGray),
                    fontWeight: FontWeight.w600,
                  ),),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
