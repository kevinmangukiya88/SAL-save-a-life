import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';
import 'package:mental_health/UI/AddNewEvent.dart';

class Article extends StatefulWidget {
  String image;
  String title;
  String description;
   Article({this.image,this.description,this.title }) ;

  @override
  _EventSummaryState createState() => _EventSummaryState();
}

class _EventSummaryState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              width: SizeConfig.screenWidth,
              alignment: Alignment.centerLeft,
              height: SizeConfig.screenHeight * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: NetworkImage(widget.image),
                    fit: BoxFit.fill
                ),
              ),
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
              margin: EdgeInsets.all(15),
              width: SizeConfig.screenWidth,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: SizeConfig.screenWidth,

                    child: Text(
                      "EVENT NAME : ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Color(fontColorGray),
                      ),
                    ),
                  ),
SizedBox(height: 20,),
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
                  SizedBox(height: 10,),
                  Container(
                    width: SizeConfig.screenWidth,
                    child: Text(
                     widget.description,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Color(fontColorGray),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),



          ],
        ),
      )]))));

  }
}
