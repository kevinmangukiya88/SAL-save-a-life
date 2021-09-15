import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/UI/AddNewEvent.dart';

class EventSummary extends StatefulWidget {
  const EventSummary({Key key}) : super(key: key);

  @override
  _EventSummaryState createState() => _EventSummaryState();
}

class _EventSummaryState extends State<EventSummary> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight * 0.1,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.04
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(7),
              topLeft: Radius.circular(7),
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 9.0,
                  spreadRadius: 4,
                  offset: Offset(1,1)
              ),
            ]
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
              child: Text("EDIT",style: GoogleFonts.openSans(
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
              onPressed: (){Navigator.of(context).pushNamed('/EventSuccess');
              },
              color: Colors.blue,
              minWidth: SizeConfig.screenWidth * 0.4,
              child: Text("SUBMIT",style: GoogleFonts.openSans(
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
        )
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color(0XFFD8DFE9),
              width: SizeConfig.screenWidth,
              alignment: Alignment.centerLeft,
              height: SizeConfig.screenHeight * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: Color(0XFFD8DFE9),
                    elevation: 0.0,
                    leading: InkWell(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Color(midnightBlue),
                      ),
                    ),
                    centerTitle: true,
                    title: Text("Summary",
                    style: TextStyle(
                      color: Color(midnightBlue),
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                ],
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.03,
                vertical: SizeConfig.blockSizeVertical
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 0.5),
                    child: Text(
                      "EVENT NAME",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    child: Text(
                      eventName.text,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.only(
                      right: SizeConfig.screenWidth * 0.25,
                      top: SizeConfig.blockSizeVertical * 0.5,
                      bottom: SizeConfig.blockSizeVertical * 0.5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "DATE",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(fontColorGray),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                               eventDate.text,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(fontColorGray),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "TIME",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Color(fontColorGray),
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                               eventTime.text,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Color(fontColorGray),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 0.5),
                    child: Text(
                      "EVENT DESCRIPTION",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    child: Text(
                     eventDesc.text,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(fontColorGray),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 0.5),
                    child: Text(
                      "TOPIC",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    child: Text(
                     eventTopic.text,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical * 0.5),
                    child: Text(
                      "PRICE PER TICKET",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    child: Text(
                      priceValue.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.2,
            ),
          ],
        ),
      ),
    ));
  }
}
