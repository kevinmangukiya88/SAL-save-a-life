import 'package:flutter/material.dart';
import 'package:mental_health/Utils/Colors.dart';
import 'package:mental_health/Utils/SizeConfig.dart';



class Help extends StatefulWidget {
  const Help({Key key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_rounded,color: Color(midnightBlue),),
        ),
        centerTitle: true,
        title: Text("Help",
          style: TextStyle(
              color: Color(midnightBlue),
              fontWeight: FontWeight.w600
          ),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical * 2,
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenWidth * 0.02,
                vertical: SizeConfig.blockSizeVertical
              ),
              child: Text("Frequently Asked Questions",
              style: TextStyle(
                color: Color(backgroundColorBlue),
                fontWeight: FontWeight.w600
              ),),
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02
              ),
              alignment: Alignment.center,
              child: ListTileTheme(
                dense: true,
                contentPadding: EdgeInsets.all(0),
                child: ExpansionTile(title: Text("How do I cancel my booking?",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(fontColorSteelGrey),
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  tilePadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.02,
                      vertical: 0
                  ),
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02
              ),
              alignment: Alignment.center,
              child: ListTileTheme(
                dense: true,
                contentPadding: EdgeInsets.all(0),
                child: ExpansionTile(title: Text("How do I use my remaining sessions?",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(fontColorSteelGrey),
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  tilePadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.02,
                      vertical: 0
                  ),
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02
              ),
              alignment: Alignment.center,
              child: ListTileTheme(
                dense: true,
                contentPadding: EdgeInsets.all(0),
                child: ExpansionTile(title: Text("Is my information safe?",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(fontColorSteelGrey),
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  tilePadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.02,
                      vertical: 0
                  ),
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02
              ),
              alignment: Alignment.center,
              child: ListTileTheme(
                dense: true,
                contentPadding: EdgeInsets.all(0),
                child: ExpansionTile(title: Text("Frequently asked Question ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(fontColorSteelGrey),
                      fontSize: SizeConfig.blockSizeVertical * 1.5
                  ),),
                  tilePadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.02,
                      vertical: 0
                  ),
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02
              ),
              alignment: Alignment.center,
              child: ListTileTheme(
                dense: true,
                contentPadding: EdgeInsets.all(0),
                child: ExpansionTile(title: Text("Connect with SAL",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(backgroundColorBlue),
                  ),),
                  tilePadding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth * 0.02,
                      vertical: 0
                  ),
                ),
              ),
            ),
            Container(
              width: SizeConfig.screenWidth,
              margin: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.02
              ),
              padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * 0.02
              ),
              alignment: Alignment.centerLeft,
              child: Text("Sal Email Id",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(fontColorSteelGrey),
                    fontSize: SizeConfig.blockSizeVertical * 1.5
                ),),
            ),
          ],
        ),
      ),
    ));
  }
}
